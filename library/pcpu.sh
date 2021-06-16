#!/bin/bash
# Description: Monitor system-wide CPU usage for 60 seconds.

DIR=$1

echo "[SAMPLE] PCPU"

mpstat -P ALL 1 60 | dd status=none of=$DIR/pcpu.txt conv=notrunc oflag=append &

sleep 60s

echo "[DONE] PCPU"
