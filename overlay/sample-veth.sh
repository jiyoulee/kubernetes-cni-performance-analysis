#!/bin/bash

args=("$@")

for (( i=0; i<$#; i++ ))
do
    vnstat -l -i ${args[$i]} -tr 60 > ./results/${args[$i]}.txt &
done

sleep 60s
echo "Sampling Container NETWORK done..."
