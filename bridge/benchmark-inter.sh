#!/bin/bash

NUM_NODES=4
FILE_PATH=./results/stats.txt

IPADDRESS1=172.32.0.2
IPADDRESS2=172.32.0.3
IPADDRESS3=172.34.0.2
IPADDRESS4=172.34.0.3
NUM_EXECUTION=100000000
PORT=11211
THREADS=16
CONCURRENCY=512

../../../memcached_bench/libmemcached-1.0.15/clients/memaslap -s ${IPADDRESS1}:${PORT},${IPADDRESS2}:${PORT},${IPADDRESS3}:${PORT},$IPADDRESS4:${PORT} -c ${CONCURRENCY} -B -x ${NUM_EXECUTION} -T ${THREADS} | dd status=none of=$FILE_PATH conv=notrunc oflag=append

echo "BENCHMARK done..."

