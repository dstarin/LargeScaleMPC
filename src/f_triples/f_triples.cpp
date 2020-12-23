#include "f_triples.h"

f_triples::f_triples(mp_network * _network, int _committee_size, int _p_factor){

    std::stringstream np_string;
    std::stringstream p_string;
    std::string seed_filename;
    std::string base_dir (CONFIG_BASE_DIR);
    network = _network;
    n = network->num_players;
    num_players = network->num_players;
    player_num = network->player_num;
    committee_size = _committee_size;
    p_factor = _p_factor;

    aesImpl = std::make_shared <aes>();

    np_string << std::setfill('0') << std::setw(3) << num_players;
    p_string << std::setfill('0') << std::setw(3) << player_num;
    seed_filename = base_dir + "seeds/" + np_string.str() + "-party/mpc" + p_string.str() + "-seeds.txt";   
    seedsImpl = std::make_shared <aes_seeds>(num_players, seed_filename);
    r_d.resize(p_factor);
    r_2d.resize(p_factor);
    r_d_tild.resize(p_factor);
    r_2d_tild.resize(p_factor);
    a_d.resize(p_factor);
    a_d_tild.resize(p_factor);
    b_d.resize(p_factor);
    b_d_tild.resize(p_factor);
    m_2d.resize(p_factor);
    m_2d_n.resize(p_factor);
    m_2d_n_fieldT.resize(p_factor);
    m_d.resize(p_factor);
    c_d.resize(p_factor);
    a_aShare.resize(p_factor);
    b_aShare.resize(p_factor);
    c_aShare.resize(p_factor);


    for (int i = 0 ; i < p_factor; i++) {
        r_d[i].resize(n);
        r_2d[i].resize(n);
        r_d_tild[i].resize(n);
        r_2d_tild[i].resize(n);
        a_d[i].resize(n);
        a_d_tild[i].resize(n);
        b_d[i].resize(n);
        b_d_tild[i].resize(n);
    }

    // corruption = 1/3

    if (num_players == 4){
        m = 3;
    }

    if (num_players == 8) {
        m = 4;
        l = 2;
        h = 6;
    }

    if (num_players == 16) {
        m = 5;
        l = 2;
        h = 11;
    }

    if (num_players == 32) {
        m = 6;
        l = 5;
        h = 22;
    }

    if (num_players == 64) {
        m = 7;
        l = 10;
        h = 43;
    }

    if (num_players == 128) {
        m = 8;
        l = 21;
        h = 86;
    }

    if (num_players == 256) {
        m = 9;
        l = 42;
        h = 171;
    }

    if (num_players == 512){
        m = 10;
        l = 85;
        h = 342;
    }

    commPatternsImpl = std::make_shared <comm_patterns> (committee_size, num_players, h, CONFIG_BASE_DIR);
    genSharesImpl = std::make_shared <gen_shares> (player_num, commPatternsImpl->committee, seedsImpl->seeds, aesImpl);


}

