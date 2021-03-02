#!/bin/bash

rm lowcmpc.tar.gz
tar -czvf lowcmpc.tar.gz lowcmpc
openssl enc -aes-256-cbc -in lowcmpc.tar.gz -out lowcmpc.enc -pass 'pass:I0iz95KDhYpz0KhBcfddeUhn55XURfdcb4Y0HuUqhBE'
echo "--> now upload to s3! <--"
