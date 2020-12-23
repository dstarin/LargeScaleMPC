#include "../../f_triples/f_triples.h"
#include <iostream>
#include <ctime>

boost::promise <bool> async_promise;
std::clock_t start;
int repeat;
int repeat_index = 0;

void on_pi_triples(std::vector <std::tuple <FieldT, FieldT, FieldT>> triple_shares, mp_network * network, int committee_size, int p_factor) {
    
    repeat_index++;
    if (repeat == repeat_index){
        std::cout<<"time: "<< (std::clock() - start ) / (double) CLOCKS_PER_SEC << std::endl;
        std::cout << "calling ~mp_network()" << std::endl;
        std::cout << "exiting." << std::endl;
        async_promise.set_value(true);
    }
    else {
        std::shared_ptr <f_triples> triplesImpl = std::make_shared <f_triples> (network, committee_size, p_factor);
        triplesImpl->pi([network, committee_size, p_factor](std::vector <std::tuple <FieldT, FieldT, FieldT>> triple_shares){ 
            on_pi_triples(triple_shares, network, committee_size, p_factor);
        });
    }
}

int main(int argc, char ** argv) {

    int player_num;
    int committee_size;
    int num_players;
    int base_port;
    int p_factor;

    if (argc != 7) {
        std::cout << "usage: ./player <player_num> <committee_size> <num_players> <base_port> <repeat> <p_factor>\n";
        exit(-1);
    }

    player_num = atoi(argv[1]);
    committee_size = atoi(argv[2]);
    num_players = atoi(argv[3]);
    base_port = atoi(argv[4]);
    repeat = atoi(argv[5]);
    p_factor = atoi(argv[6]);


    std::cout << "player " << player_num << "/" << num_players << std::endl;

    asio::io_context p_ctx;
    std::shared_ptr <mp_network> network = std::make_shared <mp_network> (player_num, num_players, 4, base_port, &p_ctx);
    network->connect().wait();
    std::cout << "connected!" << std::endl;
    boost::unique_future <bool> async_future = async_promise.get_future();
    start = std::clock();
    std::shared_ptr <f_triples> triplesImpl = std::make_shared <f_triples> (network.get(), committee_size, p_factor);
    triplesImpl->pi([network, committee_size, p_factor](std::vector <std::tuple <FieldT, FieldT, FieldT>> triple_shares){ on_pi_triples(triple_shares, network.get(), committee_size, p_factor); });

    async_future.wait();
    return 1;
}