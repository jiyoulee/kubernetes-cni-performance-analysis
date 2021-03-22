#!/bin/bash

cd ./results/
rm $(ls)
cd ./../

echo "[START] Memaslap"
./inter-benchmark.sh &

sleep 1s

echo "[START] Sampling vCPU data"
./vcpu-pri.sh &

echo "[START] Sampling vNETWORK data"
./veth.sh &

echo "[START] Sampling pCPU data"
./pcpu.sh &

echo "[START] Profiling"
./perf.sh &
