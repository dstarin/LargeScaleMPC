#include <iostream>
#include "../../tools/mp_network.h"
#include "../../tools/vandermonde.h"

#include <libff/algebra/curves/edwards/edwards_pp.hpp>

#include <libiop/algebra/fft.hpp>
#include <libiop/algebra/fields/gf64.hpp>
#include <libiop/algebra/field_subset/subspace.hpp>
#include <libiop/algebra/utils.hpp>

using namespace libiop;

#define OFFSET 8368420669794438635

#define DEALER_NUM 1

#define VM_FILE "../../../tools/gf64_generators.txt"

typedef gf64 FieldT;


std::vector <unsigned char> share;

boost::promise <bool> async_promise;
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
int h;

std::vector <FieldT> r_d;
std::vector <FieldT> r_2d;
std::vector <FieldT> a_d;
std::vector <FieldT> b_d;
std::vector <FieldT> r_d_tild;
std::vector <FieldT> r_2d_tild;
std::vector <FieldT> a_d_tild;
std::vector <FieldT> b_d_tild;

std::vector <FieldT> m_2d;
std::vector <std::vector <unsigned char>> m_2d_n;
std::vector <std::vector <FieldT>> m_2d_n_fieldT;
std::vector <unsigned char> local_dealer_m_vec;

std::vector <FieldT> c_d;
std::vector <FieldT> m_d;


field_subset<FieldT> B2;
field_subset<FieldT> B4;

boost::mutex read_mutex;


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

void on_recv_m_d (int player_num, int num_players, mp_network * network, std::vector <unsigned char> data) {

    int h = data.size() / sizeof(uint64_t);

    m_d.resize(h);

    // compute c = m - r
    c_d.resize(h);

    for (int j = 0; j < h; j++){
        memcpy(&m_d[j], data.data() + j*sizeof(uint64_t), sizeof(uint64_t));
        c_d[j] = m_d[j] - r_d[j];
    }

    // aShare(a) aShare(b) aShare(c) 

    std::cout.flush();
    async_promise.set_value(true);

}

void on_send_m_2d (int player_num, int num_players, mp_network * network) {

    network->recv(DEALER_NUM, [player_num, num_players, network](std::vector <unsigned char> data) { on_recv_m_d(player_num, num_players, network, data); });
}

void on_dealer_send_m_d (int player_j, int num_players, mp_network * network) {

    num_dealer_send_m_d++;

    if (num_dealer_send_m_d == num_players - 1) {

        // now continue as a regular player
        //
        on_recv_m_d(DEALER_NUM, num_players, network, local_dealer_m_vec);


    }
}

