#ifndef _F_TRIPLES_H_
#define _F_TRIPLES_H_

#include <iostream>
#include <string>
#include <sstream>
#include <iomanip>
#include "../tools/mp_network.h"
#include "../tools/vandermonde.h"
#include "../tools/aes-ecb.h"
#include "../tools/aes_seeds.h"
#include "../tools/comm_patterns.h"
#include "../tools/gen_shares.h"

#include <libff/algebra/curves/edwards/edwards_pp.hpp>

#include <libiop/algebra/fft.hpp>
#include <libiop/algebra/fields/gf64.hpp>
#include <libiop/algebra/field_subset/subspace.hpp>
#include <libiop/algebra/utils.hpp>

#define OFFSET 8368420669794438635
#define DEALER_NUM 1
#define VM_FILE "../../../tools/gf64_generators.txt"

#define CONFIG_BASE_DIR "../../../../deploy/"

//#define DEBUG_TRIPLES

using namespace libiop;
typedef gf64 FieldT;

class f_triples : public std::enable_shared_from_this <f_triples> {

public:

    f_triples(mp_network * _network, int committee_size, int p_factor);
    void prep_shares_and_send();
    FieldT getaShare(int seed_type, int player_j, int index);
    FieldT aShare(int index, FieldT element);
    void pi(std::function <void(std::vector <std::tuple <FieldT, FieldT, FieldT>>)> _on_pi_return_handler);
    void on_recv_m_d (int p_count, int num_p, std::vector <unsigned char> data);
    void on_send_m_2d (int dealer, int p_count, int num_p);
    void on_dealer_send_m_d (int player_j, int p_count, int num_p);
    void on_dealer_recv_m_2d(int player_j, int dealer, int p_count, int num_p, std::vector <unsigned char> data);
    void on_all_shares_recved();
    void on_player_recv(int player_j, std::vector <unsigned char> data);
    void on_player_send();
    void on_player_recv_2d(int player_j, std::vector <unsigned char> data);
    void on_player_send_2d();
    void on_player_recv_a(int player_j, std::vector <unsigned char> data);
    void on_player_send_a();
    void on_player_recv_b(int player_j, std::vector <unsigned char> data);
    void on_player_send_b();
    void on_send_test_abc_shares();
    void on_recv_test_abc_shares(int player_j, std::vector <unsigned char> data);
    void on_send_test_degree_d_abc_shares();
    void on_recv_test_degree_d_abc_shares(int player_j, std::vector <unsigned char> data);
    void on_recv_packed_triples();
    void on_have_all_shares();

private:

    uint64_t conv64(std::vector <unsigned char> data) {

        uint64_t res;
        std::memcpy(&res, data.data(), sizeof(uint64_t));

        return res;
    }

    std::vector <unsigned char> ui64conv (uint64_t data) {

        std::vector <unsigned char> res (8);
        std::memcpy(res.data(), &data, sizeof(data));

        return res;
    }


    int player_num;
    int num_players;
    int committee_size;
    int p_factor;

    mp_network * network;
    std::vector <unsigned char> share;
    boost::promise <bool> async_promise;
    int aes_seeds_sent;
    int aes_seeds_recv;
    int num_share_types;
    int num_calls;
    int num_recv;
    int num_calls_2d;
    int num_recv_2d;
    int num_calls_a;
    int num_recv_a;
    int num_calls_b;
    int num_recv_b;
    int num_dealer_recv_m_2d;
    int num_dealer_send_m_d;
    int all_recved;
    int recv_test_abc_shares;
    int recv_test_degree_d_abc_shares;
    int h;
    int l;
    int n;
    int m;
    int total_num_gen_sends;
    int total_num_recvs;
    int num_gen_sends;
    int num_recvs;
    int committee_id;
    bool all_recvs_done;
    bool all_sends_done;
    bool loop_complete;

    FieldT a_total;
    FieldT b_total;
    FieldT c_total;
    
    std::vector <std::vector <FieldT>> r_d;
    std::vector <std::vector <FieldT>> r_2d;
    std::vector <std::vector <FieldT>> a_d;
    std::vector <std::vector <FieldT>> b_d;
    std::vector <std::vector <FieldT>> r_d_tild;
    std::vector <std::vector <FieldT>> r_2d_tild;
    std::vector <std::vector <FieldT>> a_d_tild;
    std::vector <std::vector <FieldT>> b_d_tild;

    std::vector<std::vector <FieldT>> m_2d;
    std::vector<std::vector <std::vector <unsigned char>>> m_2d_n;
    
    std::vector <std::vector <std::vector <FieldT>>> m_2d_n_fieldT;
    
    std::vector <unsigned char> local_dealer_m_vec;

    std::vector <std::vector <FieldT>> c_d;
    std::vector <std::vector <FieldT>> m_d;

    std::vector <field_subset<FieldT>> B2;
    std::vector <field_subset<FieldT>> B3;
    std::vector <field_subset<FieldT>> B4;

    std::vector <std::vector <std::vector <FieldT>>> a_aShare;
    std::vector <std::vector <std::vector <FieldT>>> b_aShare;
    std::vector <std::vector <std::vector <FieldT>>> c_aShare;

    std::vector <std::vector <unsigned char>> test_abc_shares;
    std::vector <std::vector <unsigned char>> test_degree_d_abc_shares;

    int recv_md_data_count;
    std::vector <unsigned char> recv_md_data;

    std::shared_ptr <aes> aesImpl;
    std::shared_ptr <gen_shares> genSharesImpl;
//    std::vector <std::pair <std::vector <unsigned char>, std::vector <unsigned char>>> aes_seeds;
    std::shared_ptr <aes_seeds> seedsImpl;
    std::shared_ptr <comm_patterns> commPatternsImpl;
    std::vector <std::tuple <FieldT, FieldT, FieldT>> triple_shares;

    std::function <void(std::vector <std::tuple <FieldT, FieldT, FieldT>>)> on_pi_return_handler;
};

#endif