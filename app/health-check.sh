#!/bin/bash

echo "=========================="
echo "      HEALTH CHECK"
echo "=========================="

echo
echo "Disk Usage:"
df -h /

echo
echo "Memory Usage:"
free -h

echo
echo "Network Check:"
if ping -c 2 -W 3 google.com > /dev/null 2>&1; then
    echo "Network: OK"
else
    echo "Network: FAILED"
fi

echo
echo "Health Check Complete."
