#ifndef _NETWORK_H_
#define _NETWORK_H_

//#define DEBUG

#ifdef DEBUG
#define DEBUG_MSG(str) do { std::cout << str; } while( false )
#else
#define DEBUG_MSG(str) do { } while ( false )
#endif


#include <iostream>
#include <boost/asio.hpp>
#include <boost/thread/future.hpp>
#include <set>
#include <queue>
#include <vector>


using namespace boost;
using asio::ip::tcp;

class connection {
public:
    virtual ~connection() {}
    virtual boost::unique_future <bool> send(const std::vector <unsigned char> _data) = 0;
    virtual void send(const std::vector <unsigned char> _data, std::function<void()>) = 0;
    virtual boost::unique_future <std::vector <unsigned char>> recv() = 0;
    virtual void recv(std::function<void(std::vector <unsigned char>)> on_recv_handler) = 0;
    virtual void disconnect() = 0;
};

typedef std::shared_ptr<connection> connection_ptr;

class multi_party : public std::enable_shared_from_this <multi_party> {

public:

    multi_party(int _player_num, int _num_players, int _base_port, asio::io_context * _p_ctx) {
        multi_party(_player_num, _num_players, 1, _base_port, _p_ctx);
    }

    multi_party(int _player_num, int _num_players, int _num_channels, int _base_port, asio::io_context * _p_ctx) {
        player_num = _player_num;
        num_players = _num_players;
        num_channels = _num_channels;
        base_port = _base_port;
        p_ctx = _p_ctx;
        num_outgoing_connections = 0;
        num_incoming_connections = 0;
        has_recved.resize(num_players + 1);
        for (int i = 1; i < num_players + 1; i++){
            if (i != player_num)
                has_recved[i].resize(num_channels);
        }
        recv_handlers.resize(num_players + 1);
        recv_handler_stacks.resize(num_players + 1);
        on_connect_start_promises.resize(num_players + 1);
        connected = false;
        disconnecting = false;
    }

    void disconnect() {
        // tear down all sockets
        disconnecting = true;

        for (int i = 1; i < num_players + 1; i++) {
            if (i != player_num) {
                for (int j = 0; j < num_channels; j++) {
                    send_connections_[i][j]->disconnect();
                    recv_connections_[i][j]->disconnect();
                }
            }
        }
    }

    bool isDisconnecting() {
        return disconnecting;
    }

    void onConnected() {
        asio::steady_timer m_timer(*p_ctx, asio::chrono::seconds(2));
        m_timer.expires_from_now(asio::chrono::seconds(2));
        m_timer.async_wait([this] (const system::error_code &ec) {
            int test = 1234;
            std::vector <unsigned char> buf(sizeof(int));
            memcpy(buf.data(), &test, sizeof(int));
            int send_player = player_num + 1;
            if (send_player > num_players)
                send_player = 1;
            DEBUG_MSG ( "connected network!" << std::endl );
//            send(send_player, buf);

            for (int j = 1; j < num_players + 1; j++){
                if (j != player_num){                    
                    for (int i = 0; i < num_channels; i++) {
                        DEBUG_MSG ( "player " << player_num << "> sending to player " << j << " on channel " << i << std::endl);
                        send(j, i, buf);
                    }
                }
            }
        });
    }

    void add_send(int player_j, connection_ptr conn) {
        add_send(player_j, 0, conn);
    }

    void add_send(int player_j, int channel, connection_ptr conn) {
        if (send_connections_.size() != num_players + 1)
            send_connections_.resize(num_players+1);

        if (send_connections_[player_j].size() != num_channels)
            send_connections_[player_j].resize(num_channels);

        send_connections_[player_j][channel] = conn;
        num_outgoing_connections++;
        std::cout << "player " << player_num << "> connected to player " << player_j << " on channel " << channel << std::endl;
        if ((num_incoming_connections == (num_players - 1)*num_channels) && (num_outgoing_connections == (num_players - 1)*num_channels)) {
            onConnected();
        }
    }

    void add_recv(int player_j, connection_ptr conn) {
        add_recv(player_j, 0, conn);
    }

