#include <iostream>
#include <string.h>
#include "../../comm_patterns.h"

int main(int argc, char** argv) {

    if (argc != 3) {
        std::cout << "./test_comm_patterns <committee_size> <num_players>" << std::endl;
        exit(-1);
    }

    int committee_size = std::stoi(argv[1]);
    int num_players = std::stoi(argv[2]);
    
    int h;

    if (num_players == 8)
        h = 6;

    if (num_players == 16)
        h = 11;

    if (num_players == 32)
        h = 22;

    if (num_players == 64)
        h = 43;

    if (num_players == 128)
        h = 86;

    if (num_players == 256)
        h = 171;

    if (num_players == 512)
        h = 342;


    std::string file_basedir = "../../../../../deploy/";

    comm_patterns cp(committee_size, num_players, h, file_basedir);
    
    for (int i = 0; i < num_players; i++) {
        for (int j = 0; j < num_players; j++) {
            std::cout << "[" << i << "," << j << "]: ";
            for (int k = 0; k < cp.player_sends[i][j].size(); k++) {
                std::cout << " " << cp.player_sends[i][j][k];
            }
            std::cout << std::endl;
        }
    }

    for (int i = 0; i < h; i++) {
        for (int j = 0; j < num_players; j++) {
                        std::cout << j << ": " << cp.send_shares[i][j].recv_player_id << " "
                      << cp.send_shares[i][j].committee_id << " " << cp.send_shares[i][j].h
                      << " " << cp.send_shares[i][j].gen_type << std::endl;

        }
    }

    std::cout << std::endl;

    for (int i = 0; i < num_players; i++) {
        std::cout << "--- player " << i << std::endl;
        for (int j = 0; j < h; j++) {
            for (int k = 0; k < num_players; k++) {
                std::cout << cp.recv_shares[i][j][k].committee_id << " "
                          << cp.recv_shares[i][j][k].h << " "
                          << cp.recv_shares[i][j][k].gen_player_id << " "
                          << cp.recv_shares[i][j][k].send_player_id << " "
                          << cp.recv_shares[i][j][k].gen_type << std::endl;
            }
        }
    }


    // check num_sends == num_recvs
    int num_sends = 0;
    for (int i = 1 ; i <= num_players; i++){
        num_sends += cp.get_num_gen_sends(i);
    }

    int num_recvs = 0;

    for (int i = 1 ; i <= num_players; i++){
        num_recvs += cp.get_num_recvs(i);
    }

    std::cout << "num_sends: " << num_sends << std::endl;
    std::cout << "num_recvs: " << num_recvs << std::endl;
    
    return 1;
}
