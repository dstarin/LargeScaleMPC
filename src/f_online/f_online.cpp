#include "f_online.h"

f_online::f_online(mp_network * _network){

    network = _network;
    n = network->num_players;
    num_players = network->num_players;
    player_num = network->player_num;

}

void f_online::on_recv_xy_test(int player_j, std::vector <unsigned char> data) {

    num_recv_xy_test++;

    uint64_t uint_xy_share;
    memcpy(&uint_xy_share, data.data(), sizeof(uint64_t));

    std::cout << "xy before: ";
    xy.print();
    xy += FieldT(uint_xy_share);
    std::cout << "share: ";
    FieldT(uint_xy_share).print();
    std::cout << "xy after: ";
    xy.print();



    if (num_recv_xy_test == num_players - 1) {

        // now check xy using getInput aes seed function
        on_pi_return_handler(xy);
    }

}

void f_online::on_send_xy_test() {
    std::cout << "xy_share: ";
    xy_share.print();
    on_pi_return_handler(xy_share);

}

void f_online::on_recv_triple_de(int player_j, std::vector <unsigned char> data) {

//
// x * y  = ( x - a + a ) * ( y - b + b )
//        = (d + a) * (e + b)
//   	  = de + db + ae + ab
//	      = d[e] + d[ b ] + e [ a ] + [c] // can compute locally
    auto self = shared_from_this();

    num_recv_triple_de++;

    // now reconstruct share_d, share_e
    uint64_t uint_d;
    uint64_t uint_e;
    memcpy(&uint_d, data.data(), sizeof(uint64_t));
    memcpy(&uint_e, data.data()+sizeof(uint64_t), sizeof(uint64_t));

    std::cout << "d,e values: " << std::endl;
    d.print();
    e.print();

    d += FieldT(uint_d);
    e += FieldT(uint_e); 

    if (num_recv_triple_de == num_players - 1){

        std::cout << "a,b,c shares in f_online: " << std::endl;
        a_share.print();
        b_share.print();
        c_share.print();
        d.print();
        e.print();
        // now we have received d, e
        // compute x * y share locally
        xy_share = d*e_share + d*b_share + e*a_share + c_share;

        // now recombine at dealer and test
        if (player_num == DEALER_NUM) {

            // init xy to xy_share
            // add them as they come in
            xy = xy_share;

            num_recv_xy_test = 0;
            for (int j = 1; j < num_players + 1; j++) {
                if (j != DEALER_NUM) {
                    network->recv(j, [this, self, j](std::vector <unsigned char> data){
                        on_recv_xy_test(j, data);
                    });
                }
            }
        } else {
            std::vector <unsigned char> uchar_xy_share(sizeof(uint64_t));
            memcpy(uchar_xy_share.data(), &(xy_share.as_words()[0]), sizeof(uint64_t));
            network->send(DEALER_NUM, uchar_xy_share, [this, self](){ on_send_xy_test();});
        }

    }
}

void f_online::on_send_triple_de() {

    auto self = shared_from_this();
    num_send_triple_de++;

    if (num_send_triple_de == num_players - 1) {

        num_recv_triple_de = 0;
        for (int j = 1; j < num_players +1; j++) {
            if (j != player_num)
                network->recv(j, [this, self, j](std::vector <unsigned char> data){ on_recv_triple_de(j, data); });
        }
    }
}

void f_online::pi(FieldT _x_share, FieldT _y_share, std::vector <std::tuple <FieldT, FieldT, FieldT>> _triple_shares, std::function <void(FieldT)> _on_pi_return_handler){

    on_pi_return_handler = _on_pi_return_handler;

    auto self = shared_from_this();

    triple_shares = _triple_shares;
    x_share = _x_share;
    y_share = _y_share;

    a_share = std::get<0> (triple_shares[0]);
    b_share = std::get<1> (triple_shares[0]);
    c_share = std::get<2> (triple_shares[0]);

    std::cout << "a,b,c shares in f_online: " << std::endl;
    a_share.print();
    b_share.print();
    c_share.print();

    std::cout << "x_share, y_share: " << std::endl;
    x_share.print();
    y_share.print();

    FieldT d_share = x_share - a_share;
    e_share = y_share - b_share;

    std::vector <unsigned char> uchar_de (2*sizeof(uint64_t));
    memcpy(uchar_de.data(), &(d_share.as_words()[0]), sizeof(uint64_t));
    memcpy(uchar_de.data() + sizeof(uint64_t), &(e_share.as_words()[0]), sizeof(uint64_t));
    
    // init d, e
    d = d_share;
    e = e_share;
    num_send_triple_de = 0;
    for (int i = 1; i < num_players + 1; i++) {
        if (i != player_num) {
            network->send(i, uchar_de, [this, self](){
                on_send_triple_de();
            });
        }
    }
//
// x * y  = ( x - a + a ) * ( y - b + b )
//        = (d + a) * (e + b)
//   	  = de + db + ae + ab
//	      = de + d[ b ] + e [ a ] + c // can compute locally


}