    void add_recv(int player_j, int channel, connection_ptr conn) {
        if (recv_connections_.size() != num_players + 1)
            recv_connections_.resize(num_players+1);

        if (recv_connections_[player_j].size() != num_channels)
            recv_connections_[player_j].resize(num_channels);

        recv_connections_[player_j][channel] = conn;
        has_recved[player_j][channel] = false;
        num_incoming_connections++;
        std::cout << "player " << player_num << "> player " << player_j << " connected on channel " << channel << std::endl;

        if ((num_incoming_connections == (num_players - 1)*num_channels) && (num_outgoing_connections == (num_players - 1)*num_channels)) {
            onConnected();
        }
    }

    boost::unique_future <bool> send(int player_j, const std::vector <unsigned char> _data) {
        return send(player_j, 0, _data);
    }

    boost::unique_future <std::vector <unsigned char>> recv(int player_j) {
        return recv(player_j, 0);
    }

    void recv(int player_j, std::function<void(std::vector <unsigned char>)> on_recv_handler) {
        recv(player_j, 0, on_recv_handler);
    }   

    void send(int player_j, const std::vector <unsigned char> _data, std::function<void()> on_send_handler) {
        send(player_j, 0, _data, on_send_handler);
    }

    boost::unique_future <bool> send(int player_j, int channel, const std::vector <unsigned char> _data) {


        if (player_j == player_num) {
            std::cout << "mp_network.h:114 -- can't send() to self!" << std::endl;
            exit(-1);
        } else {
          return send_connections_[player_j][channel]->send(_data);
        }
    }

    void send(int player_j, int channel, const std::vector <unsigned char> _data, std::function<void()> on_send_handler) {
        if (player_j == player_num) {
            std::cout << "mp_network.h:163 -- can't send() to self!" << std::endl;
            exit(-1);
        }

        send_connections_[player_j][channel]->send(_data, on_send_handler);
    }

    boost::unique_future <std::vector <unsigned char>> recv(int player_j, int channel) {

        if (player_j == player_num) {
            std::cout << "mp_network.h:112 -- can't recv() from self!" << std::endl;
            exit(-1);
        }

        return recv_connections_[player_j][channel]->recv();
    }

    void recv(int player_j, int channel, std::function<void(std::vector <unsigned char>)> on_recv_handler) {

        if (player_j == player_num) {
            std::cout << "mp_network.h:112 -- can't recv() from self!" << std::endl;
            exit(-1);
        }

        recv_connections_[player_j][channel]->recv(on_recv_handler);
    }   

/*
    void set_connect_promise(boost::promise <bool> * _on_connect_promise) {
        on_connect_promise = _on_connect_promise;
    }
*/
    boost::unique_future <bool> get_on_connect_future() {
        return on_connect_promise.get_future();
    }

    boost::unique_future <bool> get_on_connect_start_future(int player_j) {
        DEBUG_MSG ( player_j << std::endl);
        return on_connect_start_promises[player_j].get_future();
    }

    void set_connect_handler(std::function<void(boost::system::error_code)> _on_connect_handler) {
        on_connect_handler = _on_connect_handler;
    }

    void set_recv_handler(std::function<void(int, std::vector <unsigned char>, boost::system::error_code)> _on_recv_handler) {
        on_recv_handler = _on_recv_handler;
    }

    void set_recv_handler(int player_j, std::function<void(int, std::vector <unsigned char>, boost::system::error_code)> _on_recv_handler) {
        recv_handlers[player_j] = _on_recv_handler;
    }

    void push_recv_handler(int player_j, std::function<void(int, std::vector <unsigned char>, boost::system::error_code)> _on_recv_handler) {
        recv_handler_stacks[player_j].push_front(_on_recv_handler);        
    }

    void pop_recv_handler(int player_j) {
        recv_handler_stacks[player_j].pop_front();        
    }

