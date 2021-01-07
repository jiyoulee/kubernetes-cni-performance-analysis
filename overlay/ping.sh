#!/bin/bash

NAME=test2
NETWORK=ov-n-memcached

# Deploy container.
docker run -dit --name $NAME ubuntu /bin/bash

# Verify deployment.
docker ps -a

# Connect to network.
docker network connect $NETWORK $NAME

# Verify connection.
docker network inspect $NETWORK

# Install ping.
docker exec $NAME apt-get update
docker exec $NAME apt-get install -y iputils-ping

# Execute ping.
# docker exec $NAME ping 172.0.0.0
