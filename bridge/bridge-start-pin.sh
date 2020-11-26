#!/bin/bash

NUM_NODES=$1
NETWORK=$2
THREADS=2

docker run --name m0 --network $NETWORK -p 11211/udp -d memcached:1.4 memcached -m $MEMORY_SIZE -U 11211 -t $THREADS --cpuset-cpus="0-3" --cpus 4
docker run --name m1 --network $NETWORK -p 11211/udp -d memcached:1.4 memcached -m $MEMORY_SIZE -U 11211 -t $THREADS --cpuset-cpus="4-7" --cpus 4