    void on_recv(int player_j, int channel, std::vector <unsigned char> _data) {

        if (connected) {
            DEBUG_MSG ( "got here: on_recv past connected" << std::endl);
            system::error_code ec;

            if (on_recv_handler != nullptr)
                on_recv_handler(player_j, _data, ec);

            if (recv_handlers[player_j] != nullptr)
                recv_handlers[player_j](player_j, _data, ec);

            if (recv_handler_stacks[player_j].front() != nullptr)
                recv_handler_stacks[player_j].front()(player_j, _data, ec);

        } else {
            DEBUG_MSG ( "got here: on_recv no connected" << std::endl);

            has_recved[player_j][channel] = true;

            int recv_data;
            memcpy(&recv_data, _data.data(), sizeof(int));
            DEBUG_MSG("received from " << player_j << ": " << recv_data);
//            for (int i = 0; i < _data.size(); i++) printf("%.2X", _data[i]);
//            printf("\n");

            bool all_recved = true;

            for (int j = 1; j < num_players + 1; j++) {
                if (j != player_num) {
                    for (int i = 0; i < num_channels; i++) {
                        if (!has_recved[j][i])
                            all_recved = false;            
                    }
                }
            }

            if (all_recved){
                DEBUG_MSG ( "recevied msg from all players on all channels!" << std::endl);
                system::error_code ec;
                if (on_connect_handler != nullptr)
                    on_connect_handler(ec);
                               
                for (int j = 1; j < num_players + 1; j++) {
                    if (j != player_num)
                        on_connect_start_promises[j].set_value(true);
                }
                connected = true;
                on_connect_promise.set_value(true);
            }
        }

        // we know there is a msg on player_j recv queue, read it
    }

private:

    int num_players;
    int num_channels;
    int num_outgoing_connections;
    int num_incoming_connections;
    int player_num;
    int base_port;
    bool connected;
    bool disconnecting;
    
    boost::promise<bool> on_connect_promise;
    std::vector <boost::promise<bool>> on_connect_start_promises;

    std::function<void(boost::system::error_code)> on_connect_handler;
    std::function<void(int, std::vector <unsigned char>, boost::system::error_code)> on_recv_handler;
    std::vector <std::function<void(int, std::vector <unsigned char>, boost::system::error_code)>> recv_handlers;
    std::vector <std::deque <std::function<void(int, std::vector <unsigned char>, boost::system::error_code)>>> recv_handler_stacks;
    asio::io_context * p_ctx;
    std::vector <std::vector <connection_ptr>> send_connections_;
    std::vector <std::vector <connection_ptr>> recv_connections_;
    std::vector <unsigned char> local_recv_data;
    std::vector <std::vector <bool>> has_recved;
    

};


class session : public connection, public std::enable_shared_from_this <session> {

public:
    session(tcp::socket _socket, multi_party * _party, int _player_num, int _num_players, int _num_channels, int _base_port)
        : socket(std::move(_socket)) {
        player_num = _player_num;
        num_players = _num_players;
        num_channels = _num_channels;
        base_port = _base_port;
        m_party = _party;
        msg_header.resize(sizeof(int));
    }

    void disconnect() {

		boost::system::error_code ec;
		socket.shutdown(boost::asio::ip::tcp::socket::shutdown_both, ec);
		socket.close(ec);
    }

    void start_listen() {
//        m_party->add_recv(player_num, shared_from_this());
        do_read_player();
    }

    void connect(int player_j, int _channel) {
        channel = _channel;
        m_party->add_send(player_j, channel, shared_from_this());
    //    std::cout << "do_write_player(" << player_num << ")" << std::endl;
        do_write_player(player_num, channel);
    }

    void send (const std::vector <unsigned char> _data, std::function<void()> on_send_handler) {
        std::tuple <std::vector <unsigned char>, boost::promise <bool> *, std::function<void()>> write_tuple;
        std::get<0>(write_tuple) = _data;
        std::get<1>(write_tuple) = nullptr;
        std::get<2>(write_tuple) = on_send_handler;
        write_tuples.push_back(write_tuple);
        do_write();
    }

