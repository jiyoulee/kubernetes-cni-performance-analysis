#!/bin/bash

cd ./results/
rm $(ls)
cd ./../

echo "Start BENCHMARK..."
./inter-benchmark.sh &

sleep 1s

echo "Sampling vCPU data..."
./vcpu-pri.sh &

echo "Sampling vNETWORK data..."
./veth.sh &

echo "Sampling pCPU data..."
./pcpu.sh &
