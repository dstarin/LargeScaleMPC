#include <iostream>
#include "../../tools/mp_network.h"
#include <libff/algebra/curves/edwards/edwards_pp.hpp>

#include <libiop/algebra/fft.hpp>
#include <libiop/algebra/fields/gf64.hpp>
#include <libiop/algebra/field_subset/subspace.hpp>
#include <libiop/algebra/utils.hpp>

using namespace libiop;

std::vector <unsigned char> share;

boost::promise <bool> async_promise;
int num_calls;
int num_recv;
int num_calls_2d;
int num_recv_2d;
int all_recved;

void on_player_recv(int player_j, int num_players, std::vector <unsigned char> data) {

    num_recv++;

    std::cout << "recv | d(" << player_j << "): ";
    for (int i = 0 ; i < data.size(); i++) printf("%.2X", data[i]);
    printf("\n");

    if (num_recv == num_players - 1) {
        std::cout << "all degree d shares received" << std::endl;
        std::cout.flush();
        
        all_recved++;

        if (all_recved == 2) {
            std::cout << "all shares received" << std::endl;
            async_promise.set_value(true);
        }
    }


}

void on_player_send(int player_num, int num_players, mp_network * network) {

    num_calls++;
    if (num_calls == num_players - 1) {

        std::cout << "receiving degree d shares from other players\n";
        for (int i = 1; i < num_players + 1; i++) {
            if (player_num != i)
                network->recv(i, 0, [i, num_players](std::vector <unsigned char> data){ on_player_recv(i, num_players, data); });
        }
    }
}

void on_player_recv_2d(int player_j, int num_players, std::vector <unsigned char> data) {

    num_recv_2d++;

    std::cout << "recv | 2d(" << player_j << "): ";
    for (int i = 0 ; i < data.size(); i++) printf("%.2X", data[i]);
    printf("\n");

    if (num_recv_2d == num_players - 1) {
        std::cout << "all 2d shares received" << std::endl;
        std::cout.flush();

        all_recved++;

        if (all_recved == 2)      {
            std::cout << "all shares received" << std::endl;
            async_promise.set_value(true);
        }
    }


}

void on_player_send_2d(int player_num, int num_players, mp_network * network) {

    num_calls_2d++;
    if (num_calls_2d == num_players - 1) {

        std::cout << "receiving degree 2d shares from other players\n";
        for (int i = 1; i < num_players + 1; i++) {
            if (player_num != i)
                network->recv(i, 1, [i, num_players](std::vector <unsigned char> data){ on_player_recv_2d(i, num_players, data); });
        }
    }
}