void on_dealer_recv_m_2d(int player_j, int num_players, mp_network * network, std::vector <unsigned char> data) {
    num_dealer_recv_m_2d++;

    // store incoming m_2d
    m_2d_n[player_j] = data;

    if (num_dealer_recv_m_2d == num_players - 1) {

        // reconstrud m_2d and share (d, m)

        // convert unsigned char data to FieldT shares
        // use m_2d for DEALER share
        printf("h: %d\n", h);
        printf("m_2d size 2: %d", m_2d.size());

        m_2d_n_fieldT.resize(h);

        for (int j = 0; j < h; j++) {
            m_2d_n_fieldT[j].resize(num_players + 1);
            for (int i = 1; i < num_players + 1; i++){
                if (i == DEALER_NUM) {
                    // get local share for dealer
                    m_2d_n_fieldT[j][i] = m_2d[j*sizeof(uint64_t)];
                } else
                    m_2d_n_fieldT[j][i] = FieldT(conv64(m_2d_n[i+j*sizeof(uint64_t)]));
            }
        }
        // now convert to degree d shares
        // 1. poly = IFFT (m_2d_shares, B2)
        // 2. points = FFT (poly, B4)
        // 3. degree_d_poly = IFFT (points, B4)
        // 4. degree_d_shares = FFT (degree_d_poly, B2)

        std::vector <std::vector <FieldT>> d_shares(num_players + 1);

        for (int j = 0; j < h; j++) {
            const std::vector<FieldT> b4_poly =    
                additive_IFFT<FieldT>(m_2d_n_fieldT[j], B2.subspace());
            
            const std::vector<FieldT> points =
                additive_FFT<FieldT>(b4_poly, B4.subspace());

            const std::vector<FieldT> b4_poly_d =    
                additive_IFFT<FieldT>(points, B4.subspace());

            const std::vector <FieldT> d_shares_local =
                additive_FFT<FieldT>(b4_poly_d, B2.subspace());

            if (j == 0) {
                for (int i = 1; i < num_players + 1; i++)
                    d_shares[i].resize(h);
            }
            for (int i = 1; i < num_players + 1; i++)
                d_shares[i][j] = d_shares_local[i-1];
        }
        printf("h2: %d\n", h);

        // now send d_shares
        num_dealer_send_m_d = 0;
        std::cout << "\nsending n-1 shares of m -- poly degree d" << std::endl;
        for (int i = 1; i < num_players + 1; i++) {
    
            std::vector <unsigned char> uchar_64_m_vec (h*sizeof(uint64_t));

            for (int j = 0 ; j < h; j++)
                memcpy(uchar_64_m_vec.data()+j*sizeof(uint64_t), &(d_shares[i][j].as_words()[0]), sizeof(uint64_t));

            printf("send | m_d_vec(%d): \n", i);
            printf("uchar_64_m_vec size: %d\n", (int)uchar_64_m_vec.size());
            for (int k = 0 ; k < uchar_64_m_vec.size(); k++){
                if (k%8 == 0) {
                    printf(" ");
                }
                printf("%.2X", uchar_64_m_vec[k]);
            }
            printf("\n");
            std::cout.flush();
            if (i != DEALER_NUM)
                network->send(i, uchar_64_m_vec, [i, num_players, network](){ on_dealer_send_m_d(i, num_players, network); });
            else
                local_dealer_m_vec = uchar_64_m_vec;
        }        
    }

}

void on_all_shares_recved(int player_num, int num_players, int l, mp_network * network) {

    // now multiply shares by vandermonde transpose
    // need to create the vandermonde in advance in future...
//    std::string filename = VM_FILE;
    vandermonde vm_t_gf64(64, num_players, l, VM_FILE);

    r_d = vm_t_gf64.mult_vec(r_d_tild);
    r_2d = vm_t_gf64.mult_vec(r_2d_tild);
    a_d = vm_t_gf64.mult_vec(a_d_tild);
    b_d = vm_t_gf64.mult_vec(b_d_tild);
    
    // now compute m^j_2d = a^j_ d* b^j_d + r^j_2d (step 3)
    // for j = 1,...,h
    
    // a_d should be length h
    h = a_d.size();
    m_2d.resize(h);
    

    for (int j = 0; j < h; j++){
        m_2d[j] = a_d[j] * b_d[j] + r_2d[j];
    }

    printf("m_2d size: %d\n", m_2d.size());
    // now send m_2d to DEALER, p1

    if (player_num == DEALER_NUM ) {
        num_dealer_recv_m_2d = 0;
        m_2d_n.resize(num_players+1);
        for (int i = 1; i < num_players + 1; i++) {
            if (i != DEALER_NUM)
                network->recv(i, [i, num_players, network](std::vector <unsigned char> data){ on_dealer_recv_m_2d(i, num_players, network, data); });
        }
    } else {

        // convert m_2d to unsigned char vector
        // prepare m^j_2d to send and send to DEALER
        std::vector <unsigned char> data (sizeof(uint64_t) * h);
        for (int j = 0 ; j < h; j++)
            memcpy(data.data()+j*sizeof(uint64_t), &m_2d[j].as_words()[0], sizeof(uint64_t));

        network->send(DEALER_NUM, data, [player_num, num_players, network](){ on_send_m_2d(player_num, num_players, network); });
    }




}



