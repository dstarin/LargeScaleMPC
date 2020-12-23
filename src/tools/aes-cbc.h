#ifndef AES_H_
#define AES_H_

#include <stdlib.h>
#include <string.h>
#include <vector>
#include <openssl/conf.h>
#include <openssl/evp.h>
#include <openssl/rand.h>
#include <openssl/err.h>
#include <error.h>
#include <iostream>
#include <memory>
#include <limits>
#include <stdexcept>

#define AES_BLOCK_SIZE 16
#define AES_KEY_SIZE 32

using EVP_CIPHER_CTX_free_ptr = std::unique_ptr<EVP_CIPHER_CTX, decltype(&::EVP_CIPHER_CTX_free)>;

class aes {
  public:
   
    aes();

    void aes256cbc_encrypt(std::vector <unsigned char>  & ctxt, std::vector <unsigned char> msg, std::vector <unsigned char> key, std::vector <unsigned char> iv);
    void aes256cbc_decrypt(std::vector <unsigned char>  & msg, std::vector <unsigned char> ctxt, std::vector <unsigned char> key, std::vector <unsigned char> iv);

    ~aes();
};

#endif
