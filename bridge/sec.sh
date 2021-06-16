#!/bin/bash
#
# Description

DIR=./../results/bridge-sec
NODE_CNT=2
PERF_FILE=perf_bridge_sec

# Create/refresh results directory.
rm -rf $DIR
mkdir $DIR

# Wait for Memaslap benchmark tests to start.
sleep 1

# Sample performance and resource consumption status.
./../vcpu.sh $NODE_CNT $DIR &
./../veth.sh $NODE_CNT $DIR &
./../pcpu.sh $DIR &
./../perf.sh $PERF_FILE &

# cat out.perf-folded | ./flamegraph.pl > $PERF_FILE.svg
