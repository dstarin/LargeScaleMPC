#ifndef _COMM_PATTERNS_H_
#define _COMM_PATTERNS_H_

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

using namespace libiop;

struct send_shares_t {
    short recv_player_id;
    short committee_id;
    short h;
    char gen_type;
};

struct recv_shares_t {
    short gen_player_id;
    short send_player_id;
    short committee_id;
    short h;
    char gen_type;
};

class comm_patterns {
public:

    comm_patterns(int committee_size, int num_players, int _h, const std::string & file_basedir);
    int get_num_gen_sends(int player_num);
    int get_num_recvs(int player_num);


    int h;
    int num_players;

    std::vector <int> committee;
    std::vector <std::vector <send_shares_t>> send_shares;
    std::vector <std::vector <std::vector<short>>> player_sends;
    std::vector <std::vector <std::vector<short>>> player_recvs;    
    std::vector <std::vector <short>> player_h_values;
    std::vector <std::vector <std::vector <recv_shares_t>>> recv_shares;


};

#endif