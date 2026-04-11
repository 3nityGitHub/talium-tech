#!/bin/bash
APP_NAME="Talium-tech"
VERSION="1.0.0"
LOG_FILE=~/talium-tech/logs/health.log
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
DISK_USAGE=$(df -h / | tail -1 | awk '{print $5}')
MEMORY_FREE=$(free -h | grep Mem | awk '{print $4}')
UPTIME=$(uptime -p)
ERRORS=$(grep -c "ERROR" ~/talium-tech/logs/app.log 2>/dev/null || echo "0")

echo "================================"
echo "  $APP_NAME v$VERSION"
echo "  Health Report"
echo "================================"
echo ""
echo "Timestamp : $TIMESTAMP"
echo "Host      : $HOSTNAME"
echo "User      : $USER"
echo "Uptime    : $UPTIME"
echo "Disk Used : $DISK_USAGE"
echo "Memory Free: $MEMORY_FREE"
echo "App Errors: $ERRORS"
echo ""
echo "================================"

echo "$TIMESTAMP | DISK: $DISK_USAGE | MEM_FREE: $MEMORY_FREE | ERRORS: $ERRORS" >> $LOG_FILE
echo "Report saved to $LOG_FILE"
