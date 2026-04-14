#!/bin/bash
echo "Backing up Talium-tech database..."
LOG_FILE=~/talium-tech/logs/backup.log
DATE=$(date +%F)
DIR_PATH=~/talium-tech/database/backups/$DATE
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
mkdir -p $DIR_PATH
COUNTS=$(find ~/talium-tech/database/patients -type f | wc -l)
cp -r ~/talium-tech/database/patients/. $DIR_PATH

echo "Files backed up: $COUNTS"
echo "$TIMESTAMP | Backed up $COUNTS files to $DIR_PATH" >> $LOG_FILE
echo "Backup complete"
