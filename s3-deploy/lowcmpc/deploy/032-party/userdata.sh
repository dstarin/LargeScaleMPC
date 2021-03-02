#!/bin/bash

adduser --quiet --disabled-password --shell /bin/bash --home /home/lowcmpc --gecos "" lowcmpc
echo "lowcmpc:lowcmpc" | chpasswd
echo "lowcmpc  ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
sed -i "/^[^#]*PasswordAuthentication[[:space:]]no/c\PasswordAuthentication yes" /etc/ssh/sshd_config
service ssh restart

mkdir /home/lowcmpc/logs

echo "--> installing libs" | tee /home/lowcmpc/logs/libs.log
apt update
apt install -y cmake libboost-all-dev libgmp-dev libsodium-dev pkg-config libprocps-dev libssl-dev | tee -a /home/lowcmpc/logs/libs.log

mkdir -p /home/lowcmpc/dstarin/research
cd /home/lowcmpc/dstarin/research
echo "--> installing lowcmpc" | tee /home/lowcmpc/logs/lowcmpc.log
echo "--> wget lowcmpc" | tee -a /home/lowcmpc/logs/lowcmpc.log
wget https://lowcmpc.s3-us-west-2.amazonaws.com/lowcmpc.enc
echo "--> decrypt lowcmpc" | tee -a /home/lowcmpc/logs/lowcmpc.log
openssl enc -d -aes-256-cbc -in lowcmpc.enc -out lowcmpc.tar.gz -pass 'pass:I0iz95KDhYpz0KhBcfddeUhn55XURfdcb4Y0HuUqhBE'
echo "--> extract lowcmpc" | tee -a /home/lowcmpc/logs/lowcmpc.log
tar -zxvf lowcmpc.tar.gz
rm lowcmpc.tar.gz

chown -R lowcmpc:lowcmpc /home/lowcmpc/
