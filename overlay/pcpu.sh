#!/bin/bash

mpstat -P ALL 1 60 | dd status=none of=./results/pcpu.txt conv=notrunc oflag=append &

sleep 60s

echo "Sampling pCPU done..."
