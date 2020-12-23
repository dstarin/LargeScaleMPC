#include "../../tools/aes-ecb.h"
#include "../../f_triples/f_triples.h"
#include "../../f_online/f_online.h"
#include <iostream>

boost::promise <bool> async_promise;

FieldT getTestInput(int player_j, int num_players, int index){

    // get key from aes_seeds

    // encrypt send data using key
    std::vector <unsigned char> enc_data;

    int u_index = index * num_players + player_j - 1;

    std::vector <unsigned char> uchar_index (sizeof(int));
    memcpy(uchar_index.data(), &u_index, sizeof(int));

    std::vector <unsigned char> iv(AES_BLOCK_SIZE, TEST_INPUT_SEED); // use 0 iv (one msg per key)
    std::vector <unsigned char> aes_seed(AES_KEY_SIZE, 0);
    aes aesImpl;
    aesImpl.aes256ecb_encrypt(enc_data, uchar_index, aes_seed, iv);

    // get first 64-bits of output as share
    uint64_t element;
    memcpy(&element, enc_data.data(), sizeof(uint64_t));
    return FieldT(element);
}

void on_pi_online(int player_num, int num_players, FieldT xy) {

    FieldT x = FieldT(0);
    FieldT y = FieldT(0);
    if (player_num == DEALER_NUM) {
        for (int i = 1; i < num_players + 1; i++) {
            x += getTestInput(i, num_players, 0);
            y += getTestInput(i, num_players, 1);
            std::cout << "x: ";
            getTestInput(i, num_players, 0).print();
            std::cout << "y: ";
            getTestInput(i, num_players, 1).print();
        }
        std::cout << "end x: ";
        x.print();
        std::cout << "end y: ";
        y.print();
        std::cout << "end x*y: ";
        FieldT end_xy = x*y;
        end_xy.print();

        if ((x*y) == xy) {
            std::cout << "equal!!" << std::endl;
        } else {
            std::cout << "not equal!!" << std::endl;
        }
        (x*y).print();
    }
    xy.print();
    std::cout.flush();
    async_promise.set_value(true);

}


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
    std::shared_ptr <mp_network> network = std::make_shared <mp_network> (player_num, num_players, 4, base_port, &p_ctx);
    network->connect().wait();
    std::cout << "connected!" << std::endl;
    boost::unique_future <bool> async_future = async_promise.get_future();
    
    std::shared_ptr <f_triples> triplesImpl = std::make_shared <f_triples> (network.get());
    triplesImpl->pi([player_num, num_players, network](std::vector <std::tuple <FieldT, FieldT, FieldT>> triple_shares){ 
        
        std::shared_ptr <f_online> onlineImpl = std::make_shared <f_online> (network.get());
        FieldT x_share = getTestInput(player_num, num_players, 0);
        FieldT y_share = getTestInput(player_num, num_players, 1);
        std::cout << "x_share: ";
        x_share.print();
        std::cout << "y_share: ";
        y_share.print();
        onlineImpl->pi(x_share, y_share, triple_shares, [player_num, num_players](FieldT xy){ on_pi_online(player_num, num_players, xy); });
        
    });



    async_future.wait();

    return 1;
}