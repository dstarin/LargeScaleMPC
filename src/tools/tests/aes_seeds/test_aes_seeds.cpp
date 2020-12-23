#include <iostream>

#include "../../aes_seeds.h"

int main(int argc, char** argv) {

    if (argc != 3) {
        std::cout << "./test_aes_seeds <num_players> <filename>" << std::endl;
        exit(-1);
    }

    int num_players = std::atoi(argv[1]);

    std::string filename (argv[2]);

    aes_seeds aes(num_players, filename);

    for (int i = 0; i < num_players; i++) {
        if (aes.seeds[i].size() == 0)
            std::cout << "-" << std::endl;
        else {
            std::cout << base64_encode(&aes.seeds[i][0], aes.seeds[i].size()) << std::endl;
        }
    }

    return 1;
}
