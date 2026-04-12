#!/bin/bash
DISK=$(df / | tail -1 | awk '{print $5}' | tr -d '%')

echo "Disk usage: $DISK%"

if [ $DISK -ge 23 ]; then
    echo "CRITICAL: Disk almost full - clean up immediately"
elif [ $DISK -ge 20 ]; then
    echo "WARNING: Disk usage is high"
else
    echo "OK: Disk usage is healthy"
fi
