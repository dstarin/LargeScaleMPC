#ifndef _AES_SEEDS_H_
#define _AES_SEEDS_H_

#include <stdlib.h>
#include <string>
#include <vector>
#include <fstream>
#include <iostream>
#include "base64.h"

class aes_seeds {
public:

    aes_seeds(int num_players, const std::string & filename);

    std::vector <std::vector <unsigned char>> seeds;

};

#endif