#!/bin/bash

IPADDRESS=172.34.0
HOST_IPADDRESS=10.0.0.22
NET_INTERFACE=$1

sudo route add -net $IPADDRESS.0 netmask 255.255.0.0 gw $HOST_IPADDRESS
echo "DONE"
sudo iptables -A FORWARD -i $NET_INTERFACE -j ACCEPT
echo "DONE"
sudo iptables -P FORWARD ACCEPT
echo "DONE"

route -n
