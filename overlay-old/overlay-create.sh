#!/bin/bash

PUBLIC_IP=172.35.0
NAME=ov-n-memcached

# Delete existing attachable overlay network
sudo systemctl restart docker
sudo chmod 666 /var/run/docker.sock
docker network rm $NAME

# Create attachable overlay network {NAME} w/ public IP address {PUBLIC_IP}
docker network create -d overlay --attachable --gateway $PUBLIC_IP.1 --subnet $PUBLIC_IP.0/16 $NAME

# Verify overlay network
docker network inspect $NAME
