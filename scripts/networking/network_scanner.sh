#!/bin/bash

# Network Scanner script
# Author: m4ci4z
# Scans local network for active devices

echo "*** NETWORK SCANNER ***"
echo ""
echo "*** Date: $(date) ***"
echo ""


# Get current IP and subnet

IP=$(ip -4 addr show | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | grep -v '127.0.0.1')

SUBNET=$(echo $IP | cut -d. -f1-3)

echo "IP: $IP"
echo "Scanning subnet: ${SUBNET}.0/24"
echo ""
echo "This may take a while..."
echo ""

# Check if nmap is installed...

if command -v nmap &> /dev/null; then
	echo "*** NMAP SCAN ***"
	sudo nmap -sn ${SUBNET}.0/24 | grep -B 2 "Host is up"
else
	echo "nmap not found, using ping method"
	echo ""
	echo "*** PING SCAN ***"

	for ip in ${SUBNET}.{1..254}; do
		#... tbc

