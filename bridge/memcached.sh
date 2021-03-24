#!/bin/bash

MEMORY=1024
NETWORK=br-n-memcached
NODE_CNT=$1
PORT=11211
THREAD_CNT=2
VCPU_CNT=4.0

for (( i=1; i<=$NODE_CNT; i=i+1 ))
do
	docker run --cpus $VCPU_CNT -d --name m$i --network $NETWORK -p $PORT/udp jiyoulee/memcached:1.4.1 memcached -m $MEMORY -U 11211 -t $THREAD_CNT
done

docker network inspect $NETWORK
docker ps -a
