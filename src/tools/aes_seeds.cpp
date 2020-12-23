#include "aes_seeds.h"

aes_seeds::aes_seeds(int num_players, const std::string & filename) {

    std::ifstream infile(filename);

    std::string line;
    seeds.resize(num_players);
    for (int i = 0 ; i < num_players ; i++) {
        std::getline(infile, line);
        if (line.compare("-") != 0){
            seeds[i].resize(32);
            seeds[i] = base64_decode(line);
        }
    }
}