#!/bin/bash

LOG_FILE=~/talium-tech/logs/app.log
REPORT_PATH=~/talium-tech/logs/log-report.txt
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

# counts
TOTAL=$(wc -l < $LOG_FILE)
ERROR_COUNT=$(grep -c "ERROR" $LOG_FILE)
WARN_COUNT=$(grep -c "WARN" $LOG_FILE)
INFO_COUNT=$(grep -c "INFO" $LOG_FILE)


echo "========================================" > $REPORT_PATH
echo " Talium-tech Log Report" >> $REPORT_PATH
echo " Generated: $TIMESTAMP" >> $REPORT_PATH
echo "========================================" >> $REPORT_PATH
echo "" >> $REPORT_PATH
echo "Total log lines: $TOTAL" >> $REPORT_PATH
echo "INFO  count: $INFO_COUNT" >> $REPORT_PATH
echo "ERROR count: $ERROR_COUNT" >> $REPORT_PATH
echo "WARN  count: $WARN_COUNT" >> $REPORT_PATH
echo "" >> $REPORT_PATH
echo "Top 3 IPs:" >> $REPORT_PATH
awk '{print $NF}' $LOG_FILE | grep -E "^[0-9]" | sort | uniq -c | sort -rn | head -3 >> $REPORT_PATH

echo "" >> $REPORT_PATH
echo "Endpoints with 500 errors:" >> $REPORT_PATH
awk '$6 == 500 {print $5}' $LOG_FILE | grep "^/" | sort | uniq -c | sort -rn >> $REPORT_PATH

echo "" >> $REPORT_PATH
echo "Unauthorised access IPs:" >> $REPORT_PATH
grep -i "unauthorised" $LOG_FILE | awk '{print $NF}' | sort | uniq -c | sort -rn >> $REPORT_PATH
echo "" >> $REPORT_PATH
echo "========================================" >> $REPORT_PATH

cat $REPORT_PATH
echo "Log report complete"
