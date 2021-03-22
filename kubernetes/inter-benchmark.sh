#!/bin/bash

CONCURRENCY=512
FILE=./results/benchmark.txt
IPADDR1=10.244.1.4
IPADDR2=10.244.1.5
PORT=11211
THREADS=16

# kubectl exec memaslap-854f66c954-m48ls -- /memcached_bench/libmemcached-1.0.15/clients/memaslap -B -c ${CONCURRENCY} -s ${IPADDR1}:${PORT},${IPADDR2}:${PORT} -T ${THREADS} -t 70s | dd status=none of=$FILE conv=notrunc oflag=append
kubectl exec memaslap-dd45d7998-76kxk -- /memcached_bench/libmemcached-1.0.15/clients/memaslap -B -c 512 -s 10.244.1.4:11211,10.244.1.5:11211 -T 16 -t 70s | dd status=none of=$FILE conv=notrunc oflag=append

echo "[DONE] Memaslap"

