#!/bin/bash
#
# Description

DIR=./../results/overlay-sec
NODE_CNT=2
PERF_FILE=perf_overlay_sec

# Create/refresh results directory.
rm -rf $DIR
mkdir $DIR

# Wait for Memaslap benchmark tests to start.
sleep 1

# Sample performance and resource consumption status.
./../library/perf.sh $PERF_FILE &
./../library/pcpu.sh $DIR &
./../library/vcpu.sh $NODE_CNT $DIR &
./../library/veth.sh $NODE_CNT $DIR &

# cat out.perf-folded | ./flamegraph.pl > $PERF_FILE.svg