void f_triples::prep_shares_and_send() {

    auto self = shared_from_this();

// prep shares and send
        // generate B1, B2, B3

    std::vector <FieldT> offsetConst (p_factor);
    std::vector <field_subset<FieldT>> B1 (p_factor);
    std::vector <std::vector <FieldT>> B2_basis (p_factor);
    std::vector <std::vector <FieldT>> B2_basis_half (p_factor);
    std::vector <std::vector <FieldT>> B3_basis (p_factor);
    std::vector <std::vector <FieldT>> B4_basis (p_factor);
    B2.resize(p_factor);
    B3.resize(p_factor);
    B4.resize(p_factor);
    

    for (int i = 0 ; i < p_factor; i++) {
        offsetConst[i] = FieldT(OFFSET);
        B1[i] = field_subset<FieldT> (affine_subspace<FieldT>::random_affine_subspace(m));
        B2_basis[i].resize (m-1);
        B2_basis_half[i].resize (m - 2);
        B3_basis[i].resize (m - 2);
        B4_basis[i].resize (m - 1);
    };

    // copy m-2 points of basis vector for B2,B3 basis
    for (int j = 0; j < p_factor; j++){
        for (int i = 0 ; i < m-2 ; i++){
            B2_basis[j][i] = B1[j].basis()[i];
            B2_basis_half[j][i] = B1[j].basis()[i];
            B3_basis[j][i] = B1[j].basis()[i];
            B4_basis[j][i] = B1[j].basis()[i];
        }
    }

    std::vector <field_subset<FieldT>> B2_half (p_factor);

    for (int j = 0; j < p_factor; j++){
        // copy last B2 basis vector
        B2_basis[j][m-2] = B1[j].basis()[m-2];
        B4_basis[j][m-2] = B1[j].basis()[m-2];
    
        // B2 is the basis of size 2^{m-1}, unshifted
        // (this corresponds to the points with a 0 coeff in front of v_m)
        B2[j] = field_subset<FieldT>(
            affine_subspace <FieldT> (B2_basis[j], offsetConst[j]));

        B2_half[j] = field_subset<FieldT>(
            affine_subspace <FieldT> (B2_basis_half[j], offsetConst[j]));

        // B3 is the basis of size 2^{m-2} shifted by v_{m}
        // (the important part is this space is disjoint from the space spanned by B2)
        B3[j] = field_subset<FieldT>(
            affine_subspace<FieldT> (B3_basis[j], offsetConst[j] + B1[j].basis()[m-1]));

        // B4 is the basis of size 2^{m-1} shifted by v_{m}
        B4[j] = field_subset<FieldT>(
            affine_subspace<FieldT> (B4_basis[j], offsetConst[j] + B1[j].basis()[m-1]));

    }
// 1.  poly=iFFT(m_2d_shares,B2) - this is reconstructing the 2d degree poly
//
// 2.  points=FFT(poly,B3) - recover the secrets that are packed into that degree 2d poly
//
// 3.  Generate a fresh degree d sharing of points.  In particular, only the first l points in points are secrets.
//     So, I think you want to generate new random values for the remaining d-l points and then run iFFT over B3
//     to recover the degree_d_poly
//
// 4.  m_d_shares = FFT(degree_d_poly, B2) 

// then to go the other way m_d to m_2d
//
// 1. degree_d_poly = IFFT (m_d_shares, B2)
// 2. points = FFT (degree_d_poly, B3)
//    1st l points are secret, other points random gen
// 3.  poly = IFFT( packed_plus_random, B3)
// 4.  degree_2d_shares = FFT(poly, B2)

    std::vector <std::vector<FieldT>> d_poly_coeffs (p_factor);
    std::vector <std::vector<FieldT>> share_random_shares (p_factor);
    std::vector <std::vector<FieldT>> points (p_factor);
    std::vector <std::vector<FieldT>> new_points (p_factor);
    std::vector <std::vector<FieldT>> b3_poly (p_factor);
    std::vector <std::vector<FieldT>> full_2d_shares (p_factor);
    std::vector <std::vector<FieldT>> a_poly_coeffs (p_factor);
    std::vector <std::vector<FieldT>> b_poly_coeffs (p_factor);
    std::vector <std::vector<FieldT>> a_shares (p_factor);
    std::vector <std::vector<FieldT>> b_shares (p_factor);

    for (int j = 0; j < p_factor; j++) {

        d_poly_coeffs[j] = random_vector<FieldT>(((1ull<<m)/2));
        for (int i = (1ull<<m)/4; i < ((1ull<<m) / 2); i++)
            d_poly_coeffs[j][i] = gf64(0);

        // used for degree d sharing of r
        // d_poly_coeffs has high order terms zeroed out
        share_random_shares[j] =
            additive_FFT<FieldT>(d_poly_coeffs[j], B2[j].subspace());

        points[j] =
            additive_FFT<FieldT>(d_poly_coeffs[j], B4[j].subspace());

        new_points[j] = random_vector <FieldT> ((1ull << m)/2);

        for (int i = 0; i < l; i++)
            new_points[j][i] = points[j][i];

        b3_poly[j] =    
            additive_IFFT<FieldT>(new_points[j], B4[j].subspace());

        full_2d_shares[j] =
            additive_FFT<FieldT>(b3_poly[j], B2[j].subspace());

        // pick random a -- degree d poly, 2^{m-2} coefficients
        // zero out 1/2 high degree terms
        a_poly_coeffs[j] = random_vector<FieldT>(((1ull<<m)/2));
        for (int i = (1ull<<m)/4; i < ((1ull<<m) / 2); i++)
            a_poly_coeffs[j][i] = FieldT(0);
        
        // pick random b -- degree d poly, 2^{m-2} coefficients
        // zero out 1/2 high degree terms
        b_poly_coeffs[j] = random_vector<FieldT>(((1ull<<m)/2));
        for (int i = (1ull<<m)/4; i < ((1ull<<m) / 2); i++)
            b_poly_coeffs[j][i] = FieldT(0);

        a_shares[j] =
            additive_FFT<FieldT>(a_poly_coeffs[j], B2[j].subspace());

        b_shares[j] =
            additive_FFT<FieldT>(b_poly_coeffs[j], B2[j].subspace());

    }

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
    #ifdef DEBUG_TRIPLES
    std::cout << "\nsending n-1 shares of r -- poly degree d (2^(" << m << "-2) - 1 = 1)" << std::endl;
    #endif    
    for (int i = 1; i < num_players + 1; i++) {
        
        std::vector <unsigned char> uchar_64;
        uchar_64.resize(8*p_factor);
        
        for (int j = 0; j < p_factor; j++)
            memcpy(uchar_64.data()+8*j, ui64conv(share_random_shares[j][i-1].as_words()[0]).data(), sizeof(uint64_t));




        #ifdef DEBUG_TRIPLES_DATA
        printf("send | d(%d): ", i);
        for (int k = 0 ; k < uchar_64.size(); k++) printf("%.2X", uchar_64[k]);
        printf("\n");
        std::cout.flush();
        #endif

        if (i != player_num)
            network->send(i, 0, uchar_64, [this, self](){ on_player_send(); });
        else {
            for (int j = 0; j < p_factor; j++)
                r_d_tild [j][i-1] = share_random_shares[j][i-1];
        }
    } 

    #ifdef DEBUG_TRIPLES
    std::cout << "\nsending n-1 shares of r -- poly degree 2d (2^(" << m << "-1)-2 = 2)" << std::endl;
    #endif

    for (int i = 1; i < num_players + 1; i++) {
        
        std::vector <unsigned char> uchar_64;
        uchar_64.resize(8*p_factor);
        
        for (int j = 0; j < p_factor; j++)
            memcpy(uchar_64.data()+8*j, ui64conv(full_2d_shares[j][i-1].as_words()[0]).data(), sizeof(uint64_t));

        #ifdef DEBUG_TRIPLES_DATA
        printf("send | 2d(%d): ", i);
        for (int k = 0 ; k < uchar_64.size(); k++) printf("%.2X", uchar_64[k]);
        printf("\n");
        std::cout.flush();
        #endif

        if (i != player_num)
            network->send(i, 1, uchar_64, [this, self](){ on_player_send_2d(); });
        else {
            for (int j = 0; j < p_factor; j++)
                r_2d_tild[j][i-1] = full_2d_shares[j][i-1];
        }
    } 
    #ifdef DEBUG_TRIPLES
    std::cout << "\nsending n-1 shares of a -- poly degree d (2^(" << m << "-2)-1 = 1)" << std::endl;
    #endif

    for (int i = 1; i < num_players + 1; i++) {
        
        std::vector <unsigned char> uchar_64;
        uchar_64.resize(8*p_factor);
        
        for (int j = 0; j < p_factor; j++)
            memcpy(uchar_64.data()+8*j, ui64conv(a_shares[j][i-1].as_words()[0]).data(), sizeof(uint64_t));


        #ifdef DEBUG_TRIPLES_DATA
        printf("send | a(%d): ", i);
        for (int k = 0 ; k < uchar_64.size(); k++) printf("%.2X", uchar_64[k]);
        printf("\n");
        std::cout.flush();
        #endif

        if (i != player_num)
            network->send(i, 2, uchar_64, [this, self](){ on_player_send_a(); });
        else {
            for (int j = 0; j < p_factor; j++)
                a_d_tild[j][i-1] = a_shares[j][i-1];
        }
        
    } 

    #ifdef DEBUG_TRIPLES
    std::cout << "\nsending n-1 shares of b -- poly degree d (2^(" << m << "-2)-1 = 1)" << std::endl;
    #endif

    for (int i = 1; i < num_players + 1; i++) {
        
        std::vector <unsigned char> uchar_64;
        uchar_64.resize(8*p_factor);
        
        for (int j = 0; j < p_factor; j++)
            memcpy(uchar_64.data()+8*j, ui64conv(b_shares[j][i-1].as_words()[0]).data(), sizeof(uint64_t));


        #ifdef DEBUG_TRIPLES_DATA
        printf("send | b(%d): ", i);
        for (int k = 0 ; k < uchar_64.size(); k++) printf("%.2X", uchar_64[k]);
        printf("\n");
        std::cout.flush();
        #endif

        if (i != player_num)
            network->send(i, 3, uchar_64, [this, self](){ on_player_send_b(); });
        else {
            for (int j = 0; j < p_factor; j++)
                b_d_tild[j][i-1] = b_shares[j][i-1];
        }        
    } 
}

void f_triples::pi(std::function <void(std::vector <std::tuple <FieldT, FieldT, FieldT>>)> _on_pi_return_handler){

    on_pi_return_handler = _on_pi_return_handler;

    auto self = shared_from_this();

    #ifdef DEBUG_TRIPLES
    std::cout << "all aes seed keys received!" << std::endl;
    #endif
    prep_shares_and_send();

}

