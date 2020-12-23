#include "../../../tools/mp_network.h"
#include "../../../f_aes/f_aes.h"
#include <iostream>

boost::promise <bool> async_promise;


void on_p1() {

    async_promise.set_value(true);
    
}

void on_p2(int data_size, std::vector <unsigned char> recv_data) {
    for (int k = 0; k < data_size; k++) printf("%.2X", recv_data[k]);
    std::cout << std::endl;

    async_promise.set_value(true);

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

    asio::io_context p_ctx;
    std::shared_ptr <mp_network> network = std::make_shared <mp_network> (player_num, num_players, 1, base_port, &p_ctx);
    network->connect().wait();
    std::cout << "connected!" << std::endl;
    boost::unique_future <bool> async_future = async_promise.get_future();
    std::shared_ptr <f_aes> p1_aes;
    std::shared_ptr <f_aes> p2_aes;
    
    if (player_num == 1) {
        int data_size = 256;
        std::vector <unsigned char> key(32);
        key[0] = 'A';
        std::vector <unsigned char> iv(16);
        iv[0] = 'A';
        std::vector <unsigned char> send_data(256);
        send_data[0] = '1';
        send_data[1] = '0';
        send_data[2] = '1';
        send_data[3] = '1';
        send_data[4] = '0';
        send_data[5] = '1';
        send_data[6] = '1';
        send_data[7] = '1';
        send_data[8] = '1';
        send_data[9] = '1';
        send_data[10] = '1';
        
        // set key, iv, send_data

        for (int k = 0; k < data_size; k++) printf("%.2X", send_data[k]);
        std::cout << std::endl;
        std::cout.flush();
        p1_aes = std::make_shared <f_aes> (key, data_size, player_num, 0, network.get(), 2);
        p1_aes->pi_p1(send_data, []() { on_p1();});
    }

    if (player_num == 2) {
        int data_size = 256;
        std::vector <unsigned char> key(32);
        key[0] = 'A';
        std::vector <unsigned char> iv(16);
        iv[0] = 'A';
        std::vector <unsigned char> recv_data;
        // set key, iv, send_data

        p2_aes = std::make_shared <f_aes> (key, data_size, player_num, 0, network.get(), 1);
        p2_aes->pi_p2([data_size](std::vector <unsigned char> recv_data) { on_p2(data_size, recv_data);});
    }

    async_future.get();

}