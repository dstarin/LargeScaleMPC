#include "f_aes.h"

f_aes::f_aes(std::vector <unsigned char> _key, int _data_size, int _player_num, int _channel, mp_network * _network, int _player_j){
    key = _key;
   // iv = _iv;
    data_size = _data_size;
    player_num = _player_num;
    network = _network;
    player_j = _player_j;
    channel = _channel;
    aesImpl = std::make_shared <aes>();
}

void f_aes::decrypt_recv(std::vector <unsigned char> enc_data) {

    std::vector <unsigned char> iv(AES_BLOCK_SIZE, 0); // use 0 iv (one msg per key)
    std::vector <unsigned char> recv_data;
    aesImpl->aes256ecb_decrypt(recv_data, enc_data, key, iv);
    on_p2_return_handler(recv_data);
}

void f_aes::on_p1_send() {

    on_p1_return_handler();
}

void f_aes::pi_p1(std::vector <unsigned char> _send_data, std::function<void()> _on_p1_return_handler) {
    auto self = shared_from_this();

    on_p1_return_handler = _on_p1_return_handler;

    // encrypt send data using key
    std::vector <unsigned char> enc_data;

    std::vector <unsigned char> iv(AES_BLOCK_SIZE, 0); // use 0 iv (one msg per key)
    aesImpl->aes256ecb_encrypt(enc_data, _send_data, key, iv);
//    printf( "before send() in p1\n" );
    network->send(player_j, channel, enc_data, [this, self](){ on_p1_send();});
    

//    printf( "after send() in p1\n" );
}

 void f_aes::pi_p2(std::function<void(std::vector <unsigned char>)> _on_p2_return_handler) {
    auto self = shared_from_this();
    on_p2_return_handler = _on_p2_return_handler;
    network->recv(player_j, channel, [this, self](std::vector <unsigned char> enc_data){ decrypt_recv(enc_data);});
 }