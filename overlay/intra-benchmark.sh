#!/bin/bash

CONCURRENCY=512
FILE=./results/benchmark.txt
IPADDR1=10.0.2.89
IPADDR2=10.0.2.91
# IPADDR3=10.0.1.10
# IPADDR4=10.0.1.11
PORT=11211
THREADS=16

docker exec m3 /memcached_bench/libmemcached-1.0.15/clients/memaslap -B -c ${CONCURRENCY} -s ${IPADDR1}:${PORT},${IPADDR2}:${PORT} -T ${THREADS} -t 70s | dd status=none of=$FILE conv=notrunc oflag=append

# ./../../memcached_bench/libmemcached-1.0.15/clients/memaslap -B -c ${CONCURRENCY} -s ${IPADDR1}:${PORT},${IPADDR2}:${PORT},${IPADDR3}:${PORT},$IPADDR4:${PORT} -T ${THREADS} | dd status=none of=$FILE conv=notrunc oflag=append

echo "BENCHMARK done..."
