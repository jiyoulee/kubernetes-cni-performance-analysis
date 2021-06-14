#!/bin/bash
#
# Description: A script for running the benchmark tool perf.

echo "[START] PERF"

sudo sh ./../cni-perf/perf.sh &&
sudo cp perf.data ./../cni-perf/$PERF_FILE.data &&
if [ -f "$FLAMEGRAPH_FILE" ]; then
        sudo rm ./../cni-perf/FlameGraph/perf.data
fi
sudo mv perf.data ./../cni-perf/FlameGraph/ &&
cd ./../cni-perf/FlameGraph &&
sudo perf script | ./stackcollapse-perf.pl > out.perf-folded

echo "[DONE] PERF"
