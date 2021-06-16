#!/bin/bash
#
# Description: Monitor interface ens11f1(10G) for 60 seconds, and get traffic average.

DIR=$2
INTERFACE=$1

echo "[SAMPLE] ETH"

vnstat -i eno1 -tr 60 | dd status=none of=$DIR/eth.txt conv=notrunc oflag=append &

sleep 60s

echo "[DONE] ETH"
