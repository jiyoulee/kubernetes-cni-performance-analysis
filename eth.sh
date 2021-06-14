#!/bin/bash
#
# Description: Monitor interface ens11f1(10G) for 60 seconds, and get traffic average.

DIR=$1

echo "[START] NETWORK"

vnstat -i eno1 -tr 60 | dd status=none of=$DIR/veth_mema.txt conv=notrunc oflag=append &

sleep 60s

echo "[DONE] NETWORK"