    boost::unique_future <bool> send (const std::vector <unsigned char>_data) {
        boost::promise <bool> * write_promise = new boost::promise <bool>();
//        bool write_in_progress = !write_msgs.empty();
//        write_msgs.push_back(_data);
//        write_promises.push_back(write_promise);
        std::tuple <std::vector <unsigned char>, boost::promise <bool> *, std::function<void()>> write_tuple;
        std::get<0>(write_tuple) = _data;
        std::get<1>(write_tuple) = write_promise;
        std::get<2>(write_tuple) = nullptr;
        write_tuples.push_back(write_tuple);
        do_write();
        return write_promise->get_future();
    }

  void empty_read_queue() {

        while (! blocked_recv_promises.empty() && !read_msgs.empty()) {
         //   std::cout << "here" << std::endl;
            std::vector <unsigned char> _data(read_msgs.front().size());
            memcpy(_data.data(), read_msgs.front().data(), _data.size());
            read_msgs.pop_front();

            if (blocked_recv_promises.front().second == nullptr) {
                boost::promise <std::vector <unsigned char>> * recv_promise = blocked_recv_promises.front().first;
                blocked_recv_promises.pop_front();
                recv_promise->set_value(_data);
            } else {
                blocked_recv_promises.front().second(_data);
                blocked_recv_promises.pop_front();
            }
        }
     //   std::cout << "exiting here" <<std::endl;

    }

    void recv(std::function<void(std::vector <unsigned char>)> on_recv_handler) {
        std::pair <boost::promise <std::vector <unsigned char>> *, std::function<void(std::vector <unsigned char>)>> recv_pair;
        recv_pair.first = nullptr;
        recv_pair.second = on_recv_handler;
        blocked_recv_promises.push_back(recv_pair);

        if (read_mutex.try_lock()) {
            empty_read_queue();
            read_mutex.unlock();
        }
    }
   

    boost::unique_future <std::vector <unsigned char>> recv() {
        boost::promise <std::vector <unsigned char>> * recv_promise = new boost::promise <std::vector <unsigned char>>();
        boost::unique_future <std::vector <unsigned char>> recv_future = recv_promise->get_future();

        std::pair <boost::promise <std::vector <unsigned char>> *, std::function<void(std::vector <unsigned char>)>> recv_pair;
        recv_pair.first = recv_promise;
        recv_pair.second = nullptr;
        blocked_recv_promises.push_back(recv_pair);
        if (read_mutex.try_lock()) {
            empty_read_queue();
            read_mutex.unlock();
        }
        return recv_future;
    }

  

private:


    void do_read_body(int player_j)
    {
        DEBUG_MSG ( "channel " << channel << ": do_read_body() to read size: " << read_msg_.size() << std::endl);
        auto self(shared_from_this());
        boost::asio::async_read(socket,
            boost::asio::buffer(read_msg_.data(), read_msg_.size()),
            [this, self, player_j](boost::system::error_code ec, std::size_t /*length*/) {
                if (!ec) {
                    #ifdef DEBUG
                        printf("\nread: ");
                        for (int i = 0 ; i < read_msg_.size(); i++) printf("%.2X", read_msg_[i]);
                        printf("\n");
                    #endif

                    read_msgs.emplace_back(read_msg_);
                    // empty promise / read queues
              //      std::cout << "got here bind_executor" <<std::endl;
//                    empty_read_queue();
                    if (read_mutex.try_lock()) {
                        empty_read_queue();
                        read_mutex.unlock();
                    }
            //        boost::asio::bind_executor(asio::make_strand(socket.get_executor()), std::bind(&session::empty_read_queue, this));
       //             std::cout << "got past bind_executor" <<std::endl;

/*
                        // do something with the read msg
                        //m_party.send(read_msg_);
                        DEBUG_MSG ("read " << read_msg_.size() << " bytes" << std::endl);
                        if (blocked_recv_promises.empty()) {
                            DEBUG_MSG ("read emplace_back" << std::endl);
                            read_msgs.emplace_back(read_msg_);
                        }
                        else {                            
                            DEBUG_MSG ("poping promise" << std::endl);

                           // set promise                            
                            boost::promise <std::vector <unsigned char>> * recv_promise = blocked_recv_promises.back();
                        //    free(blocked_recv_promises.back());
                            blocked_recv_promises.pop_back();
                            recv_promise->set_value(read_msg_);
                            DEBUG_MSG ("after promise set value" << std::endl);

                        }
*/
//                        m_party->on_recv(player_j);

                    do_read_header(player_j);
                } else {
                    DEBUG_MSG("disconnecting do_read_body();" << std::endl);
                    std::cout.flush();
                }
                
        });
            
    }


