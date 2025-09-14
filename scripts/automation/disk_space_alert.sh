#!/bin/bash

# Disk Space Alert Script
# Alerts when disk usage exceeds threshold

THRESHOLD=80
PARTITION="/"

# Get current disk usage (without % sign)
USAGE=$(df -h $PARTITION | awk 'NR==2{print $5}' | sed 's/%//')

echo "*** DISK SPACE MONITOR ***"
echo ""
echo "* * * Date: $(date)"
echo "* * * Checking partition: $PARTITION"
echo "* * * Current usage: ${USAGE}%"
echo "* * * Alert threshold: ${THRESHOLD}%"
echo ""

if  [ $USAGE -gt $THRESHOLD ]; then
	echo "!!! ALERT: Disk usage is ${USAGE}% - exceeds threshold!"
	echo "Free space: $(df -h $PARTITION | awk 'NR==2{print $4}')"
else
	echo "*** OK: Disk usage is within acceptable limits"
fi
