#!/bin/bash

cd ./results/
rm $(ls)
cd ./../

sleep 1

echo "[START] Sampling vCPU data"
./vcpu-sec.sh &

echo "[START] Sampling pCPU data"
./pcpu.sh &

echo "[START] Profiling"
./perf.sh &
