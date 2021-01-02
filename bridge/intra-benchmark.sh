#!/bin/bash

FILE=./results/benchmark.txt
IPADDR1=172.34.0.2
IPADDR2=172.34.0.3
IPADDR3=172.34.0.4
IPADDR4=172.34.0.5
PORT=11211
THREADS=16
CONCURRENCY=512

./../../memcached_bench/libmemcached-1.0.15/clients/memaslap -B -c ${CONCURRENCY} -s ${IPADDR1}:${PORT},${IPADDR2}:${PORT},${IPADDR3}:${PORT},$IPADDR4:${PORT} -T ${THREADS} | dd status=none of=$FILE conv=notrunc oflag=append

echo "BENCHMARK done..."
