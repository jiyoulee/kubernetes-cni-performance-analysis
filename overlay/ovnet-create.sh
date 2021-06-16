#!/bin/bash
#
# Description: A script for creating and verifying a user-made Docker overlay network.


NAME=ov-n-memcached

# Create overlay network.
docker network create -d overlay --attachable $NAME

# Verify its creation.
docker network inspect $NAME