    void do_read_header(int player_j) {
        DEBUG_MSG ( "channel " << channel << ": do_read_header()" << std::endl);
        // add new promise to queue
        read_header_.empty();
        read_header_.resize(sizeof(int));
        auto self(shared_from_this());
        boost::asio::async_read(socket,
            boost::asio::buffer(read_header_.data(), sizeof(int)),
            [this, self, player_j](boost::system::error_code ec, std::size_t /*length*/) {
                if (!ec) {
                    int data_size;
                    memcpy(&data_size, read_header_.data(), sizeof(int));
                    read_msg_.empty();
                    read_msg_.resize(data_size);
                    DEBUG_MSG("channel " << channel << ": received size header from player " << player_j << ": " << data_size);
                    do_read_body(player_j);
                } else {
                        if (!m_party->isDisconnecting()) {
                            DEBUG_MSG("channel " << channel << ": player " << player_j << " disconnect: error in read_header: " << ec.message() << std::endl);              
                            //exit(-1);
                        }
                }
            }
        );
    }

       void do_read_connect_body(int player_j)
    {
        DEBUG_MSG ( "channel " << channel << ": do_read_connect_body() to read size: " << read_msg_.size() << std::endl);

        auto self(shared_from_this());
        boost::asio::async_read(socket,
            boost::asio::buffer(read_msg_.data(), read_msg_.size()),
            [this, self, player_j](boost::system::error_code ec, std::size_t /*length*/) {
                if (!ec) {
//                        read_msgs.emplace_back(read_msg_);
                        m_party->on_recv(player_j, channel, read_msg_);
                        do_read_header(player_j);
                }
            }
        );
    }

     void do_read_connect_header(int player_j) {
        DEBUG_MSG ( "channel " << channel << " do_read_connect_header()" << std::endl);
        // add new promise to queue
        read_msg_.empty();
        read_msg_.resize(sizeof(int));
        auto self(shared_from_this());
        boost::asio::async_read(socket,
            boost::asio::buffer(read_msg_.data(), sizeof(int)),
            [this, self, player_j](boost::system::error_code ec, std::size_t /*length*/) {
                if (!ec) {
                    int data_size;
                    memcpy(&data_size, read_msg_.data(), sizeof(int));
                    read_msg_.resize(data_size);
                    DEBUG_MSG("channel " << channel << ": received size header from player " << player_j << ": " << data_size);
                    do_read_connect_body(player_j);
                } else {
                        if (!m_party->isDisconnecting()){
                            std::cout << "channel " << channel << ": player " << player_j << " disconnect: error in read_header: " << ec.message() << std::endl;
                            exit(-1);              
                        }
                }
            }
        );
    }

    void do_read_player() {
        DEBUG_MSG ( "do_read_player()" << std::endl);

        read_msg_.empty();
        read_msg_.resize(2*sizeof(int));

        auto self(shared_from_this());
        boost::asio::async_read(socket,
        boost::asio::buffer(read_msg_.data(), 2*sizeof(int)),
        [this, self](boost::system::error_code ec, std::size_t /*length*/)
        {
          if (!ec) {
            
            int player_j;
            int _channel;
            memcpy(&player_j, read_msg_.data(), sizeof(int));
            memcpy(&_channel, read_msg_.data() + sizeof(int), sizeof(int));
            channel = _channel;
            DEBUG_MSG ("received player_j: " << player_j << " channel: " << channel << std::endl);
            m_party->add_recv(player_j, channel, shared_from_this());
            DEBUG_MSG ("passed add_recv -- received player_j: " << player_j << " channel: " << channel << std::endl);
            do_read_connect_header(player_j);
            DEBUG_MSG ("passed do_read_connect_header -- received player_j: " << player_j << " channel: " << channel << std::endl);
          } else {
                std::cout << "player disconnect while connecting: error in read_header" << std::endl;              
          }
        });
    }

