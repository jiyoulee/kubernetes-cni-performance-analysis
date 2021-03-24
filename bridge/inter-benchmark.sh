#!/bin/bash

CONCURRENCY=512
FILE=./results/benchmark.txt
IPADDR1=172.32.0.2
IPADDR2=172.32.0.3
# IPADDR3=172.34.0.2
# IPADDR4=172.34.0.3
PORT=11211
THREADS=16

docker exec m1 /memcached_bench/libmemcached-1.0.15/clients/memaslap -B -c ${CONCURRENCY} -s ${IPADDR1}:${PORT},${IPADDR2}:${PORT} -T ${THREADS} -t 70s | dd status=none of=$FILE conv=notrunc oflag=append

# ./../../memcached_bench/libmemcached-1.0.15/clients/memaslap -B -c ${CONCURRENCY} -s ${IPADDR1}:${PORT},${IPADDR2}:${PORT},${IPADDR3}:${PORT},${IPADDR4}:${PORT} -T ${THREADS} | dd status=none of=$FILE conv=notrunc oflag=append

echo "[DONE] Memaslap"

