#ifndef _F_AES_H_
#define _F_AES_H_

#include <iostream>
#include "../tools/mp_network.h"
#include "../tools/aes-ecb.h"

class f_aes : public std::enable_shared_from_this <f_aes> {
  public:

    int player_num;

    std::vector <unsigned char> key;
  
    std::shared_ptr <aes> aesImpl;

    int data_size;

    // p1 input

    f_aes(std::vector <unsigned char> _key, int _data_size, int _player_num, int _channel, mp_network * _network, int other_player);

    void on_p1_send();
    void decrypt_recv (std::vector <unsigned char> enc_data);

    void pi_p1(std::vector <unsigned char> _send_data, std::function<void()> _on_p1_return_handler);
    void pi_p2(std::function<void(std::vector <unsigned char>)> _on_p2_return_handler);


    std::function<void()> on_p1_return_handler;
    std::function<void(std::vector <unsigned char>)> on_p2_return_handler;

    int player_j;
    mp_network * network;
    int channel;
};

#endif