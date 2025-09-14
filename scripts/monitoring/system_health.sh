#!/bin/bash

# System Health Check Script
# Author: HomeLab Admin
# Date: $(date +%Y-%m-%d)


echo "***** SYSTEM HEALTH CHECK *****"
echo "Date: $(date)"
echo "Hostname: $(hostname)"
echo ""

echo "*** UPTIME ***"
uptime
echo ""

echo "*** DISK USAGE ***"
df -h
echo ""

echo "*** MEMORY USAGE ***"
free -h
echo ""

echo "*** TOP 5 PROCESSES SORTED BY CPU ***"
ps aux --sort=-%cpu | head -6
echo ""

echo "*** NETWORK CONNECTIONS ***"
ss -tuln | head -10
echo ""

echo "*** SYSTEM LOAD ***"
cat /proc/loadavg
