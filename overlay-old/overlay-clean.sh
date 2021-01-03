#!/bin/bash

NUM_NODES=$1
NUM_CPUS=$2

./stop.sh

cd ./results
rm $(ls | grep txt)
cd ./..

echo "Creating overlay network..."
./overlay-create.sh

./overlay-start.sh $NUM_NODES $NUM_CPUS
