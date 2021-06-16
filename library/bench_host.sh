#!/bin/bash
#
# Description: A script for running the Memaslap benchmark and generating test results.

CONCURRENCY=512
DIR=$3
IPADDR1=$1
IPADDR2=$2
PORT=11211
THREADS=16

echo "[START] BENCHMARK"

~/Documents/github.com/memcached_bench/libmemcached-1.0.15/clients/memaslap -B -c ${CONCURRENCY} -s ${IPADDR1}:${PORT},${IPADDR2}:${PORT} -T ${THREADS} -t 70s | dd status=none of=$DIR/benchmark.txt conv=notrunc oflag=append

echo "[DONE] BENCHMARK"