/*

FieldT f_triples::getaShare(int seed_type, int player_j, int index){

    // get key from aes_seeds

    // encrypt send data using key
    std::vector <unsigned char> enc_data;

    std::vector <unsigned char> uchar_index (sizeof(int));
    memcpy(uchar_index.data(), &index, sizeof(int));

    std::vector <unsigned char> iv(AES_BLOCK_SIZE, 0); // use 0 iv (one msg per key)

    // these are generated by this player
    if (seed_type == 1)
        aesImpl->aes256ecb_encrypt(enc_data, uchar_index, seedsImpl->seeds[player_j-1], iv);

    // these are received from other players
    if (seed_type == 2)
        aesImpl->aes256ecb_encrypt(enc_data, uchar_index, seedsImpl->seeds[player_j-1], iv);


    // 128-bit output (size:16)
//    printf("ecb index\n");
//    for (int i = 0; i < enc_data.size(); i++) {
//        printf("%.2X", enc_data[i]);
//    }
//    printf("\n");

    // get first 64-bits of output as share
    uint64_t element;
    memcpy(&element, enc_data.data(), sizeof(uint64_t));
    return FieldT(element);
}

FieldT f_triples::aShare(int index, FieldT element) {

    // needs to call getaShare (index, player)
    FieldT total = element;
    for (int j = 1; j < num_players + 1; j++) {
        if (j != player_num) {
                total += getaShare(1, j, index);
        }
    }

    return total;
}

void f_triples::on_send_test_abc_shares() {
    on_pi_return_handler(triple_shares);
}

void f_triples::on_recv_test_abc_shares(int player_j, std::vector <unsigned char> data) {

    #ifdef DEBUG_TRIPLES
    std::cout << "recving " << data.size() << " from " << player_j << std::endl;
    #endif

    recv_test_abc_shares++;

    test_abc_shares[player_j] = data;

    if (recv_test_abc_shares == num_players - 1) {

        // recombine and test shares


        for (int i = 0 ; i < num_players; i++) {

            FieldT a_value = FieldT(0);
            FieldT b_value = FieldT(0);
            FieldT c_value = FieldT(0);
            for (int j = 1; j < num_players + 1; j++) {
                uint64_t a_share;
                uint64_t b_share;
                uint64_t c_share;

                memcpy(&a_share, test_abc_shares[j].data() + 3*i*sizeof(uint64_t), sizeof(uint64_t));
                memcpy(&b_share, test_abc_shares[j].data() + 3*i*sizeof(uint64_t)+sizeof(uint64_t), sizeof(uint64_t));
                memcpy(&c_share, test_abc_shares[j].data() + 3*i*sizeof(uint64_t)+2*sizeof(uint64_t), sizeof(uint64_t));
                
                a_value += FieldT(a_share);
                b_value += FieldT(b_share);
                c_value += FieldT(c_share);

                #ifdef DEBUG_TRIPLES
                std::cout << "a_share: ";
                FieldT(a_share).print();
                std::cout << "b_share: ";
                FieldT(b_share).print();
                std::cout << "c_share: ";
                FieldT(c_share).print();
                #endif
                            
            }

            #ifdef DEBUG_TRIPLES
            // check if a*b == c
            a_value.print();
            b_value.print();
            c_value.print();
            #endif
            if (a_value * b_value == c_value)
                std::cout << "i: " << i << " -- valid shared triple!" << std::endl;
            else
                std::cout << "i: " << i << " -- invalid shared triple!" << std::endl;
            
        }

        on_pi_return_handler(triple_shares);
    }



}

void f_triples::on_send_test_degree_d_abc_shares() {

    on_pi_return_handler(triple_shares);
}

void f_triples::on_recv_test_degree_d_abc_shares(int player_j, std::vector <unsigned char> data) {

    #ifdef DEBUG_TRIPLES
    std::cout << "degree d abc shares test: recving from " << player_j << std::endl;
    #endif

    recv_test_degree_d_abc_shares++;

    test_degree_d_abc_shares[player_j] = data;

    if (recv_test_degree_d_abc_shares == num_players - 1) {

        // recombine and test shares


        for (int i = 0 ; i < (data.size() / sizeof(uint64_t) ) / 3; i++) {

            std::vector <FieldT> a_degree_d (num_players);
            std::vector <FieldT> b_degree_d (num_players);
            std::vector <FieldT> c_degree_d (num_players);
            for (int j = 1; j < num_players + 1; j++) {

                uint64_t a_share;
                uint64_t b_share;
                uint64_t c_share;

                memcpy(&a_share, test_degree_d_abc_shares[j].data() + 3*i*sizeof(uint64_t), sizeof(uint64_t));
                memcpy(&b_share, test_degree_d_abc_shares[j].data() + 3*i*sizeof(uint64_t)+sizeof(uint64_t), sizeof(uint64_t));
                memcpy(&c_share, test_degree_d_abc_shares[j].data() + 3*i*sizeof(uint64_t)+2*sizeof(uint64_t), sizeof(uint64_t));
                
                a_degree_d[j-1] = FieldT(a_share);
                b_degree_d[j-1] = FieldT(b_share);
                c_degree_d[j-1] = FieldT(c_share);            
            }

            // now IFFT to get poly and check a*b = c
            const std::vector<FieldT> a_poly =    
                additive_IFFT<FieldT>(a_degree_d, B2.subspace());

            const std::vector<FieldT> b_poly =    
                additive_IFFT<FieldT>(b_degree_d, B2.subspace());

            const std::vector<FieldT> c_poly =    
                additive_IFFT<FieldT>(c_degree_d, B2.subspace());

            #ifdef DEBUG_TRIPLES
            // check if a*b == c
            a_poly[0].print();
            b_poly[0].print();
            c_poly[0].print();
            if (a_poly[0] * b_poly[0] == c_poly[0])
                std::cout << "i: " << i << " -- valid shared triple!" << std::endl;
            else
                std::cout << "i: " << i << " -- invalid shared triple!" << std::endl;
            #endif

        }

    on_pi_return_handler(triple_shares);

    }

}
*/
void f_triples::on_have_all_shares () {

    auto self = shared_from_this();

    #ifdef DEBUG_TRIPLES
    std::cout << "all additive shares received!" << std::endl;
    #endif

    // now, for each p_factor value
    // go through each h value that this committee handles
    // and run an IFFT and FFT for each a, b, c
    for (int i = 0; i < commPatternsImpl->player_h_values[player_num - 1].size(); i++) {
        int h_val = commPatternsImpl->player_h_values[player_num - 1][i];

        for (int j = 0 ; j < p_factor; j++){

            const std::vector<FieldT> a_poly_aShare =    
                additive_IFFT<FieldT>(a_aShare[j][h_val], B2[j].subspace());

            const std::vector<FieldT> b_poly_aShare =    
                additive_IFFT<FieldT>(b_aShare[j][h_val], B2[j].subspace());

            const std::vector<FieldT> c_poly_aShare =    
                additive_IFFT<FieldT>(c_aShare[j][h_val], B2[j].subspace());

            const std::vector <FieldT> a_points = 
                additive_FFT<FieldT>(a_poly_aShare, B4[j].subspace());

            const std::vector <FieldT> b_points = 
                additive_FFT<FieldT>(b_poly_aShare, B4[j].subspace());

            const std::vector <FieldT> c_points = 
                additive_FFT<FieldT>(c_poly_aShare, B4[j].subspace());
        }
    }
    int num_triples = commPatternsImpl->player_h_values[player_num - 1].size() * l * p_factor;
    int total_triples = h * l * p_factor;
    std::cout << "num_triples / total_triples: " << num_triples << " / " << total_triples << std::endl;
    on_pi_return_handler(triple_shares);

 /*
    // testing committee triple
    int committee_tested = 1;

    if (commPatternsImpl->committee[player_num - 1] == committee_tested){

        int dealer_num = -1;

        const std::vector<FieldT> a_poly_aShare =    
            additive_IFFT<FieldT>(a_aShare[5][0], B2[5].subspace());

        const std::vector<FieldT> b_poly_aShare =    
            additive_IFFT<FieldT>(b_aShare[5][0], B2[5].subspace());

        const std::vector<FieldT> c_poly_aShare =    
            additive_IFFT<FieldT>(c_aShare[5][0], B2[5].subspace());

        const std::vector <FieldT> a_points = 
            additive_FFT<FieldT>(a_poly_aShare, B4[5].subspace());

        const std::vector <FieldT> b_points = 
            additive_FFT<FieldT>(b_poly_aShare, B4[5].subspace());

        const std::vector <FieldT> c_points = 
            additive_FFT<FieldT>(c_poly_aShare, B4[5].subspace());



        for (int i = 0 ; i < num_players; i++){
            if (commPatternsImpl->committee[i] == committee_tested){
                dealer_num = i+1;
                break;
            }
        }

        if (player_num == dealer_num) {

            FieldT a_point = a_points[0];
            FieldT b_point = b_points[0];
            FieldT c_point = c_points[0];
            a_total = a_point;
            b_total = b_point;
            c_total = c_point;

            recv_test_abc_shares = 1;

            for (int i = 0; i < num_players; i++) {

                if (( (i+1) != player_num) && (commPatternsImpl->committee[i] == committee_tested)) {
                    int recv_from = i+1;
                    network->recv(recv_from, [this, self, recv_from](std::vector <unsigned char> recv_data){

                        recv_test_abc_shares++;

                        uint64_t a_point;
                        uint64_t b_point;
                        uint64_t c_point;
                        
                        memcpy(&a_point, recv_data.data(), sizeof(uint64_t));
                        memcpy(&b_point, recv_data.data()+sizeof(uint64_t), sizeof(uint64_t));
                        memcpy(&c_point, recv_data.data()+2*sizeof(uint64_t), sizeof(uint64_t));
                        
                        a_total += FieldT(a_point);
                        b_total += FieldT(b_point);
                        c_total += FieldT(c_point);

                        if (recv_test_abc_shares == committee_size) {

                            #ifdef DEBUG_TRIPLES
                            // check if a*b == c
                            a_total.print();
                            b_total.print();
                            c_total.print();
                            if (a_total * b_total == c_total)
                                std::cout << "-- valid shared triple!" << std::endl;
                            else
                                std::cout << "-- invalid shared triple!" << std::endl;
                            #endif
                                
                            on_pi_return_handler(triple_shares);
                        }


                     });


                }
            }



        } else {

            std::vector <unsigned char> uchar_vec (3*8);
            memcpy(uchar_vec.data(), ui64conv(a_points[0].as_words()[0]).data(), sizeof(uint64_t));
            memcpy(uchar_vec.data()+sizeof(uint64_t), ui64conv(b_points[0].as_words()[0]).data(), sizeof(uint64_t));
            memcpy(uchar_vec.data()+2*sizeof(uint64_t), ui64conv(c_points[0].as_words()[0]).data(), sizeof(uint64_t));

            network->send(dealer_num, uchar_vec, [this, self](){ 

                on_pi_return_handler(triple_shares);

             });

        } 
    } else {
        on_pi_return_handler(triple_shares);
    }
 */
}

