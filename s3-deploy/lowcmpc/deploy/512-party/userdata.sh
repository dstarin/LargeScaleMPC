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

# now update file open limits
MAXFILE=65536
CURRENT_MAXFILE=$(ulimit -n)

function update_sysctl(){
    UPDT="fs.file-max = $MAXFILE"
    if ! grep "$UPDT" /etc/sysctl.conf; then
        echo "$UPDT" >> /etc/sysctl.conf
    fi
}

function update_limitsconf(){
        UPDT="* soft    nproc    $MAXFILE"
        if ! grep "$UPDT"  /etc/security/limits.conf; then
                echo "* soft    nproc   $MAXFILE" >>  /etc/security/limits.conf
                echo "* hard    nproc   $MAXFILE" >>  /etc/security/limits.conf
                echo "* soft    nofile  $MAXFILE" >>  /etc/security/limits.conf
                echo "* hard    nofile  $MAXFILE" >>  /etc/security/limits.conf
                echo "root soft nofile  $MAXFILE" >>  /etc/security/limits.conf
                echo "root hard nofile  $MAXFILE" >>  /etc/security/limits.conf
        fi
}

function update_session_perm(){
        UPDT="session required pam_limits.so"
        if ! grep "$UPDT"  /etc/pam.d/common-session; then
                echo "$UPDT" >>  /etc/pam.d/common-session
                echo "$UPDT" >>  /etc/pam.d/common-session-noninteractive
        fi
}

if [ $CURRENT_MAXFILE != $MAXFILE ]; then
    update_sysctl
    update_limitsconf
    update_session_perm
    # reboot ==> MAKE SURE YOU REBOOT!!
fi

shutdown -r now
