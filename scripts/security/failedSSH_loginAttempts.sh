#!/bin/bash

# Failed Login Monitor Script
# Author: m4ci4z
# Monitors SSH authentication failures and reports suspicious activity

LOG_FILE="/var/log/auth.log"
REPORT_FILE="/tmp/failed_logins_report.txt"
THRESHOLD=5

echo "*** FAILED LOGIN MONITOR ***" > $REPORT_FILE
echo "" >> $REPORT_FILE
echo "* * * Date: $(date) * * *" >> $REPORT_FILE
echo "* * * Analyzing: $LOG_FILE * * *" >> $REPORT_FILE
echo "* * * Alert threshold: $THRESHOLD failed attempts * * *" >> $REPORT_FILE
echo "" >> $REPORT_FILE

# Get today's failed SSH attempts
echo "*** TODAY'S FAILED SSH ATTEMPTS ***" >> $REPORT_FILE
TODAY=$(date +%b\ %d)
grep -a "$TODAY" $LOG_FILE | grep -a "Failed password" | wc -l >> $REPORT_FILE
echo "" >> $REPORT_FILE

# Top attacking IP's today
echo "*** TOP ATACKING IP ADDRESSES TODAY ***" >> $REPORT_FILE
grep -a "$TODAY" $LOG_FILE | grep -a "Failed password" | awk '{print $(NF-3)}' | sort | uniq -c |
sort -nr | head -10 >> $REPORT_FILE
echo "" >> $REPORT_FILE

# Latest attempts
echo "*** RECENT FAILED ATTEMPTS ***" >> $REPORT_FILE
grep -a "Failed password" $LOG_FILE | tail -20 >> $REPORT_FILE

# Display raport
cat $REPORT_FILE

# Alerts if exceeded login attempts
FAILED_COUNT=$(grep -a "$TODAY" $LOG_FILE | grep -a "Failed password" | wc -l)
if [ $FAILED_COUNT -gt $THRESHOLD ]; then
	echo ""
	echo "!!! SECURITY ALERT: $FAILED_COUNT failed login attempts today !!!"
fi