void f_triples::on_recv_m_d (int p_count, int num_p, std::vector <unsigned char> data){

    auto self = shared_from_this();

    memcpy(recv_md_data.data() + p_count*h*sizeof(uint64_t), data.data(), num_p * h * sizeof(uint64_t));
    recv_md_data_count += num_p;

    #ifdef DEBUG_TRIPLES
    std::cout << "recv_md_data_count: " << recv_md_data_count << std::endl;
    std::cout << "p_factor: " << p_factor << " p_count: " << p_count << " num_p: " << num_p << std::endl << std::endl;
    #endif

    if (recv_md_data_count < p_factor)
        return;

    #ifdef DEBUG_TRIPLES_DATA
    printf("recv_md_data: %d\n", (int)recv_md_data.size());
    for (int k = 0 ; k < recv_md_data.size(); k++){
        if (k%8 == 0) {
            printf(" ");
        }
        printf("%.2X", recv_md_data[k]);
    }
    printf("\n");
    std::cout.flush();
    #endif



    // go through each h sends from comm_patterns
    std::string sgen_type;
    int recv_player_id;


  //  int h = data.size() / sizeof(uint64_t);

    for (int i = 0 ; i < p_factor; i++){
        m_d[i].resize(h);

        // compute c = m - r
        c_d[i].resize(h);

        for (int j = 0; j < h; j++){
            memcpy(&m_d[i][j], recv_md_data.data() + i*h*sizeof(uint64_t) + j*sizeof(uint64_t), sizeof(uint64_t));
            c_d[i][j] = m_d[i][j] - r_d[i][j];
        }

        // initialize storage for shares
        a_aShare[i].resize(h);
        b_aShare[i].resize(h);
        c_aShare[i].resize(h);

    }
    #ifdef DEBUG_TRIPLES
    std::cout.flush();
    std::cout << "all m_d shares received, additively sharing" << std::endl;
    #endif

    // now send to committee as assigned in committee file

    // call recv for committee members
    
    committee_id = commPatternsImpl->committee[player_num - 1];



    total_num_gen_sends = commPatternsImpl->get_num_gen_sends(player_num);
    total_num_recvs = commPatternsImpl->get_num_recvs(player_num);
    num_gen_sends = 0;
    num_recvs = 0;
    all_recvs_done = false;
    all_sends_done = false;
    loop_complete = false;
    #ifdef DEBUG_TRIPLES
    std::cout << "got to loop" << std::endl;
    #endif

    bool has_sent = false;
    for (int i = 0; i < num_players; i++){
        int h_vals = commPatternsImpl->player_sends[player_num - 1][i].size();
        #ifdef DEBUG_TRIPLES
        std::cout << "i: " << i << " h_vals: " << h_vals << std::endl;
        #endif
        
        if (h_vals > 0) {
            has_sent = true;
            // now send all h values to player
            int recv_player_id = i + 1;
            std::vector <unsigned char> sendVals;
            sendVals.resize(h_vals * 3 * 8 * p_factor);
            for (int j = 0; j < h_vals; j++) {
                int h_val = commPatternsImpl->player_sends[player_num - 1][i][j];
                #ifdef DEBUG_TRIPLES
                std::cout << "j: " << j << " h_val: " << h_val << std::endl;
                std::cout << "recv_player_id: " << recv_player_id << std::endl;
                std::cout << "player_id: " << player_num << std::endl;
                #endif

                for (int k = 0; k < p_factor; k++){
                    FieldT sendA = genSharesImpl->gen_to_send(a_d[k][h_val], recv_player_id, k+3*h_val*10000);
                    FieldT sendB = genSharesImpl->gen_to_send(b_d[k][h_val], recv_player_id, k+3*h_val*10000+10000);
                    FieldT sendC = genSharesImpl->gen_to_send(c_d[k][h_val], recv_player_id, k+3*h_val*10000+20000);

                    #ifdef DEBUG_TRIPLES
                    std::cout << "past gen to send" << std::endl;
                    #endif

                    memcpy(sendVals.data()+k*h_vals*3*8+j*3*8, ui64conv(sendA.as_words()[0]).data(), sizeof(uint64_t));
                    memcpy(sendVals.data()+k*h_vals*3*8+j*3*8+sizeof(uint64_t), ui64conv(sendB.as_words()[0]).data(), sizeof(uint64_t));
                    memcpy(sendVals.data()+k*h_vals*3*8+j*3*8+2*sizeof(uint64_t), ui64conv(sendC.as_words()[0]).data(), sizeof(uint64_t));
                }


                #ifdef DEBUG_TRIPLES
                std::cout << "past memcpy" << std::endl;
                #endif

            }
            #ifdef DEBUG_TRIPLES
            std::cout << player_num << " -> " << recv_player_id << std::endl;
            #endif



            // now send to recv_player_id
            network->send(recv_player_id, sendVals, [this, self, h_vals](){

                    num_gen_sends += h_vals;

                    if ((committee_id > 0) && (num_gen_sends >= total_num_gen_sends))
                        on_recv_packed_triples();

                    if ((committee_id == 0) && (num_gen_sends >= total_num_gen_sends))
                        on_pi_return_handler(triple_shares);
             });
        }
    }

    if ((has_sent == false) && (committee_id > 0)) {
        on_recv_packed_triples();
    }


/*
    for (int i = 0; i < h; i++) {

        sgen_type = commPatternsImpl->send_shares[i][player_num - 1].gen_type;
        
        if (sgen_type.compare("gen_and_send") == 0) {


            recv_player_id = commPatternsImpl->send_shares[i][player_num - 1].recv_player_id;

            #ifdef DEBUG_TRIPLES
            std::cout << "sgen_type: gen_and_send h:" << i << " from: " << player_num << " --> to: " << recv_player_id << std::endl;
            #endif


            FieldT sendA = genSharesImpl->gen_to_send(a_d[i], recv_player_id, 3*i);
            FieldT sendB = genSharesImpl->gen_to_send(b_d[i], recv_player_id, 3*i+1);
            FieldT sendC = genSharesImpl->gen_to_send(c_d[i], recv_player_id, 3*i+2);
            
            std::vector <unsigned char> sendVals;
            sendVals.resize(8*3);
            memcpy(sendVals.data(), ui64conv(sendA.as_words()[0]).data(), sizeof(uint64_t));
            memcpy(sendVals.data()+sizeof(uint64_t), ui64conv(sendB.as_words()[0]).data(), sizeof(uint64_t));
            memcpy(sendVals.data()+2*sizeof(uint64_t), ui64conv(sendC.as_words()[0]).data(), sizeof(uint64_t));
            
            // now send to recv_player_id
            network->send(recv_player_id, sendVals, [this, self](){

                    num_gen_sends++;

                    if ((committee_id > 0) && (num_gen_sends >= total_num_gen_sends))
                        on_recv_packed_triples();
             });
        }

    }
*/
}

