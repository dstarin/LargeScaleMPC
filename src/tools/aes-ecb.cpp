#include "aes-ecb.h"

aes::aes(){
    EVP_add_cipher(EVP_aes_256_ecb());
}

void aes::aes256ecb_encrypt(std::vector <unsigned char> & ctext, std::vector <unsigned char> msg, std::vector <unsigned char> key, std::vector <unsigned char> iv) {

    // need fresh iv every message
    EVP_CIPHER_CTX_free_ptr ctx(EVP_CIPHER_CTX_new(), ::EVP_CIPHER_CTX_free);

    int rc = EVP_EncryptInit_ex(ctx.get(), EVP_aes_256_ecb(), NULL, key.data(), iv.data());
    if (rc != 1)
      throw std::runtime_error("EVP_EncryptInit_ex failed");

    // Recovered text expands upto BLOCK_SIZE
    ctext.resize(msg.size()+AES_BLOCK_SIZE);
    
    int out_len1 = (int)ctext.size();

    rc = EVP_EncryptUpdate(ctx.get(), (unsigned char *)&ctext[0], &out_len1, (const unsigned char *)&msg[0], (int)msg.size());
    if (rc != 1)
      throw std::runtime_error("EVP_EncryptUpdate failed");
  
    int out_len2 = (int)ctext.size() - out_len1;
    rc = EVP_EncryptFinal_ex(ctx.get(), (unsigned char *)&ctext[0]+out_len1, &out_len2);
    if (rc != 1)
      throw std::runtime_error("EVP_EncryptFinal_ex failed");

    // Set cipher text size now that we know it
    ctext.resize(out_len1 + out_len2);
    //  printf("!!ctext len %d\nctext: ", (int)ctext.size());
//      for (int i = 0 ; i < ctext.size() ; i++) printf("%.2X", ctext[i]);
    //  printf("\nkey: ");
  //    for (int i = 0 ; i < key.size() ; i++) printf("%.2X", key[i]);
    //  printf("\niv: ");
   //   for (int i = 0 ; i < iv.size() ; i++) printf("%.2X", iv[i]);
}

void aes::aes256ecb_decrypt(std::vector <unsigned char> & msg, std::vector <unsigned char> ctext, std::vector <unsigned char> key, std::vector <unsigned char> iv){

//    std::cout << "aes256cbc_decrypt ctext size " << ctext.size() << std::endl;
    EVP_CIPHER_CTX_free_ptr ctx(EVP_CIPHER_CTX_new(), ::EVP_CIPHER_CTX_free);
    int rc = EVP_DecryptInit_ex(ctx.get(), EVP_aes_256_ecb(), NULL, key.data(), iv.data());
    if (rc != 1)
      throw std::runtime_error("EVP_DecryptInit_ex failed");

    // Recovered text contracts upto BLOCK_SIZE
    msg.resize(ctext.size());
    int out_len1 = (int)msg.size();

    rc = EVP_DecryptUpdate(ctx.get(), (unsigned char *)&msg[0], &out_len1, (const unsigned char *)&ctext[0], (int)ctext.size());
    if (rc != 1)
      throw std::runtime_error("EVP_DecryptUpdate failed");
  
    int out_len2 = (int)msg.size() - out_len1;
    rc = EVP_DecryptFinal_ex(ctx.get(), (unsigned char *)&msg[0]+out_len1, &out_len2);
  //     printf("!!ctext len %d\n", (int)ctext.size());
  //    printf("!!outlen1 %d\n", out_len1);
  //    printf("!!outlen2 %d\nctext: ", out_len2);
 //     for (int i = 0 ; i < ctext.size() ; i++) printf("%.2X", ctext[i]);
 //     printf("\nkey: ");
 //     for (int i = 0 ; i < key.size() ; i++) printf("%.2X", key[i]);
 //     printf("\niv: ");
 //     for (int i = 0 ; i < iv.size() ; i++) printf("%.2X", iv[i]);
    if (rc != 1) {
     printf("\n!!rc: %d exiting\n", rc);
    //  exit(-1);
      throw std::runtime_error("EVP_DecryptFinal_ex failed");
    }

    // Set recovered text size now that we know it
    msg.resize(out_len1 + out_len2);
}

aes::~aes() {

}