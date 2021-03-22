#!/bin/bash

sudo perf record -ag -- sleep 60

echo "[DONE] Profiling"