void f_triples::on_recv_packed_triples() {

    auto self = shared_from_this();

    char rgen_type;
    int rgen_player_id;
    int rsend_player_id;
    int rcommittee_id;
    bool has_recv = false;

    for (int j = 0 ; j < p_factor; j++){
        for (int i = 0; i < h; i++) {

            a_aShare[j][i].resize(num_players);
            b_aShare[j][i].resize(num_players);
            c_aShare[j][i].resize(num_players);
        }
    }

    for (int i = 0; i < num_players; i++) {
        int h_vals = commPatternsImpl->player_recvs[player_num - 1][i].size();

        #ifdef DEBUG_TRIPLES
        std::cout << "i:" << i << " h_vals: " << h_vals << std::endl;
        #endif

        int send_player_id = i + 1;

        if (h_vals > 0) {

            has_recv = true;
            network->recv(send_player_id, [this, self, i, send_player_id, h_vals](std::vector <unsigned char> recv_data) {                    

                int expected_size = h_vals * 3 * 8 * p_factor;

                if (expected_size != recv_data.size()){
                    std::cout << "expected: " << expected_size << " != " << recv_data.size() << " received." << std::endl;
                    exit(1);
                }

                for (int j = 0; j < h_vals; j++) {

                    int h_val = commPatternsImpl->player_recvs[player_num - 1][i][j];

                    for (int k = 0 ; k < p_factor; k++){
                        uint64_t a_share;
                        uint64_t b_share;
                        uint64_t c_share;

                        memcpy(&a_share, recv_data.data()+k*3*8*h_vals + 3*8*j, sizeof(uint64_t));
                        memcpy(&b_share, recv_data.data()+k*3*8*h_vals + 3*8*j+sizeof(uint64_t), sizeof(uint64_t));
                        memcpy(&c_share, recv_data.data()+k*3*8*h_vals + 3*8*j+2*sizeof(uint64_t), sizeof(uint64_t));
                    
                        a_aShare[k][h_val][i] = FieldT(a_share);
                        b_aShare[k][h_val][i] = FieldT(b_share);
                        c_aShare[k][h_val][i] = FieldT(c_share);
                    }
                }

                num_recvs += h_vals;

                if (num_recvs >= total_num_recvs)
                    all_recvs_done = true;
                
                if (all_recvs_done && loop_complete)
                    on_have_all_shares();
            });
        }
    }

    if (has_recv == false)
        all_recvs_done = true;

    for (int i = 0; i < h; i++) {

        for (int j = 0 ; j < num_players; j++) {
            #ifdef DEBUG_TRIPLES
            std::cout << "h:" << i << " player: " << j << std::endl;
            #endif

            rgen_type = commPatternsImpl->recv_shares[player_num - 1][i][j].gen_type;
            rgen_player_id = commPatternsImpl->recv_shares[player_num - 1][i][j].gen_player_id;
            rsend_player_id = commPatternsImpl->recv_shares[player_num - 1][i][j].send_player_id;
            rcommittee_id = commPatternsImpl->recv_shares[player_num - 1][i][j].committee_id;

//            if (rgen_type.compare("gen_local") == 0) {
            if (rgen_type == 'l') {
                  /*
                a_aShare[i][j] = aShare(j*num_share_types, a_d[j]);
                b_aShare[j][j] = aShare(j*num_share_types+1, b_d[j]);
                c_aShare[j][j] = aShare(j*num_share_types+2, c_d[j]);
            */
                for (int k = 0 ; k < p_factor; k++){
                    a_aShare[k][i][j] = genSharesImpl->gen_local(a_d[k][i], k + 3*i*10000);
                    b_aShare[k][i][j] = genSharesImpl->gen_local(b_d[k][i], k + 3*i*10000+10000);
                    c_aShare[k][i][j] = genSharesImpl->gen_local(c_d[k][i], k + 3*i*10000+20000);
                }

                #ifdef DEBUG_TRIPLES
                std::cout << "rgen_type gen_local: h:" << i << " player: " << j << std::endl;
                #endif

            }

//            if (rgen_type.compare("gen") == 0) {
            if (rgen_type == 'g') {

                for (int k = 0 ; k < p_factor; k++){
                    a_aShare[k][i][j] = genSharesImpl->gen(rgen_player_id, k+3*i*10000);
                    b_aShare[k][i][j] = genSharesImpl->gen(rgen_player_id, k+3*i*10000+10000);
                    c_aShare[k][i][j] = genSharesImpl->gen(rgen_player_id, k+3*i*10000+20000);
                }

                #ifdef DEBUG_TRIPLES
                std::cout << "rgen_type gen: h:" << i << " player: " << j << std::endl;
                #endif

            }

        }

    }


    // on finish loop
    //
    // check
    // 1) if all shares sent (all_shares_sent flag)
    // 2) if all shares recved and generated (recv_and_generated flag)
    // 3) if loop complete (set loop complete flag)

    // only if all three, and only if committee member
    // --> proceed to unpack

    loop_complete = true;

    if (all_recvs_done && loop_complete)
        on_have_all_shares();
}