int main(int argc, char ** argv) {
  
    int player_num;
    int num_players;
    int base_port;
    
    int m = -1;
    int l = 1;

    if (argc != 4) {
        std::cout << "usage: ./player <player_num> <num_players> <base_port>\n";
        exit(-1);
    }

    player_num = atoi(argv[1]);
    num_players = atoi(argv[2]);
    base_port = atoi(argv[3]);

    if (num_players == 4)
        m = 3;

    std::cout << "player " << player_num << "/" << num_players << std::endl;

    asio::io_context p_ctx;
//    mp_network network(player_num, num_players, 1, base_port, &p_ctx);
    std::shared_ptr <mp_network> network = std::make_shared <mp_network> (player_num, num_players, 2, base_port, &p_ctx);
    network->connect().wait();
    std::cout << "connected!" << std::endl;
    
    typedef gf64 FieldT;
    boost::unique_future <bool> async_future = async_promise.get_future();

    // prep shares and send
        // generate B1, B2, B3
    field_subset<FieldT> B1 = field_subset<FieldT>(
        affine_subspace<FieldT>::random_affine_subspace(m));
    std::vector <FieldT> B2_basis(m-1);
    std::vector <FieldT> B2_basis_half (m - 2);
    std::vector <FieldT> B3_basis (m - 2);
    std::vector <FieldT> B4_basis (m - 1);

/*    field_subset<FieldT> BR = field_subset<FieldT>(
        affine_subspace<FieldT>::random_affine_subspace(16));
    printf("%llu\n\n", (unsigned long long)BR.offset().as_words()[0]);
    for (int i = 0; i < 16 ; i++) {
        printf("%llu\n", (unsigned long long)BR.basis()[i].as_words()[0]);
    }
*/

    // copy m-2 points of basis vector for B2,B3 basis
    for (int i = 0 ; i < m-2 ; i++){
        B2_basis[i] = B1.basis()[i];
        B2_basis_half[i] = B1.basis()[i];
        B3_basis[i] = B1.basis()[i];
        B4_basis[i] = B1.basis()[i];
    }

    // copy last B2 basis vector
    B2_basis[m-2] = B1.basis()[m-2];
    B4_basis[m-2] = B1.basis()[m-2];

    // B2 is the basis of size 2^{m-1}, unshifted
    // (this corresponds to the points with a 0 coeff in front of v_m)
    field_subset<FieldT> B2 = field_subset<FieldT>(
        affine_subspace <FieldT> (B2_basis, B1.offset()));

    field_subset<FieldT> B2_half = field_subset<FieldT>(
        affine_subspace <FieldT> (B2_basis_half, B1.offset()));

    // B3 is the basis of size 2^{m-2} shifted by v_{m}
    // (the important part is this space is disjoint from the space spanned by B2)
    field_subset<FieldT> B3 = field_subset<FieldT>(
        affine_subspace<FieldT> (B3_basis, B1.offset() + B1.basis()[m-1]));

    // B4 is the basis of size 2^{m-1} shifted by v_{m}
    field_subset<FieldT> B4 = field_subset<FieldT>(
        affine_subspace<FieldT> (B4_basis, B1.offset() + B1.basis()[m-1]));

    
    
    // pick random degree d poly, 2^{m-2} coefficients
    // zero out 1/2 high degree terms
    std::vector<FieldT> d_poly_coeffs = random_vector<FieldT>(((1ull<<m)/2));
    for (int i = (1ull<<m)/4; i < ((1ull<<m) / 2); i++)
        d_poly_coeffs[i] = gf64(0);
    
    const std::vector<FieldT> includes_packed_values =
        additive_FFT<FieldT>(d_poly_coeffs, B4.subspace());

    std::vector <FieldT> packed_values (includes_packed_values.begin(), includes_packed_values.begin() + l);
    
    std::vector <FieldT> new_points = random_vector <FieldT> ((1ull << m)/2);
    for (int i = 0; i < l; i++)
        new_points[i] = packed_values[i];

    const std::vector<FieldT> b4_poly =    
        additive_IFFT<FieldT>(new_points, B4.subspace());
   
    // generate 2d shares size 2^{m-1}
    const std::vector<FieldT> full_2d_shares =
        additive_FFT<FieldT>(b4_poly, B2.subspace());

/*
    // or go the other day 2d to d

    // generate random 2d shares
    std::vector <FieldT> shared_2d = random_vector <FieldT> (1ull << m);

    const std::vector<FieldT> b4_poly_from_shares =    
        additive_IFFT<FieldT>(shared_2d, B1.subspace());

    const std::vector<FieldT> points =
        additive_FFT<FieldT>(b4_poly_from_shares, B4.subspace());
    
    */
    




    // ShareRandom() degree 2^{m-1} - 1 == 2^{m-1} coefficients

    // generate 2^{m-1} = 4 shares
    const std::vector<FieldT> share_random_shares =
        additive_FFT<FieldT>(d_poly_coeffs, B2.subspace());

    num_calls = 0;
    num_recv = 0;
    num_calls_2d = 0;
    num_recv_2d = 0;
    all_recved = 0;

    // send out [1,2,3]
    std::cout << "\nsending n-1 shares of poly degree d (2^(" << m << "-2)-1 = 1)" << std::endl;
    for (int i = 1; i < num_players + 1; i++) {
        
        std::vector <unsigned char> uchar_64 (8);
        for (int k = 0 ; k < 8; k++)
            uchar_64[k] = (unsigned char) (share_random_shares[i-1].as_words()[0] >> (k*8));
        printf("send | d(%d): ", i);
        for (int k = 0 ; k < uchar_64.size(); k++) printf("%.2X", uchar_64[k]);
        printf("\n");
        std::cout.flush();
        if (i != player_num)
            network->send(i, 0, uchar_64, [player_num, num_players, network](){ on_player_send(player_num, num_players, network.get()); });
        
    } 

    std::cout << "\nsending n-1 shares of poly degree 2d (2^(" << m << "-2) = 2)" << std::endl;
    for (int i = 1; i < num_players + 1; i++) {
        
        std::vector <unsigned char> uchar_64 (8);
        for (int k = 0 ; k < 8; k++)
            uchar_64[k] = (unsigned char) (full_2d_shares[i-1].as_words()[0] >> (k*8));
        printf("send | 2d(%d): ", i);
        for (int k = 0 ; k < uchar_64.size(); k++) printf("%.2X", uchar_64[k]);
        printf("\n");
        std::cout.flush();
        if (i != player_num)
            network->send(i, 1, uchar_64, [player_num, num_players, network](){ on_player_send_2d(player_num, num_players, network.get()); });
        
    } 
   

    async_future.get();

    return 0;
}
