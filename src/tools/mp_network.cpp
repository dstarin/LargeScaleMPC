
#include "mp_network.h"

void mp_network::set_recv_handler(std::function<void(int, std::vector <unsigned char>, boost::system::error_code)> on_recv_handler) {
    m_party->set_recv_handler(on_recv_handler);
}

void mp_network::set_recv_handler(int player_j, std::function<void(int, std::vector <unsigned char>, boost::system::error_code)> on_recv_handler) {
    m_party->set_recv_handler(player_j, on_recv_handler);
}

void mp_network::push_recv_handler(int player_j, std::function<void(int, std::vector <unsigned char>, boost::system::error_code)> on_recv_handler) {
    m_party->push_recv_handler(player_j, on_recv_handler);     
}

void mp_network::pop_recv_handler(int player_j) {
    m_party->pop_recv_handler(player_j);     
}


// async connect()
void mp_network::connect(std::function<void(boost::system::error_code)> on_connect_handler) {
    m_party->set_connect_handler(on_connect_handler);
    do_accept();
    do_connect();
}

// synchonous blocking connect() -- this blocks entire mp_network
boost::unique_future <bool> mp_network::connect() {
    do_accept();
    do_connect();
    std::thread t1( [this]{ p_ctx->run(); });
    t1.detach();
    return m_party->get_on_connect_future();
}

void mp_network::send(int player_j, std::vector <unsigned char> _data, std::function<void()> on_send_handler) {
  return m_party->send(player_j, _data, on_send_handler);  
}

void mp_network::send(int player_j, int channel, std::vector <unsigned char> _data, std::function<void()> on_send_handler) {
  return m_party->send(player_j, channel, _data, on_send_handler);  
}


boost::unique_future <bool> mp_network::send(int player_j, std::vector <unsigned char> _data) {

    return m_party->send(player_j, _data);
}

boost::unique_future <bool> mp_network::send(int player_j, int channel, std::vector <unsigned char> _data) {

    return m_party->send(player_j, channel, _data);
}

boost::unique_future <std::vector <unsigned char>> mp_network::recv(int player_j, int channel) {

  return m_party->recv(player_j, channel);

}


boost::unique_future <std::vector <unsigned char>> mp_network::recv(int player_j) {

  // if message in queue, read latest and return
  // if no message in queue, pass data pointer and return future
  return m_party->recv(player_j);

    // a call to recv should first unblock the recv 
    // the blocking future should be held by recv_header in session
//    can_recv_promises[player_j].set_value(true)
//DEBUG_MSG("before set_on_read_promise in recv()" <<std::endl);
  //  m_party->set_on_read_promise(player_j);

//DEBUG_MSG("after set_on_read_promise in recv()" <<std::endl);

    // and then block until the async handlers return

    // this should block but not block the rest of mp_network
  //  boost::promise<bool> on_recv_promise;
  //  boost::unique_future<bool> recv_future = on_recv_promise.get_future(); 
  //  m_party->set_recv_promise(player_j, &on_recv_promise);

   // DEBUG_MSG("waiting in recv()" <<std::endl);

//    recv_future.wait();
 //   DEBUG_MSG("got here1" <<std::endl);
 //   m_party->local_recv(_data);

}

void mp_network::recv(int player_j, int channel, std::function<void(std::vector <unsigned char>)> on_recv_handler) {
 return m_party->recv(player_j, channel, on_recv_handler);
}

void mp_network::recv(int player_j, std::function<void(std::vector <unsigned char>)> on_recv_handler) {
 return m_party->recv(player_j, on_recv_handler);
}


void mp_network::do_accept() {
    acceptor_.async_accept(
        [this](boost::system::error_code ec, tcp::socket socket) {
          if (!ec) {
            std::make_shared<session>(std::move(socket), m_party, player_num, num_players, num_channels, base_port)->start_listen();
          }
          do_accept();          
        }
    );
}

