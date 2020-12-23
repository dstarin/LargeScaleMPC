#ifndef _GEN_SHARES_H_
#define _GEN_SHARES_H_

#include <fstream>

#include <libff/algebra/curves/edwards/edwards_pp.hpp>

#include <libiop/algebra/fft.hpp>
#include <libiop/algebra/fields/gf64.hpp>
#include <libiop/algebra/field_subset/subspace.hpp>
#include <libiop/algebra/utils.hpp>
#include <string>
#include <boost/lexical_cast.hpp>
#include <sstream>
#include <iomanip>
#include <iostream>
#include "../tools/aes-ecb.h"

using namespace libiop;
typedef gf64 FieldT;
class gen_shares {
public:

    gen_shares(int _player_num, std::vector <int> & _committees, std::vector <std::vector <unsigned char>> & _aes_seeds);
    gen_shares(int _player_num, std::vector <int> & _committees, std::vector <std::vector <unsigned char>> & _aes_seeds, std::shared_ptr <aes> _aesImpl);


    FieldT gen(int for_player, int h_index);
    FieldT gen_to_send(FieldT val, int recv_player, int h_index);
    FieldT gen_local(FieldT val, int h_index);

    std::shared_ptr <aes> aesImpl;
    int player_num;
    std::vector <int> committees;
    std::vector <std::vector <unsigned char>> aes_seeds;
};

#endif