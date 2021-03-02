#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "usage: ./append_hosts.sh <num_parties>"
  exit 1
fi

num_parties=$1

for (( i=1; i<=$num_parties; i++ ))
do
    printf -v hostname "mpc%03d" $i
    echo $hostname
    sshpass -p "lowcmpc" ssh lowcmpc@$hostname <<EOF
cat hosts | sudo tee -a /etc/hosts
cat /etc/hosts
 
EOF
done
