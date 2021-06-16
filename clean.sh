#!/bin/bash
#
# Description: A script for stopping and removing all containers on the host.


docker stop $(docker ps -aq)
docker rm $(docker ps -aq)

docker ps -a
