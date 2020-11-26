#!/bin/bash

mpstat -P ALL 1 60 | dd status=none of=./results/stats_cpu.txt conv=notrunc oflag=append &

sleep 60s
echo "Sampling Host CPU done..."
