#include <iostream>
#include "../../tools/mp_network.h"

int main(int argc, char ** argv) {

    int player_num;
    int num_players;
    int base_port;

    if (argc != 4) {
        std::cout << "usage: ./player <player_num> <num_players> <base_port>\n";
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

}