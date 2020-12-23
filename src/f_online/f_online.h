#ifndef _F_ONLINE_H_
#define _F_ONLINE_H_

#include <iostream>
#include "../tools/mp_network.h"

#include <libff/algebra/curves/edwards/edwards_pp.hpp>

#include <libiop/algebra/fft.hpp>
#include <libiop/algebra/fields/gf64.hpp>
#include <libiop/algebra/field_subset/subspace.hpp>
#include <libiop/algebra/utils.hpp>

#define OFFSET 8368420669794438635
#define DEALER_NUM 1

#define TEST_INPUT_SEED 5

using namespace libiop;
typedef gf64 FieldT;


class f_online : public std::enable_shared_from_this <f_online> {

public:

    f_online(mp_network * _network);
    void pi(FieldT _x_share, FieldT _y_share, std::vector <std::tuple <FieldT, FieldT, FieldT>> _triple_shares, std::function <void(FieldT)> _on_pi_return_handler);
    void on_send_triple_de();
    void on_recv_triple_de(int player_j, std::vector <unsigned char> data);
    void on_recv_xy_test(int player_j, std::vector <unsigned char> data);
    void on_send_xy_test();

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
    int n;
    mp_network * network;
    boost::promise <bool> async_promise;
    FieldT a_share;
    FieldT b_share;
    FieldT c_share;
    FieldT e_share;
    FieldT x_share;
    FieldT y_share;
    FieldT d;
    FieldT e;
    FieldT xy;
    FieldT xy_share;
    std::vector <FieldT> xy_shares;
    int num_send_triple_de;
    int num_recv_triple_de;
    int num_recv_xy_test;

    std::vector <std::tuple <FieldT, FieldT, FieldT>> triple_shares;
    std::function <void(FieldT)> on_pi_return_handler;
};

#endif