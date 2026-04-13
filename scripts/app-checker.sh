#!/bin/bash

LOG_FILE=~/talium-tech/logs/checker.log
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
DISK_USAGE=$(df -h / | tail -1 | awk '{print $5}')
MEMORY_FREE=$(free -h | grep Mem | awk '{print $4}')
UPTIME=$(uptime -p)
ERRORS=$(grep -c "ERROR" ~/talium-tech/logs/app.log 2>/dev/null || echo "0")
ENV=$1
DISK=$(df / | tail -1 | awk '{print $5}' | tr -d '%')
CONFIG=~/talium-tech/config/app.env
LOG_DIR=~/talium-tech/logs
sleep 9999 &
TALIUM_TECH_APP=$!
sleep 1

if [ -f "$CONFIG" ]; then 
echo "OK: Config file exists" 
else 
echo "ERROR: Config file missing - cannot start app" 
exit 1 
fi

if [ -d "$LOG_DIR" ]; then 
echo "OK: Log directory exists and has content" 
else
 echo "WARNING: No Log directory created" 
  mkdir -p $LOG_DIR
fi

if [ -z "$ENV" ]; then
echo "ERROR: No environment choosen"
   echo "Usage: ./strings-check.sh production"
    exit 1
fi

if [ "$ENV" = "production" ]; then
    echo "Deploying to PRODUCTION - proceed with caution"
elif [ "$ENV" = "staging" ]; then
    echo "Deploying to STAGING"
elif [ "$ENV" = "dev" ]; then
    echo "Deploying to DEV"
else
    echo "ERROR: Unknown environment: $ENV"
    exit 1
fi

if kill -0 $TALIUM_TECH_APP 2>/dev/null; then
    echo "App is running with PID: $TALIUM_TECH_APP"
else
    echo "App is not running"
fi

if [ $DISK -ge 90 ]; then
    echo "CRITICAL: Disk almost full - clean up immediately"
elif [ $DISK -ge 70 ]; then
    echo "WARNING: Disk usage is high"
else
    echo "OK: Disk usage is healthy"
fi

echo "$TIMESTAMP | ENV: $ENV | DISK: $DISK_USAGE | MEM_FREE: $MEMORY_FREE | ERRORS: $ERROR" >> $LOG_FILE
echo "Report complete"
