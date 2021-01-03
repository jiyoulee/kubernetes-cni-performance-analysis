#!/bin/bash

PUBLIC_IP_ADDR=172.36.0
NAME=ov-n-memcached

# Create bridge network
docker network create -d overlay --attachable --gateway $PUBLIC_IP_ADDR.1 --subnet $PUBLIC_IP_ADDR.0/16 $NAME

# Verify bridge network
docker network inspect $NAME