void on_player_recv(int player_j, int player_num, int num_players, int l, mp_network * network, std::vector <unsigned char> data) {



    num_recv++;

    std::cout << "recv | d(" << player_j << "): ";
    for (int i = 0 ; i < data.size(); i++) printf("%.2X", data[i]);
    printf("\n");

    r_d_tild[player_j-1] = FieldT(conv64(data));


    if (num_recv == num_players - 1) {
        std::cout << "all r(d) shares received" << std::endl;
        std::cout.flush();
        

        all_recved++;

        if (all_recved == 4) {
            std::cout << "all shares received" << std::endl;
            on_all_shares_recved(player_num, num_players, l, network);
        }

    }



}

void on_player_send(int player_num, int num_players, int l, mp_network * network) {

    num_calls++;
    if (num_calls == num_players - 1) {

        std::cout << "receiving r (degree d) shares from other players\n";
        for (int i = 1; i < num_players + 1; i++) {
            if (player_num != i)
                network->recv(i, 0, [i, player_num, num_players, l, network](std::vector <unsigned char> data){ on_player_recv(i, player_num, num_players, l, network, data); });
        }
    }
}

void on_player_recv_2d(int player_j, int player_num, int num_players, int l, mp_network * network, std::vector <unsigned char> data) {


    num_recv_2d++;

    r_2d_tild[player_j-1] = FieldT(conv64(data));


    std::cout << "recv | 2d(" << player_j << "): ";
    for (int i = 0 ; i < data.size(); i++) printf("%.2X", data[i]);
    printf("\n");

    if (num_recv_2d == num_players - 1) {
        std::cout << "all r (2d) shares received" << std::endl;
        std::cout.flush();

        

        all_recved++;
        if (all_recved == 4)      {
            std::cout << "all shares received" << std::endl;
            on_all_shares_recved(player_num, num_players, l, network);
        }

    }


}

void on_player_send_2d(int player_num, int num_players, int l, mp_network * network) {

    num_calls_2d++;
    if (num_calls_2d == num_players - 1) {

        std::cout << "receiving r (degree 2d) shares from other players\n";
        for (int i = 1; i < num_players + 1; i++) {
            if (player_num != i)
                network->recv(i, 1, [i, player_num, num_players, l, network](std::vector <unsigned char> data){ on_player_recv_2d(i, player_num, num_players, l, network, data); });
        }
    }
}

void on_player_recv_a(int player_j, int player_num, int num_players, int l, mp_network * network, std::vector <unsigned char> data) {

    num_recv_a++;

    a_d_tild[player_j-1] = FieldT(conv64(data));

    std::cout << "recv | a(" << player_j << "): ";
    for (int i = 0 ; i < data.size(); i++) printf("%.2X", data[i]);
    printf("\n");

    if (num_recv_a == num_players - 1) {
        std::cout << "all a shares received" << std::endl;
        std::cout.flush();


        all_recved++;

        if (all_recved == 4) {
            std::cout << "all shares received" << std::endl;
            on_all_shares_recved(player_num, num_players, l, network);
        }

    }
}

void on_player_send_a(int player_num, int num_players, int l, mp_network * network) {

    num_calls_a++;
    if (num_calls_a == num_players - 1) {

        std::cout << "receiving a (degree d) shares from other players\n";
        for (int i = 1; i < num_players + 1; i++) {
            if (player_num != i)
                network->recv(i, 2, [i, player_num, num_players, l, network](std::vector <unsigned char> data){ on_player_recv_a(i, player_num, num_players, l, network, data); });
        }
    }
    
}

void on_player_recv_b(int player_j, int player_num, int num_players, int l, mp_network * network, std::vector <unsigned char> data) {



    num_recv_b++;

    b_d_tild[player_j-1] = FieldT(conv64(data));

    std::cout << "recv | b(" << player_j << "): ";
    for (int i = 0 ; i < data.size(); i++) printf("%.2X", data[i]);
    printf("\n");

    if (num_recv_b == num_players - 1) {
        std::cout << "all b shares received" << std::endl;
        std::cout.flush();

        all_recved++;

        if (all_recved == 4) {
            std::cout << "all shares received" << std::endl;
            on_all_shares_recved(player_num, num_players, l, network);
        }

    }



}

