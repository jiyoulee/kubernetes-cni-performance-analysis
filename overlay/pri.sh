#!/bin/bash

DIR=./../results/overlay-pri
INTERFACE=ens11f1
NODE_CNT=1
PERF_FILE=perf_overlay_pri
MCHD1_IP=10.0.1.2
MCHD2_IP=10.0.1.4

# Create/refresh results directory.
rm -rf $DIR
mkdir $DIR

# Start benchmark.
./../library/bench_ctnr.sh $MCHD1_IP $MCHD2_IP $DIR &
sleep 1s

# Sample performance and resource consumption status.
./../library/eth.sh $INTERFACE $DIR &
./../library/pcpu.sh $DIR &
./../library/perf.sh $PERF_FILE &
./../library/pidstat.sh $DIR &
./../library/vcpu.sh $NODE_CNT $DIR &
./../library/veth.sh $NODE_CNT $DIR &

# cat out.perf-folded | ./flamegraph.pl > perf_overlay_pri.svg

