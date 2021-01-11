#!/bin/bash

CONCURRENCY=512
FILE=./results/benchmark.txt
IPADDR1=10.0.1.7
IPADDR2=10.0.1.9
IPADDR3=10.0.1.10
IPADDR4=10.0.1.11
PORT=11211
THREADS=16

# ./../../memcached_bench/libmemcached-1.0.15/clients/memaslap -B -c ${CONCURRENCY} -s ${IPADDR1}:${PORT},${IPADDR2}:${PORT} -T ${THREADS} | dd status=none of=$FILE conv=notrunc oflag=append

./../../memcached_bench/libmemcached-1.0.15/clients/memaslap -B -c ${CONCURRENCY} -s ${IPADDR1}:${PORT},${IPADDR2}:${PORT},${IPADDR3}:${PORT},$IPADDR4:${PORT} -T ${THREADS} | dd status=none of=$FILE conv=notrunc oflag=append

echo "BENCHMARK done..."
