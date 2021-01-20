#!/bin/bash

NAME=ov-n-memcached

# Create bridge network
docker network create -d overlay --attachable $NAME

# Verify bridge network
docker network inspect $NAME
