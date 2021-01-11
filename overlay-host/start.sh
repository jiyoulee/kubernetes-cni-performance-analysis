#!/bin/bash

MEMORY=4096
NODE_CNT=$1
PORT=11211
THREAD_CNT=2
VCPU_CNT=4.0

for (( i=1; i<=$NODE_CNT; i=i+1 ))
do
	docker run --cpus $VCPU_CNT -d --name m$i -p $PORT/udp memcached:1.4 memcached -m $MEMORY -U 11211 -t $THREAD_CNT
done

docker ps -a
