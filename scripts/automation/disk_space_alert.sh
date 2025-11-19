#!bin/bash

# Disk Space Alert Script
# Author: m4ci4z
# Alerts when disk usage exceeds threshold
# Date: $(date +%Y-%m-%d)

TODAY=$(date +%b)
THRESHOLD=80
PARTITION="/"

# Get current disk usage (without % sign)
USAGE=$(df -h $PARTITION | awk 'NR==2{print $5}' | sed 's/%//')

echo "*** DISK SPACE MONITOR ***"
echo " "
echo "* * * Date: ${TODAY}"
echo "* * * Checking partition: $PARTITION"
echo "* * * Current usage: ${USAGE}%"
echo "* * * Alert threshold: ${THRESHOLD}%"
echo " "

if  [ $USAGE -gt $THRESHOLD ]; then
	echo "!!! ALERT: Disk usage is ${USAGE}% - exceeds threshold!"
	echo "Free space: $(df -h $PARTITION | awk 'NR==2{print $4}')"
else
	echo "*** OK: Disk usage is within acceptable limits"
fi

