#!/bin/bash
DIR_PATH=~/talium-tech/logs
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
LOG_FILE=~/talium-tech/logs/cleanup.log
COUNTS=$(find $DIR_PATH -name "*.log" -mtime +7 | wc -l)
if [ $COUNTS -eq 0 ]; then
    echo "No old log files found"
    exit 0
fi
find $DIR_PATH -name "*.log" -mtime +7 -delete
echo "Files deleted: $COUNTS"
echo "$TIMESTAMP | Deleted $COUNTS old log files" >> ~/talium-tech/logs/cleanup.log
