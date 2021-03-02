#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "usage: ./deploy_file <filename> <num_parties>"
  exit 1
fi

num_parties=$2

for (( i=1; i<=$num_parties; i++ ))
do
    printf -v hostname "mpc%03d" $i
    echo $hostname
    sshpass -p "lowcmpc" scp -o StrictHostKeyChecking=no -r $1 lowcmpc@$hostname:~
done
