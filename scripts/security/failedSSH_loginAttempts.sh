#!/bin/bash

# Failed Login Monitor Script
# Monitors SSH authentication failures and reports suspicious activity

LOG_FILE="/var/log/auth.log"
REPORT_FILE="/tmp/failed_logins_report.txt"
THRESHOLD=5

echo "*** FAILED LOGIN MONITOR ***" > $REPORT_FILE
echo "" >> $REPORT_FILE
echo "* * * Date: $(date)" >> $REPORT_FILE
echo "* * * Analyzing: $LOG_FILE" >> $REPORT_FILE
echo "* * * Alert threshold: $THRESHOLD failed attempts" >> $REPORT_FILE
echo "" >> $REPORT_FILE

# Get today's failed SSH attempts
echo "*** TODAY'S FAILED SSH ATTEMPTS ***" >> $REPORT_FILE
TODAY=$(date +%b\ %d)
