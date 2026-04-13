#!/bin/bash
CONFIG=~/talium-tech/config/app.env
LOG=~/talium-tech/logs/app.log
SCRIPTS=~/talium-tech/scripts

if [ -f "$CONFIG" ]; then
    echo "OK: Config file exists"
else
    echo "ERROR: Config file missing - cannot start app"
    exit 1
fi

if [ -d "$SCRIPTS" ]; then
    echo "OK: Scripts directory exists"
else
    echo "ERROR: Scripts directory missing"
    exit 1
fi

if [ -s "$LOG" ]; then
    echo "OK: Log file exists and has content"
else
    echo "WARNING: Log file is empty or missing"
fi

if [ -r "$CONFIG" ]; then
    echo "OK: Config file is readable"
fi

if [ -w "$LOG" ]; then
    echo "OK: Log file is writable"
fi
