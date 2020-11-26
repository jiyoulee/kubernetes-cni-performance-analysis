#!/bin/bash

PUBLIC_IP=172.34.0
NAME=br-n-memcached

# Create bridge network {NAME} w/ public IP address {PUBLIC_IP}
docker network create --gateway $PUBLIC_IP.1 --subnet $PUBLIC_IP.0/16 $NAME

# Verify bridge network
docker network inspect $NAME
