#!/bin/bash

# Script for en/disabling hyperthreading at runtime.
# Before executing script, log in as root.

# Enable.
echo on > /sys/devices/system/cpu/smt/control

# Disable.
# echo off > /sys/devices/system/cpu/smt/control

# Verify (IDLE).
mpstat -A 1 1