void mp_network::try_connect(int player_j, int channel) {


  std::string hostname = "mpc" + std::string(3 - std::to_string(player_j).length(), '0') + std::to_string(player_j);
  resolver_.async_resolve({hostname, std::to_string(base_port + player_j - 1)},
    [this, player_j, channel, hostname](boost::system::error_code ec, boost::asio::ip::tcp::resolver::iterator iter){
      if (!ec) {
        tcp::endpoint endpoint;
        endpoint = ec? tcp::endpoint{} : *iter;
        std::cout << "player " << player_num << "> connecting to player " << player_j << " channel " << channel << " @ " << hostname << " - " << endpoint.address() << ":" << base_port + player_j - 1<< std::endl;
        send_sockets[player_j][channel]->async_connect(endpoint, [this, player_j, channel] (const system::error_code &ec) {

          if (!ec) {
            std::make_shared<session>(std::move(*(send_sockets[player_j][channel])), m_party, player_num, num_players, num_channels, base_port)->connect(player_j, channel);
          } else {
            if ((player_j > 0) && (player_j <= num_players)){
              // try reconnect after timeout
              //std::cout << " ( " << ec.message() << " )" << std::endl;
              m_timer[player_j][channel]->expires_from_now(asio::chrono::seconds(1));
              m_timer[player_j][channel]->async_wait([this, player_j, channel] (const system::error_code &ec) {
                try_connect(player_j, channel);
              });
            }
          }
        });
      }
    });
// use below if local is needed without /etc/hosts entries
/*  } else {
    // is local
    tcp::endpoint endpoint;
    tcp::endpoint local_endpoint(asio::ip::address::from_string("127.0.0.1"), base_port + player_j - 1);
    endpoint = local_endpoint;
    std::cout << "player " << player_num << "> connecting to player " << player_j << " channel " << channel << " @ 127.0.0.1:" << base_port + player_j - 1<< std::endl;
  
    send_sockets[player_j][channel]->async_connect(endpoint, [this, player_j, channel] (const system::error_code &ec) {

      if (!ec) {
        std::make_shared<session>(std::move(*(send_sockets[player_j][channel])), m_party, player_num, num_players, num_channels, base_port)->connect(player_j, channel);
      } else {
        if ((player_j > 0) && (player_j <= num_players)){
          // try reconnect after timeout
          //std::cout << " ( " << ec.message() << " )" << std::endl;
          m_timer[player_j][channel]->expires_from_now(asio::chrono::seconds(1));
          m_timer[player_j][channel]->async_wait([this, player_j, channel] (const system::error_code &ec) {
            try_connect(player_j, channel);
          });
        }
      }
    });
  }
  */
}

// connect to each other host on each channel with 1 second timeouts
void mp_network::do_connect() {
  // initialize sockets

  for (int j = 1; j < num_players + 1; j++) {
    if (j != player_num) {
      for (int i = 0 ; i < num_channels ; i++) {
        // connect to j
        send_sockets[j][i] = new tcp::socket(*p_ctx);
        try_connect(j, i);
      }
    }
  }
}
/*
void on_recv_handler(int player_j, std::vector <unsigned char> data, const boost::system::error_code & ec) {

    std::cout << "received data from player " << player_j << ": " << std::endl;
    for (int i = 0; i < data.size(); i++) printf("%.2X", data[i]);
    printf("\n");
}


void on_connect(const boost::system::error_code & ec) {

    std::cout << "::on_connect connected!" << std::endl;
}


int main(int argc, char ** argv) {

    int player_num;
    int num_players;
    int base_port;

    if (argc != 4) {
        std::cout << "usage: ./player <player_num> <num_players> <base_port>\n";
        std::cout << "note: player 1 must be started last" << std::endl; 
        exit(-1);
    }

    player_num = atoi(argv[1]);
    num_players = atoi(argv[2]);
    base_port = atoi(argv[3]);

    std::cout << "player " << player_num << "/" << num_players << std::endl;

    asio::io_context * p_ctx = new asio::io_context();
    std::function <void(boost::system::error_code)> on_connect_handler = std::bind(on_connect, std::placeholders::_1);
    mp_network mpnImpl(player_num, num_players, base_port, p_ctx);
    mpnImpl.set_recv_handler(on_recv_handler);
    mpnImpl.connect();
    std::cout << "connected!" << std::endl;

    std::vector <unsigned char> data (sizeof (int));
    int test = 555;
    memcpy(data.data(), &test, sizeof(int));
    mpnImpl.send(1, data);


    (*p_ctx).run();

}

*/