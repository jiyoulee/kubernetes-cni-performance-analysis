#!/bin/bash

NETWORK=$1
PORT=11211
VCPU_CNT=4.0

docker run --cpus $VCPU_CNT -dit --name m1 --network $NETWORK -p $PORT/udp jiyoulee/memaslap:default /bin/bash

docker ps -a

