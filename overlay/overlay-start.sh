#!/bin/bash

NUM_NODES=$1
NUM_CPUS=$2

NETWORK=ov-n-memcached
THREADS=2

for (( i=0; i<$NUM_NODES; i=i+1 ))
do
   docker run --cpus=$NUM_CPUS --name m$i --network $NETWORK -p 11211/udp -d memcached:1.4 memcached -m $MEMORY_SIZE -U 11211 -t $THREADS
done

docker container inspect m0 m1 m2 m3 | grep IPAddress
