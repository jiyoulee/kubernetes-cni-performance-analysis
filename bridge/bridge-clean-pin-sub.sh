#!/bin/bash

NUM_NODES=$1
NETWORK=br-n-memcached

./stop.sh

cd ./results
rm $(ls | grep txt)
cd ./..

./bridge-start-pin.sh $NUM_NODES $NETWORK
