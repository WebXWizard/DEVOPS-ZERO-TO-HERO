#!/bin/bash

# 🖥️ System Health Monitor Script
# A simple script to monitor Linux system status

echo "==========================================="
echo "      🖥️  SYSTEM HEALTH MONITOR"
echo "==========================================="
echo ""

# 1. System Uptime
echo "⏱️  UPTIME:"
uptime
echo ""

# 2. CPU Usage
echo "🔥 CPU INFO:"
cat /proc/cpuinfo | grep "processor\|model name" | head -2
echo ""

# 3. Memory Usage
echo "💾 MEMORY USAGE:"
free -h
echo ""

# 4. Disk Usage
echo "💿 DISK USAGE:"
df -h / | tail -1
echo ""

# 5. Current User & Hostname
echo "👤 USER & SYSTEM:"
echo "User: $(whoami)"
echo "Hostname: $(hostname)"
echo "IP Address: $(hostname -I)"
echo ""

# 6. Running Processes
echo "⚙️  TOP 5 PROCESSES (by CPU):"
ps aux --sort=-%cpu | head -6
echo ""

# 7. Network Status
echo "🌐 NETWORK STATUS:"
ping -c 1 google.com > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "✅ Internet: CONNECTED"
else
    echo "❌ Internet: DISCONNECTED"
fi
echo ""

# 8. Current Time
echo "🕐 CURRENT TIME:"
date "+%A, %B %d, %Y %H:%M:%S"
echo ""

echo "==========================================="
echo "✅ Health Check Complete!"
echo "==========================================="