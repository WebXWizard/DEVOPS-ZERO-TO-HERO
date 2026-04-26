#!/bin/bash

# Goal: Check if disk usage is too high (Simulation)

THRESHOLD=80
# Get the usage % of the C drive (Git Bash/Windows friendly) or / (Linux)
# This is a simulation value for safety
CURRENT_USAGE=85

echo "Checking System Health..."
echo "Disk Threshold set to: $THRESHOLD%"
echo "Current Usage: $CURRENT_USAGE%"

# If/Else Logic
if [ "$CURRENT_USAGE" -gt "$THRESHOLD" ]; then
    echo "CRITICAL: Disk usage is high! Please clean up files."
else
    echo "STATUS: System is healthy."
fi
