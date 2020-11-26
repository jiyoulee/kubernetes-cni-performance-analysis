#!/bin/bash

NUM_NODES=$1
NUM_CPUS=$2
NETWORK=br-n-memcached

./stop.sh

cd ./results
rm $(ls | grep txt)
cd ./..

./bridge-start.sh $NUM_NODES $NUM_CPUS $NETWORK