void on_player_send_b(int player_num, int num_players, int l, mp_network * network) {

    num_calls_b++;
    if (num_calls_b == num_players - 1) {

        std::cout << "receiving b (degree d) shares from other players\n";
        for (int i = 1; i < num_players + 1; i++) {
            if (player_num != i)
                network->recv(i, 3, [i, player_num, num_players, l, network](std::vector <unsigned char> data){ on_player_recv_b(i, player_num, num_players, l, network, data); });
        }
    }

    
}


int main(int argc, char ** argv) {
  
    int player_num;
    int num_players;
    int num_channels;
    int base_port;
    
    int m = -1;
    int l = 2;
    int n = -1;

    if (argc != 4) {
        std::cout << "usage: ./player <player_num> <num_players> <base_port>\n";
        exit(-1);
    }

    player_num = atoi(argv[1]);
    num_players = atoi(argv[2]);
    base_port = atoi(argv[3]);

    n = num_players;
    if (num_players == 4)
        m = 3;
    
    if (num_players == 8)
        m = 4;

    std::cout << "player " << player_num << "/" << num_players << std::endl;

    asio::io_context p_ctx;
//    mp_network network(player_num, num_players, 1, base_port, &p_ctx);
    std::shared_ptr <mp_network> network = std::make_shared <mp_network> (player_num, num_players, 4, base_port, &p_ctx);
    network->connect().wait();
    std::cout << "connected!" << std::endl;

    boost::unique_future <bool> async_future = async_promise.get_future();


    r_d.resize(n);
    r_2d.resize(n);
    r_d_tild.resize(n);
    r_2d_tild.resize(n);
    a_d.resize(n);
    a_d_tild.resize(n);
    b_d.resize(n);
    b_d_tild.resize(n);



    // prep shares and send
        // generate B1, B2, B3

    FieldT offsetConst = FieldT(OFFSET);
    field_subset<FieldT> B1 = field_subset<FieldT>(
        affine_subspace<FieldT>::random_affine_subspace(m));
    std::vector <FieldT> B2_basis(m-1);
    std::vector <FieldT> B2_basis_half (m - 2);
    std::vector <FieldT> B3_basis (m - 2);
    std::vector <FieldT> B4_basis (m - 1);

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
    B2 = field_subset<FieldT>(
        affine_subspace <FieldT> (B2_basis, offsetConst));

    field_subset<FieldT> B2_half = field_subset<FieldT>(
        affine_subspace <FieldT> (B2_basis_half, offsetConst));

    // B3 is the basis of size 2^{m-2} shifted by v_{m}
    // (the important part is this space is disjoint from the space spanned by B2)
    field_subset<FieldT> B3 = field_subset<FieldT>(
        affine_subspace<FieldT> (B3_basis, offsetConst + B1.basis()[m-1]));

    // B4 is the basis of size 2^{m-1} shifted by v_{m}
    B4 = field_subset<FieldT>(
        affine_subspace<FieldT> (B4_basis, offsetConst + B1.basis()[m-1]));

    
    
    // pick random r -- degree d poly, 2^{m-2} coefficients
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
    // used for degree 2d sharing of r

    const std::vector<FieldT> full_2d_shares =
        additive_FFT<FieldT>(b4_poly, B2.subspace());

    // ShareRandom() degree 2^{m-1} - 1 == 2^{m-1} coefficients

    // generate 2^{m-1} = 4 shares

    // used for degree d sharing of r
    // d_poly_coeffs has high order terms zeroed out
    const std::vector<FieldT> share_random_shares =
        additive_FFT<FieldT>(d_poly_coeffs, B2.subspace());

    // pick random a -- degree d poly, 2^{m-2} coefficients
    // zero out 1/2 high degree terms
    std::vector<FieldT> a_poly_coeffs = random_vector<FieldT>(((1ull<<m)/2));
    for (int i = (1ull<<m)/4; i < ((1ull<<m) / 2); i++)
        a_poly_coeffs[i] = FieldT(0);
    
    // pick random b -- degree d poly, 2^{m-2} coefficients
    // zero out 1/2 high degree terms
    std::vector<FieldT> b_poly_coeffs = random_vector<FieldT>(((1ull<<m)/2));
    for (int i = (1ull<<m)/4; i < ((1ull<<m) / 2); i++)
        b_poly_coeffs[i] = FieldT(0);

    const std::vector<FieldT> a_shares =
        additive_FFT<FieldT>(a_poly_coeffs, B2.subspace());

    const std::vector<FieldT> b_shares =
        additive_FFT<FieldT>(b_poly_coeffs, B2.subspace());

    num_calls = 0;
    num_recv = 0;
    num_calls_2d = 0;
    num_recv_2d = 0;
    num_calls_a = 0;
    num_recv_a = 0;
    num_calls_b = 0;
    num_recv_b = 0;
    all_recved = 0;

    // send out [1,2,3]
    std::cout << "\nsending n-1 shares of r -- poly degree d (2^(" << m << "-2) - 1 = 1)" << std::endl;
    for (int i = 1; i < num_players + 1; i++) {
        
        std::vector <unsigned char> uchar_64 = ui64conv(share_random_shares[i-1].as_words()[0]);
        printf("send | d(%d): ", i);
        for (int k = 0 ; k < uchar_64.size(); k++) printf("%.2X", uchar_64[k]);
        printf("\n");
        std::cout.flush();
        if (i != player_num)
            network->send(i, 0, uchar_64, [player_num, num_players, l, network](){ on_player_send(player_num, num_players, l, network.get()); });
        else
            r_d_tild [i-1] = share_random_shares[i-1];
        
    } 

    std::cout << "\nsending n-1 shares of r -- poly degree 2d (2^(" << m << "-1)-2 = 2)" << std::endl;
    for (int i = 1; i < num_players + 1; i++) {
        
        std::vector <unsigned char> uchar_64 = ui64conv(full_2d_shares[i-1].as_words()[0]);
        printf("send | 2d(%d): ", i);
        for (int k = 0 ; k < uchar_64.size(); k++) printf("%.2X", uchar_64[k]);
        printf("\n");
        std::cout.flush();
        if (i != player_num)
            network->send(i, 1, uchar_64, [player_num, num_players, l, network](){ on_player_send_2d(player_num, num_players, l, network.get()); });
        else
            r_2d_tild[i-1] = full_2d_shares[i-1];
        
    } 
   
    std::cout << "\nsending n-1 shares of a -- poly degree d (2^(" << m << "-2)-1 = 1)" << std::endl;
    for (int i = 1; i < num_players + 1; i++) {
        
        std::vector <unsigned char> uchar_64 = ui64conv(a_shares[i-1].as_words()[0]);
        printf("send | a(%d): ", i);
        for (int k = 0 ; k < uchar_64.size(); k++) printf("%.2X", uchar_64[k]);
        printf("\n");
        std::cout.flush();
        if (i != player_num)
            network->send(i, 2, uchar_64, [player_num, num_players, l, network](){ on_player_send_a(player_num, num_players, l, network.get()); });
        else
            a_d_tild[i-1] = a_shares[i-1];
        
    } 

    std::cout << "\nsending n-1 shares of b -- poly degree d (2^(" << m << "-2)-1 = 1)" << std::endl;
    for (int i = 1; i < num_players + 1; i++) {
        
        std::vector <unsigned char> uchar_64 = ui64conv(b_shares[i-1].as_words()[0]);
        printf("send | b(%d): ", i);
        for (int k = 0 ; k < uchar_64.size(); k++) printf("%.2X", uchar_64[k]);
        printf("\n");
        std::cout.flush();
        if (i != player_num)
            network->send(i, 3, uchar_64, [player_num, num_players, l, network](){ on_player_send_b(player_num, num_players, l, network.get()); });
        else
            b_d_tild[i-1] = b_shares[i-1];
        
    } 


    async_future.get();

    return 0;
}
