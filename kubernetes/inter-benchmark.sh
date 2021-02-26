#!/bin/bash

CONCURRENCY=512
FILE=./results/benchmark.txt
IPADDR1=192.168.141.198
IPADDR2=192.168.141.199
PORT=11211
THREADS=16

# kubectl exec memaslap-854f66c954-m48ls -- /memcached_bench/libmemcached-1.0.15/clients/memaslap -B -c ${CONCURRENCY} -s ${IPADDR1}:${PORT},${IPADDR2}:${PORT} -T ${THREADS} -t 70s | dd status=none of=$FILE conv=notrunc oflag=append
kubectl exec memaslap-854f66c954-5xq9r -- /memcached_bench/libmemcached-1.0.15/clients/memaslap -B -c 512 -s 192.168.141.198:11211,192.168.141.199:11211 -T 16 -t 70s | dd status=none of=$FILE conv=notrunc oflag=append

echo "BENCHMARK done..."

