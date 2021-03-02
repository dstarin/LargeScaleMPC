#!/bin/bash

adduser --quiet --disabled-password --shell /bin/bash --home /home/lowcmpc --gecos "" lowcmpc
echo "lowcmpc:lowcmpc" | chpasswd
echo "lowcmpc  ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
sed -i "/^[^#]*PasswordAuthentication[[:space:]]no/c\PasswordAuthentication yes" /etc/ssh/sshd_config
service ssh restart

sudo apt update
sudo apt install -y cmake libboost-all-dev libgmp-dev libsodium-dev pkg-config libprocps-dev libssl-dev
