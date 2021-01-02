#!/bin/bash

FILE=./results/benchmark.txt
IPADDRESS1=172.34.0.2
IPADDRESS2=172.34.0.3
IPADDRESS3=172.34.0.4
IPADDRESS4=172.34.0.5
PORT=11211
THREADS=16
CONCURRENCY=512

./../../memcached_bench/libmemcached-1.0.15/clients/memaslap -B -c ${CONCURRENCY} -s ${IPADDRESS1}:${PORT},${IPADDRESS2}:${PORT},${IPADDRESS3}:${PORT},$IPADDRESS4:${PORT} -T ${THREADS} | dd status=none of=$FILE conv=notrunc oflag=append &

echo "BENCHMARK done..."
