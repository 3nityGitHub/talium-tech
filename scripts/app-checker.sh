#!/bin/bash

LOG_FILE=~/talium-tech/logs/health.log
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
DISK_USAGE=$(df -h / | tail -1 | awk '{print $5}')
MEMORY_FREE=$(free -h | grep Mem | awk '{print $4}')
UPTIME=$(uptime -p)
ERRORS=$(grep -c "ERROR" ~/talium-tech/logs/app.log 2>/dev/null || echo "0"
ENV=$1
DISK=$(df / | tail -1 | awk '{print $5}' | tr -d '%')
CONFIG=~/talium-tech/config/app.env
LOG=~/talium-tech/logs/checker.log
DIR=mkdir -p ~/talium-tech/logs/checker.log

if [ -f "$CONFIG" ]; then 
echo "OK: Config file exists" 
else 
echo "ERROR: Config file missing - cannot start app" 
exit 1 
fi

if [ -d "$LOG" ]; then 
echo "OK: Log file exists and has content" 
else
 echo "WARNING: Log file is empty or missing" 
   $DIR
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

if [ $DISK -ge 90 ]; then
    echo "CRITICAL: Disk almost full - clean up immediately"
elif [ $DISK -ge 70 ]; then
    echo "WARNING: Disk usage is high"
else
    echo "OK: Disk usage is healthy"
fi

echo "$TIMESTAMP | ENV: $ENVIRONMENT | DISK: $DISK_USAGE | MEM_FREE: $MEMORY_SPACE | ERRORS: $ERROR" >> ~/talium-tech/logs/checker.log
echo "Report complete"
