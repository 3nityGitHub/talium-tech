#!/bin/bash
APP_NAME="Talium-tech"
ENVIRONMENT=$1
VERSION=$2
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
DISK_USAGE=$(df -h / | tail -1 | awk '{print $5}')
MEMORY_SPACE=$(free -h | grep mem | awk '{print $4}')
ERROR=$(grep -c "ERROR" ~/talium-tech/logs/server-report.log 2>/dev/null || echo "0")

echo "------------------------------------"
echo " $APP_NAME v$VERSION"
echo " Server Report"
echo "------------------------------------"
echo ""
echo " Timestamp : $TIMESTAMP"
echo " Disk used : $DISK_USEAGE"
echo " Free memory: $MEMORY_SPACE"
echo " Errors: $ERROR"
echo "------------------------------------"