    void do_write_player(int player_j, int channel) {

        auto self(shared_from_this());
        bool write_in_progress = !write_msgs.empty();
        std::vector <unsigned char> buf(2*sizeof(int));
        memcpy(buf.data(), &player_j, sizeof(int));
        memcpy(buf.data()+sizeof(int), &channel, sizeof(int));
        write_msgs.push_back(buf);
        if (!write_in_progress)
            do_write_body_connect();
    }

    void do_write_body_connect() {
        auto self(shared_from_this());
        DEBUG_MSG ( "channel " << channel << ": writing body of size: " << write_msgs.front().size() << std::endl);
        boost::asio::async_write(socket,
            boost::asio::buffer(write_msgs.front().data(),
            write_msgs.front().size()),
            [this, self](boost::system::error_code ec, std::size_t /*length*/) {
                if (!ec) {
                    DEBUG_MSG ( "channel " << channel << ": wrote body of size: " << write_msgs.front().size() << std::endl);
                    write_msgs.pop_front();
                    //write_promise = boost::promise <bool> ();
                   // if (!write_msgs.empty()) {
                   //     do_write();
                   // }
                }
            }
        );
    }


    void do_write() {
        if (!write_tuples.empty())
            do_write_header();
    }

    void do_write_body() {
        auto self(shared_from_this());
        DEBUG_MSG("channel " << channel << ": writing body of size: " << std::get<0>(write_tuples.front()).size() << std::endl);
        DEBUG_MSG("channel " << channel << ": !!writing len " << std::get<0>(write_tuples.front()).size() << "write_msg: ");
        #ifdef DEBUG
        for (int i = 0 ; i < std::get<0>(write_tuples.front()).size() ; i++) printf("%.2X", std::get<0>(write_tuples.front())[i]);
        printf("\n");
        #endif
        boost::asio::async_write(socket,
            boost::asio::buffer(std::get<0>(write_tuples.front()).data(),
            std::get<0>(write_tuples.front()).size()),
            [this, self](boost::system::error_code ec, std::size_t /*length*/) {
                if (!ec) {
                    DEBUG_MSG("channel: " << channel << ": wrote body of size: " << std::get<0>(write_tuples.front()).size() << std::endl);

                    boost::promise <bool> * write_promise = std::get<1>(write_tuples.front());
                    std::function <void()> write_function = std::get<2>(write_tuples.front());
                    write_tuples.pop_front();
                    if (write_function == nullptr) {
                        write_promise->set_value(true);
                    } else {
                        write_function();
                    }

/*                    if (!write_tuples.empty()) {
                        do_write();
                    }
                    */
                }
            }
        );
    }

    void do_write_header() {
        auto self(shared_from_this());
        int msg_size = std::get<0>(write_tuples.front()).size();
       DEBUG_MSG("channel " << channel << ": writing header() size: " << msg_size << std::endl);
       msg_header.empty();
       msg_header.resize(sizeof(int));
        memcpy(msg_header.data(), &msg_size, sizeof(int));   
        boost::asio::async_write(socket,
            boost::asio::buffer(msg_header.data(),
            sizeof(int)),
            [this, self](boost::system::error_code ec, std::size_t /*length*/) {
                if (!ec){
                    DEBUG_MSG("channel " << channel << ": wrote header()" << std::endl );
                     do_write_body();                
                } else {
                    DEBUG_MSG (ec.message());
                }
            }
        );
    }

    // maybe make read_msg_ a const size
    std::vector <unsigned char> read_msg_;
    std::vector <unsigned char> read_header_;
    
    
    int player_num;
    int num_players;
    int base_port;
    int num_channels;
    multi_party * m_party;
    tcp::socket socket;
    int channel;
    std::deque <std::vector <unsigned char>> write_msgs;
    std::deque <std::vector <unsigned char>> read_msgs;
    boost::unique_future <bool> is_read_ready;
    std::vector <unsigned char> msg_header;
    std::deque <boost::promise <bool> *> write_promises;
    std::deque <boost::unique_future <bool>> read_futures;

