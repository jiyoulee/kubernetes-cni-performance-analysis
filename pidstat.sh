#!/bin/bash
#
# Description

DIR=$1

echo "[START] PIDSTAT"

pidstat -G memaslap -t 30 2 >> $DIR/pidstat_mema.txt

sleep 1s

echo "[DONE] PIDSTAT"

