#!/bin/bash
#
# Description:

DIR=./../results/bridge-pri
INTERFACE=eno1
PERF_FILE=perf_bridge_pri
MCHD1_IP=172.32.0.2
MCHD2_IP=172.32.0.3

# Create/refresh results directory.
rm -rf $DIR
mkdir $DIR

# Start Memaslap benchmark.
./../library/bench_host.sh $MCHD1_IP $MCHD2_IP $DIR &
sleep 1

# Sample performance and resource consumption status.
./../library/eth.sh $INTERFACE $DIR &
./../library/pcpu.sh $DIR &
./../library/perf.sh $PERF_FILE &
./../library/pidstat.sh $DIR &

# cat out.perf-folded | ./flamegraph.pl > perf_bridge.svg

# ---

# cf. VNETWORK
#
#for container in $(docker ps --format '{{.Names}}'); do
#    iflink=`docker exec -it $container bash -c 'cat /sys/class/net/eth0/iflink'`
#    iflink=`echo $iflink|tr -d '\r'`
#    veth=`grep -l $iflink /sys/class/net/veth*/ifindex`
#    veth=`echo $veth|sed -e 's;^.*net/\(.*\)/ifindex$;\1;'`
#    VETH_LIST+=($veth)
#    echo $container:$veth | dd status=none of=$FILE conv=notrunc oflag=append
#done
#echo "" | dd status=none of=$FILE conv=notrunc oflag=append
#
#for i in ${VETH_LIST[@]}
#do
#    ./veth.sh $i &
#done