    std::deque <std::tuple <std::vector <unsigned char>, boost::promise <bool> *, std::function<void()>>> write_tuples;

    std::deque <std::pair <boost::promise <std::vector <unsigned char>> *, std::function<void(std::vector <unsigned char>)>>> blocked_recv_promises;

    boost::mutex read_mutex;
};


class mp_network : public std::enable_shared_from_this <mp_network> {

public:

    mp_network(int _player_num, int _num_players, int _num_channels, int _base_port, asio::io_context * _p_ctx) 
            : acceptor_(*_p_ctx,  tcp::endpoint(tcp::v4(), _base_port + _player_num - 1)),
              resolver_(*_p_ctx) {
    
        player_num = _player_num;
        num_players = _num_players;
        num_channels = _num_channels;
        base_port = _base_port;
        p_ctx = _p_ctx;
        m_party = new multi_party(player_num, num_players, num_channels, base_port, p_ctx);
        m_timer.resize(num_players + 1);
        for (int j = 1; j < num_players + 1; j++){
            if (j != player_num) {
                m_timer[j].resize(num_channels);
                for (int i = 0; i < num_channels; i++)
                    m_timer[j][i] = new asio::steady_timer(*p_ctx, asio::chrono::seconds(1));
            }
        }

        send_sockets.resize(num_players + 1);

        for (int j = 1; j < num_players + 1; j++) {
            if (j != _player_num)
                send_sockets[j].resize(num_channels);
        }
    
    }

    ~mp_network() {
        DEBUG_MSG ( "calling ~mp_network()" << std::endl );
        m_party->disconnect();
/*
        for (int i = 1; i < num_players + 1; i++) {
            if (i != player_num) {
                for (int j = 0; j < num_channels; j++)
                    free(m_timer[i][j]);
            }
        }

        free(m_party);
*/
        DEBUG_MSG ( "exiting." << std::endl);
        std::cout.flush();
        exit(1);       
    }


//    virtual void onConnected() = 0;

    void set_recv_handler(std::function<void(int, std::vector <unsigned char>, boost::system::error_code)> on_recv_handler);
    void set_recv_handler(int, std::function<void(int, std::vector <unsigned char>, boost::system::error_code)> on_recv_handler);
    void push_recv_handler(int player_j, std::function<void(int, std::vector <unsigned char>, boost::system::error_code)> on_recv_handler);
    void pop_recv_handler(int player_j);


    boost::unique_future <bool> connect();
    void connect(std::function<void(boost::system::error_code)> on_connect_handler);

    void do_accept();
    void do_connect();
    void try_connect(int player_j,int channel);
    void connect_handler(const boost::system::error_code &ec);
    void on_reconnect(const system::error_code & ec);

    boost::unique_future <bool> send(int player_j, std::vector <unsigned char> _data);
    boost::unique_future <bool> send(int player_j, int channel, std::vector <unsigned char> _data);
    void send(int player_j, std::vector <unsigned char> _data, std::function<void()> on_send_handler);
    void send(int player_j, int channel, std::vector <unsigned char> _data, std::function<void()> on_send_handler);
    boost::unique_future <std::vector <unsigned char>> recv(int player_j);
    boost::unique_future <std::vector <unsigned char>> recv(int player_j, int channel);
    void recv(int player_j, std::function<void(std::vector <unsigned char>)> on_recv_handler);
    void recv(int player_j, int channel, std::function<void(std::vector <unsigned char>)> on_recv_handler);

    int player_num;
    int num_players;
    int num_channels;
    int base_port;
    int num_incoming_connections;
    int num_outgoing_connections;

    asio::io_context * p_ctx;
    tcp::acceptor acceptor_;
    tcp::resolver resolver_;
    multi_party * m_party;
    std::vector <std::vector <asio::steady_timer *>> m_timer;
    std::vector <std::vector <tcp::socket *>> send_sockets; 
};


#endif