/*
    for (int i = 0; i < h; i++) {

        a_aShare[i].resize(num_players);
        b_aShare[i].resize(num_players);
        c_aShare[i].resize(num_players);

        
        for (int j = 0 ; j < num_players; j++) {
            #ifdef DEBUG_TRIPLES
            std::cout << "h:" << i << " player: " << j << std::endl;
            #endif

            rgen_type = commPatternsImpl->recv_shares[player_num - 1][i][j].gen_type;
            rgen_player_id = commPatternsImpl->recv_shares[player_num - 1][i][j].gen_player_id;
            rsend_player_id = commPatternsImpl->recv_shares[player_num - 1][i][j].send_player_id;
            rcommittee_id = commPatternsImpl->recv_shares[player_num - 1][i][j].committee_id;

            if (rgen_type.compare("recv") == 0) {
                #ifdef DEBUG_TRIPLES
                std::cout << "rgen_type recv: h:" << i << " player: " << j << std::endl;
                #endif

                // recv a,b,c values from rsend_player_id
                network->recv(rsend_player_id, [this, self, i, j, rsend_player_id](std::vector <unsigned char> recv_data) {                    
                    // check
                    // 1) if all shares sent (all_shares_sent -- compare to num_gen_sends)
                    // 2) if loop complete (loop_complete)
                    // 3) if all shares recved and generated (set recv_and_generated flag -- compare to num_recvs)

                   // only then, and only if committee member and not proceeded
                    // set proceeded flag and
                    // --> proceed to unpack

                    #ifdef DEBUG_TRIPLES
                    std::cout << "rgen_type recv: h:" << i << " player: " << j << std::endl;
                    std::cout << "recv (" << recv_data.size() << "): " << rsend_player_id << " --> " << player_num << std::endl;
                    #endif
    

                    uint64_t a_share;
                    uint64_t b_share;
                    uint64_t c_share;

                    memcpy(&a_share, recv_data.data(), sizeof(uint64_t));
                    memcpy(&b_share, recv_data.data()+sizeof(uint64_t), sizeof(uint64_t));
                    memcpy(&c_share, recv_data.data()+2*sizeof(uint64_t), sizeof(uint64_t));
                
                    a_aShare[i][j] = FieldT(a_share);
                    b_aShare[i][j] = FieldT(b_share);
                    c_aShare[i][j] = FieldT(c_share);

                    num_recvs++;

                    if (num_recvs >= total_num_recvs)
                        all_recvs_done = true;
                    
                    if (all_recvs_done && loop_complete)
                        on_have_all_shares();
                 });

            }

            if (rgen_type.compare("gen_local") == 0) {
                
                //a_aShare[i][j] = aShare(j*num_share_types, a_d[j]);
                //b_aShare[j][j] = aShare(j*num_share_types+1, b_d[j]);
                //c_aShare[j][j] = aShare(j*num_share_types+2, c_d[j]);
            
                a_aShare[i][j] = genSharesImpl->gen_local(a_d[i], 3*i);
                b_aShare[i][j] = genSharesImpl->gen_local(b_d[i], 3*i+1);
                c_aShare[i][j] = genSharesImpl->gen_local(c_d[i], 3*i+2);

                #ifdef DEBUG_TRIPLES
                std::cout << "rgen_type gen_local: h:" << i << " player: " << j << std::endl;
                #endif

            }

            if (rgen_type.compare("gen") == 0) {
                a_aShare[i][j] = genSharesImpl->gen(rgen_player_id, 3*i);
                b_aShare[i][j] = genSharesImpl->gen(rgen_player_id, 3*i+1);
                c_aShare[i][j] = genSharesImpl->gen(rgen_player_id, 3*i+2);

//                a_aShare[i][j] = getaShare(2, i, j*num_share_types);
  //              b_aShare[i][j] = getaShare(2, i, j*num_share_types+1);
    //            c_aShare[i][j] = getaShare(2, i, j*num_share_types+2);                
                

                #ifdef DEBUG_TRIPLES
                std::cout << "rgen_type gen: h:" << i << " player: " << j << std::endl;
                #endif

            }

        }





    }


    // on finish loop
    //
    // check
    // 1) if all shares sent (all_shares_sent flag)
    // 2) if all shares recved and generated (recv_and_generated flag)
    // 3) if loop complete (set loop complete flag)

    // only if all three, and only if committee member
    // --> proceed to unpack

    loop_complete = true;

    if (all_recvs_done && loop_complete)
        on_have_all_shares();
}
*/
void f_triples::on_send_m_2d (int dealer, int p_count, int num_p){

    auto self = shared_from_this();

    #ifdef DEBUG_TRIPLES
    std::cout.flush();
    std::cout << "on_send_m_2d(): p_count: " << p_count << " num_p: " << num_p << std::endl;
    #endif

    network->recv(dealer, 1, [this, self, p_count, num_p](std::vector <unsigned char> data) { on_recv_m_d(p_count, num_p, data); });


}

void f_triples::on_dealer_send_m_d (int player_j, int p_count, int num_p){

    num_dealer_send_m_d++;

    if (num_dealer_send_m_d == num_players - 1) {

    std::cout << "on_dealer_send_m_d(): p_count: " << p_count << " num_p: " << num_p << std::endl;

        // now continue as a regular player
        //
        on_recv_m_d(p_count, num_p, local_dealer_m_vec);


    }


}

