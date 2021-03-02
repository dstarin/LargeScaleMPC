#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "usage: ./pull_logs <num_parties>"
  exit 1
fi

num_parties=$1

for (( i=1; i<=$num_parties; i++ ))
do
    printf -v hostname "mpc%03d" $i
    echo $hostname
    sshpass -p "lowcmpc" scp -o StrictHostKeyChecking=no -r lowcmpc@$hostname:~/log-$hostname.txt ./logs/
done
