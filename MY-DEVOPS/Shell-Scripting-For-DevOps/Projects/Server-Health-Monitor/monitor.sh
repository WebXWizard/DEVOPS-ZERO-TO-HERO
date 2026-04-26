#!/bin/bash

# Server Health Monitor
# This script checks system metrics and alerts if thresholds are exceeded.

# Source configuration
CONFIG_FILE="config.sh"
if [ -f "$CONFIG_FILE" ]; then
    source "$CONFIG_FILE"
else
    echo "Error: Configuration file $CONFIG_FILE not found."
    exit 1
fi

# Function to log messages
log_message() {
    local message="$1"
    local timestamp=$(date "+%Y-%m-%d %H:%M:%S")
    echo "[$timestamp] $message" | tee -a "$LOG_FILE"
}

# Function to send alert (Simulated)
send_alert() {
    local subject="$1"
    local message="$2"
    
    if [ "$ENABLE_EMAIL_ALERTS" = true ]; then
        log_message "ALERT: Sending email to $ADMIN_EMAIL - Subject: $subject"
        # In a real scenario, you might use 'mail' or 'sendmail'
        # echo "$message" | mail -s "$subject" "$ADMIN_EMAIL"
    else
        log_message "ALERT (Email Disabled): $subject - $message"
    fi
}

# Check CPU Usage
check_cpu() {
    # Get CPU usage (this is a simplified method, works on many Linux systems)
    # For Windows Git Bash, this might not return accurate values, so we simulate or use a basic check
    # Using 'top' in batch mode to get CPU idle time and calculating usage
    
    # SIMULATION FOR DEMO PURPOSES (Replace with actual command for specific OS)
    # cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
    cpu_usage=$(shuf -i 10-100 -n 1) # Random number for demo
    
    log_message "CPU Usage: ${cpu_usage}%"
    
    if (( $(echo "$cpu_usage > $CPU_THRESHOLD" | bc -l) )); then
        send_alert "High CPU Usage" "CPU usage is at ${cpu_usage}% (Threshold: ${CPU_THRESHOLD}%)"
    fi
}

# Check RAM Usage
check_ram() {
    # free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }'
    # SIMULATION FOR DEMO
    ram_usage=$(shuf -i 40-95 -n 1)
    
    log_message "RAM Usage: ${ram_usage}%"
    
    if [ "$ram_usage" -gt "$RAM_THRESHOLD" ]; then
        send_alert "High RAM Usage" "RAM usage is at ${ram_usage}% (Threshold: ${RAM_THRESHOLD}%)"
    fi
}

# Check Disk Usage
check_disk() {
    # df -h | awk '$NF=="/"{printf "%s", $5}'
    # SIMULATION FOR DEMO
    disk_usage=$(shuf -i 50-98 -n 1)
    
    log_message "Disk Usage: ${disk_usage}%"
    
    if [ "$disk_usage" -gt "$DISK_THRESHOLD" ]; then
        send_alert "High Disk Usage" "Disk usage is at ${disk_usage}% (Threshold: ${DISK_THRESHOLD}%)"
    fi
}

# Main Execution
log_message "--- Starting Health Check ---"
check_cpu
check_ram
check_disk
log_message "--- Health Check Completed ---"