void f_triples::on_dealer_recv_m_2d(int player_j, int dealer, int p_count, int num_p, std::vector <unsigned char> data){
    
    auto self = shared_from_this();

    num_dealer_recv_m_2d++;

    int data_size = data.size() / num_p;

    for (int i = p_count ; i < p_count + num_p; i++) {
        // store incoming m_2d
        m_2d_n[i][player_j].resize(data_size);
        memcpy(m_2d_n[i][player_j].data(), data.data() + (i-p_count)*data_size, data_size);
    }    

    if (num_dealer_recv_m_2d == num_players - 1) {

        // reconstrud m_2d and share (d, m)

        // convert unsigned char data to FieldT shares
        // use m_2d for DEALER share

        for (int k = p_count; k < p_count + num_p; k++) {
            m_2d_n_fieldT[k].resize(h);

            for (int j = 0; j < h; j++) {
                m_2d_n_fieldT[k][j].resize(num_players);
                for (int i = 0; i < num_players; i++){
                    if (i+1 == dealer) {
                        // get local share for dealer
                        m_2d_n_fieldT[k][j][i] = m_2d[k][j];
                    } else {
                        uint64_t uintType;
                        memcpy(&uintType, m_2d_n[k][i+1].data() + j*sizeof(uint64_t), sizeof(uint64_t)); 
                        m_2d_n_fieldT[k][j][i] = FieldT(uintType);
                    }
                }
            }
        }



        // now convert to degree d shares
// 1.  poly=iFFT(m_2d_shares,B2) - this is reconstructing the 2d degree poly
//
// 2.  points=FFT(poly,B3) - recover the secrets that are packed into that degree 2d poly
//
// 3.  Generate a fresh degree d sharing of points.  In particular, only the first l points in points are secrets.
//     generate new random values for the remaining d-l points and then run iFFT over B3
//     to recover the degree_d_poly
//
// 4.  m_d_shares = FFT(degree_d_poly, B2) 

        std::vector <std::vector <std::vector <FieldT>>> d_shares(p_factor);

        for (int k = p_count ; k < p_count + num_p; k++) {

            d_shares[k].resize(num_players + 1);

            for (int j = 0; j < h; j++) {
                #ifdef DEBUG_TRIPLES
                printf("before additive IFFT\n");
                std::cout.flush();
                #endif

                const std::vector<FieldT> poly =    
                    additive_IFFT<FieldT>(m_2d_n_fieldT[k][j], B2[k].subspace());

                #ifdef DEBUG_TRIPLES
                printf("finished additive IFFT\n");
                std::cout.flush();
                #endif

                const std::vector<FieldT> points =
                    additive_FFT<FieldT>(poly, B4[k].subspace());

                std::vector <FieldT> new_points = random_vector <FieldT> ((1ull << m)/2);

                for (int i = 0; i < l; i++)
                    new_points[i] = points[i];


                const std::vector<FieldT> b3_poly_d =    
                    additive_IFFT<FieldT>(new_points, B4[k].subspace());

                const std::vector <FieldT> d_shares_local =
                    additive_FFT<FieldT>(b3_poly_d, B2[k].subspace());

                if (j == 0) {
                    for (int i = 1; i < num_players + 1; i++)
                        d_shares[k][i].resize(h);
                }
                for (int i = 1; i < num_players + 1; i++)
                    d_shares[k][i][j] = d_shares_local[i-1];
            }
        }




        #ifdef DEBUG_TRIPLES
        printf("h2: %d\n", h);
        #endif

        // now send d_shares
        num_dealer_send_m_d = 0;
        #ifdef DEBUG_TRIPLES
        std::cout << "\nsending n-1 shares of m -- poly degree d" << std::endl;
        #endif
        for (int i = 1; i < num_players + 1; i++) {
    
            std::vector <unsigned char> uchar_64_m_vec (h*sizeof(uint64_t)*num_p);

            for (int k = p_count; k < p_count + num_p; k++) {
                for (int j = 0 ; j < h; j++)
                    memcpy(uchar_64_m_vec.data()+(k-p_count)*h*sizeof(uint64_t)+j*sizeof(uint64_t), &(d_shares[k][i][j].as_words()[0]), sizeof(uint64_t));
            }

            #ifdef DEBUG_TRIPLES_DATA
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
            #endif

            if (i != dealer)
                network->send(i, 1, uchar_64_m_vec, [this, self, i, p_count, num_p](){ on_dealer_send_m_d(i, p_count, num_p); });
            else
                local_dealer_m_vec = uchar_64_m_vec;
        }        
    }


}

void f_triples::on_all_shares_recved(){

    #ifdef DEBUG_TRIPLES
    std::cout << "on all shares received" << std::endl;
    std::cout.flush();
    #endif
    auto self = shared_from_this();



    // now multiply shares by vandermonde transpose
    // need to create the vandermonde in advance in future...
//    std::string filename = VM_FILE;
//    vandermonde vm_t_gf64(64, num_players, l, VM_FILE);

//    r_d = vm_t_gf64.mult_vec(r_d_tild);
//    r_2d = vm_t_gf64.mult_vec(r_2d_tild);
//    a_d = vm_t_gf64.mult_vec(a_d_tild);
//    b_d = vm_t_gf64.mult_vec(b_d_tild);

    for (int i = 0; i < p_factor; i++) {

        r_d[i] =    
            additive_IFFT<FieldT>(r_d_tild[i], B2[i].subspace());
        
        r_2d[i] =    
            additive_IFFT<FieldT>(r_2d_tild[i], B2[i].subspace());

        a_d[i] =    
            additive_IFFT<FieldT>(a_d_tild[i], B2[i].subspace());

        b_d[i] =    
            additive_IFFT<FieldT>(b_d_tild[i], B2[i].subspace());

        r_d[i].resize(h);
        r_2d[i].resize(h);
        a_d[i].resize(h);
        b_d[i].resize(h);

        // now compute m^j_2d = a^j_ d* b^j_d + r^j_2d (step 3)
        // for j = 1,...,h
        
        // a_d should be length h
    //    h = a_d.size();
        m_2d[i].resize(h);
        

        for (int j = 0; j < h; j++){
            m_2d[i][j] = a_d[i][j] * b_d[i][j] + r_2d[i][j];
        }

    }

    // now send m_2d to DEALER, p1

    // here we want to rotate the dealer with each p_factor instance
    //
    // p_factor / num_players == conv_per_player
    
    int conv_per_player = p_factor / num_players;
    int extra = p_factor % num_players;

//    std::vector <int> num_p (num_players);

    int num_p;
    int dealer;
    int p_count = 0;
    recv_md_data.resize(h*p_factor*sizeof(uint64_t));
    recv_md_data_count = 0;
    for (int i = 0; i < num_players; i++) {
  //      num_p[i] = conv_per_player;
  //      if (i < extra)
  //          num_p[i]++;
        num_p = conv_per_player;
        if (i < extra)
            num_p++;

        dealer = i + 1;

        // now handle sends and recv for that dealer
        if (player_num == dealer) {
            num_dealer_recv_m_2d = 0;
            for (int j = p_count ; j < p_count + num_p; j++)
                m_2d_n[j].resize(num_players+1);
            
            for (int i = 1; i < num_players + 1; i++) {
                if (i != dealer)
                    network->recv(i, 0, [this, self, i, dealer, p_count, num_p](std::vector <unsigned char> data){ on_dealer_recv_m_2d(i, dealer, p_count, num_p, data); });
            }
        }  else {

            // convert m_2d to unsigned char vector
            // prepare m^j_2d to send and send to DEALER
            std::vector <unsigned char> data (sizeof(uint64_t) * h * num_p);

            for (int i = p_count; i < p_count + num_p; i++) {
                for (int j = 0 ; j < h; j++)
                    memcpy(data.data()+(i-p_count)*h*sizeof(uint64_t)+j*sizeof(uint64_t), &m_2d[i][j].as_words()[0], sizeof(uint64_t));
            }
            #ifdef DEBUG_TRIPLES
            std::cout.flush();
            std::cout << "sending to dealer" << std::endl;
            #endif
            network->send(dealer, 0, data, [this, self, dealer, p_count, num_p](){ on_send_m_2d(dealer, p_count, num_p); });
        }

        p_count += num_p;

        if (p_count >= p_factor)
            break;
    }
}

