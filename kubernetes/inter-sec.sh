#!/bin/bash

cd ./results/
rm $(ls)
cd ./../

sleep 1

echo "Sampling vCPU data..."
./vcpu-sec.sh &

echo "Sampling pCPU data..."
./pcpu.sh &
