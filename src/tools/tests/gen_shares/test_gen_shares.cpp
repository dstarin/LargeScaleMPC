#include <iostream>

#include "../../aes_seeds.h"
#include "../../comm_patterns.h"
#include "../../gen_shares.h"

#define CONFIG_BASE_DIR "../../../../../deploy/"

int main(int argc, char** argv) {

    if (argc != 4) {
        std::cout << "./test_gen_shares <player_num> <committee_size> <num_players>" << std::endl;
        exit(-1);
    }
    int player_num = std::atoi(argv[1]);
    int committee_size = std::atoi(argv[2]);
    int num_players = std::atoi(argv[3]);
    std::stringstream np_string;
    std::stringstream p_string;
    std::string seed_filename;
    std::string base_dir (CONFIG_BASE_DIR);
 
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



    np_string << std::setfill('0') << std::setw(3) << num_players;
    p_string << std::setfill('0') << std::setw(3) << player_num;
    seed_filename = base_dir + "seeds/" + np_string.str() + "-party/mpc" + p_string.str() + "-seeds.txt";   
    aes_seeds aes(num_players, seed_filename);
    comm_patterns cp(committee_size, num_players, h, CONFIG_BASE_DIR);

    gen_shares gen(player_num, cp.committee, aes.seeds);

    gen.gen(3, 0).print();

    return 1;
}
