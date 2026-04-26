#!/bin/bash

# 07 - Real World DevOps Examples

echo "--- DevOps Examples ---"

# Example 1: Automated Backup
# Simulating a backup of a directory
backup_dir() {
    SOURCE_DIR="src"
    BACKUP_DIR="backup_$(date +%Y%m%d_%H%M%S)"
    
    # Check if source exists (simulated)
    # if [ -d "$SOURCE_DIR" ]; then ...
    
    echo "[Backup] Creating backup of $SOURCE_DIR to $BACKUP_DIR..."
    # mkdir -p backups
    # cp -r $SOURCE_DIR backups/$BACKUP_DIR
    echo "[Backup] Success!"
}

backup_dir

# Example 2: Disk Usage Monitoring
# Alert if disk usage is above a threshold
check_disk_usage() {
    THRESHOLD=90
    # Get usage of root partition (simulated value for demo)
    CURRENT_USAGE=85 
    # Real command: df / | grep / | awk '{ print $5 }' | sed 's/%//g'
    
    echo "[Monitor] Checking disk usage..."
    if [ "$CURRENT_USAGE" -ge "$THRESHOLD" ]; then
        echo "[Alert] Disk usage is critical: ${CURRENT_USAGE}%"
    else
        echo "[Monitor] Disk usage is normal: ${CURRENT_USAGE}%"
    fi
}

check_disk_usage

# Example 3: Service Health Check
# Check if a service is running (simulating 'nginx')
check_service() {
    SERVICE="nginx"
    
    echo "[Health] Checking status of $SERVICE..."
    # if systemctl is-active --quiet $SERVICE; then
    # Simulating running state
    if true; then 
        echo "[Health] $SERVICE is running."
    else
        echo "[Health] $SERVICE is DOWN. Attempting restart..."
        # sudo systemctl start $SERVICE
    fi
}

check_service

echo "--- End of Examples ---"