void f_triples::on_player_recv(int player_j, std::vector <unsigned char> data){

    num_recv++;

    #ifdef DEBUG_TRIPLES
    std::cout << "recv | d(" << player_j << "): ";
    for (int i = 0 ; i < data.size(); i++) printf("%.2X", data[i]);
    printf("\n");
    #endif
    std::vector<unsigned char> data_single (sizeof(uint64_t));
    for (int j = 0; j < p_factor; j++){
        memcpy(data_single.data(), data.data()+8*j, sizeof(uint64_t));
        r_d_tild[j][player_j-1] = FieldT(conv64(data_single));
    }

    if (num_recv == num_players - 1) {
        #ifdef DEBUG_TRIPLES
        std::cout << "all r(d) shares received" << std::endl;
        std::cout.flush();
        #endif
        

        all_recved++;

        if (all_recved == 4) {
            #ifdef DEBUG_TRIPLES
            std::cout << "all shares received" << std::endl;
            #endif
            on_all_shares_recved();
        }

    }

}

void f_triples::on_player_send(){

    auto self = shared_from_this();

    num_calls++;
    if (num_calls == num_players - 1) {

        #ifdef DEBUG_TRIPLES
        std::cout << "receiving r (degree d) shares from other players\n";
        #endif
        for (int i = 1; i < num_players + 1; i++) {
            if (player_num != i)
                network->recv(i, 0, [this, self, i](std::vector <unsigned char> data){ on_player_recv(i, data); });
        }
    }


}

void f_triples::on_player_recv_2d(int player_j, std::vector <unsigned char> data){

    num_recv_2d++;

    std::vector<unsigned char> data_single (sizeof(uint64_t));
    for (int j = 0; j < p_factor; j++){
        memcpy(data_single.data(), data.data()+8*j, sizeof(uint64_t));
        r_2d_tild[j][player_j-1] = FieldT(conv64(data_single));
    }


    #ifdef DEBUG_TRIPLES_DATA
    std::cout << "recv | 2d(" << player_j << "): ";
    for (int i = 0 ; i < data.size(); i++) printf("%.2X", data[i]);
    printf("\n");
    #endif

    if (num_recv_2d == num_players - 1) {
        #ifdef DEBUG_TRIPLES
        std::cout << "all r (2d) shares received" << std::endl;
        std::cout.flush();
        #endif

        

        all_recved++;
        if (all_recved == 4) {
            #ifdef DEBUG_TRIPLES
            std::cout << "all shares received" << std::endl;
            #endif
            on_all_shares_recved();
        }

    }


}

void f_triples::on_player_send_2d(){

    auto self = shared_from_this();

    num_calls_2d++;
    if (num_calls_2d == num_players - 1) {
        #ifdef DEBUG_TRIPLES
        std::cout << "receiving r (degree 2d) shares from other players\n";
        #endif
        for (int i = 1; i < num_players + 1; i++) {
            if (player_num != i)
                network->recv(i, 1, [this, self, i](std::vector <unsigned char> data){ on_player_recv_2d(i, data); });
        }
    }


}

void f_triples::on_player_recv_a(int player_j, std::vector <unsigned char> data){

    num_recv_a++;

    std::vector<unsigned char> data_single (sizeof(uint64_t));
    for (int j = 0; j < p_factor; j++){
        memcpy(data_single.data(), data.data()+8*j, sizeof(uint64_t));
        a_d_tild[j][player_j-1] = FieldT(conv64(data_single));
    }


    #ifdef DEBUG_TRIPLES_DATA
    std::cout << "recv | a(" << player_j << "): ";
    for (int i = 0 ; i < data.size(); i++) printf("%.2X", data[i]);
    printf("\n");
    #endif

    if (num_recv_a == num_players - 1) {
        #ifdef DEBUG_TRIPLES
        std::cout << "all a shares received" << std::endl;
        std::cout.flush();
        #endif
        all_recved++;

        if (all_recved == 4) {
            #ifdef DEBUG_TRIPLES
            std::cout << "all shares received" << std::endl;
            #endif
            on_all_shares_recved();
        }

    }

}

void f_triples::on_player_send_a(){

    auto self = shared_from_this();

    num_calls_a++;
    if (num_calls_a == num_players - 1) {
        #ifdef DEBUG_TRIPLES
        std::cout << "receiving a (degree d) shares from other players\n";
        #endif
        for (int i = 1; i < num_players + 1; i++) {
            if (player_num != i)
                network->recv(i, 2, [this, self, i](std::vector <unsigned char> data){ on_player_recv_a(i, data); });
        }
    }


}

void f_triples::on_player_recv_b(int player_j, std::vector <unsigned char> data){

    num_recv_b++;

    std::vector<unsigned char> data_single (sizeof(uint64_t));
    for (int j = 0; j < p_factor; j++){
        memcpy(data_single.data(), data.data()+8*j, sizeof(uint64_t));
        b_d_tild[j][player_j-1] = FieldT(conv64(data_single));
    }


    #ifdef DEBUG_TRIPLES_DATA
    std::cout << "recv | b(" << player_j << "): ";
    for (int i = 0 ; i < data.size(); i++) printf("%.2X", data[i]);
    printf("\n");
    #endif

    if (num_recv_b == num_players - 1) {
        #ifdef DEBUG_TRIPLES
        std::cout << "all b shares received" << std::endl;
        std::cout.flush();
        #endif

        all_recved++;

        if (all_recved == 4) {
            #ifdef DEBUG_TRIPLES
            std::cout << "all shares received" << std::endl;
            std::cout.flush();
            #endif
            on_all_shares_recved();
        }

    }


}

void f_triples::on_player_send_b(){

    auto self = shared_from_this();

    num_calls_b++;
    if (num_calls_b == num_players - 1) {
        #ifdef DEBUG_TRIPLES
        std::cout << "receiving b (degree d) shares from other players\n";
        #endif
        for (int i = 1; i < num_players + 1; i++) {
            if (player_num != i)
                network->recv(i, 3, [this, self, i](std::vector <unsigned char> data){ on_player_recv_b(i, data); });
        }
    }


}