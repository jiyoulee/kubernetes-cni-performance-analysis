#!/bin/bash

NETWORK=br-n-memcached

docker run -dit --entrypoint /bin/bash --name m1 --network $NETWORK jiyoulee/memaslap:default

docker ps -a
