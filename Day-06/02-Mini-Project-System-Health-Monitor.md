# 🎯 MINI PROJECT: System Health Monitor Script (Perfect for LinkedIn!)

## 📌 Project Overview

**What You'll Build:** A simple bash script that monitors your Linux system and displays it in a nice format.

**Why It's Perfect for LinkedIn:**
- ✅ Shows Linux command knowledge
- ✅ Demonstrates Git workflow
- ✅ Real-world utility script
- ✅ Completable in 30-60 minutes
- ✅ Impressive portfolio piece
- ✅ Easy to understand code

**Difficulty Level:** ⭐ Beginner (EASIEST)

---

## 🎬 Quick Start (Copy-Paste Steps)

### Step 1: Create Project Folder
```bash
# Create and enter project directory
mkdir system-health-monitor
cd system-health-monitor

# Initialize Git
git init
```

### Step 2: Create the Script
Create a file named `monitor.sh` and copy this:

```bash
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
```

### Step 3: Make Script Executable
```bash
chmod +x monitor.sh
```

### Step 4: Test the Script
```bash
./monitor.sh
```

**Expected Output:**
```
===========================================
      🖥️  SYSTEM HEALTH MONITOR
===========================================

⏱️  UPTIME:
10:30:45 up 5 days, 3:45, 2 users, load average: 0.52, 0.48, 0.45

🔥 CPU INFO:
processor	: 0
model name	: Intel(R) Core(TM) i7-9700K CPU @ 3.60GHz

💾 MEMORY USAGE:
              total        used        free      shared  buff/cache   available
Mem:           15Gi       6.2Gi       4.5Gi       452Mi       4.2Gi       8.3Gi

💿 DISK USAGE:
/dev/sda1      97G        45G        52G   47% /

👤 USER & SYSTEM:
User: john
Hostname: ubuntu-server
IP Address: 192.168.1.100

⚙️  TOP 5 PROCESSES (by CPU):
root       1234  0.5  0.2 102456 1234 ?   S  10:30   0:15 /sbin/init

🌐 NETWORK STATUS:
✅ Internet: CONNECTED

🕐 CURRENT TIME:
Wednesday, May 07, 2026 10:30:45

===========================================
✅ Health Check Complete!
===========================================
```

---

## 📝 Step 5: Create README
Create `README.md`:

```markdown
# 🖥️ System Health Monitor

A simple bash script to monitor your Linux system health at a glance.

## Features

- ⏱️ System Uptime
- 🔥 CPU Information
- 💾 Memory Usage
- 💿 Disk Space
- 👤 User & Hostname
- ⚙️ Top Running Processes
- 🌐 Network Connectivity
- 🕐 Current Time

## Installation

\`\`\`bash
git clone https://github.com/YOUR-USERNAME/system-health-monitor.git
cd system-health-monitor
chmod +x monitor.sh
\`\`\`

## Usage

\`\`\`bash
./monitor.sh
\`\`\`

## Sample Output

See the script run and get a complete system overview in seconds!

## Requirements

- Linux/Unix system
- Bash shell
- Basic utilities (free, df, ps, etc.)

## Author

Your Name | DevOps Learner

## License

MIT
```

### Step 6: Create .gitignore
```bash
cat > .gitignore << EOF
*.log
.DS_Store
.vscode/
EOF
```

---

## 🚀 Step 7: Push to GitHub

### 7.1 Create GitHub Repository
1. Go to **github.com**
2. Click **New** → Name it `system-health-monitor`
3. Choose **Public**
4. Click **Create**

### 7.2 Push Your Code
```bash
# Add all files
git add .

# First commit
git commit -m "Initial commit: Add system health monitor script"

# Add GitHub as remote
git remote add origin https://github.com/YOUR-USERNAME/system-health-monitor.git

# Rename to main
git branch -M main

# Push to GitHub
git push -u origin main
```

**✅ Your code is now on GitHub!**

---

## 📊 Step 8: Enhance Your Script (Optional)

### Add Log Output
```bash
# At the end of monitor.sh, add:
echo "Last check: $(date)" >> monitor.log
```

### Make it Run Every Hour (Scheduling)
```bash
# Schedule with cron
crontab -e

# Add this line:
0 * * * * /home/user/system-health-monitor/monitor.sh >> /home/user/system-health-monitor/checks.log 2>&1
```

### Create a Version 2 with More Features
```bash
#!/bin/bash

# Enhanced System Monitor

echo "🖥️ ADVANCED SYSTEM MONITOR"

# Check if script is run as root
if [ "$EUID" -eq 0 ]; then 
   echo "⚠️  Running as root"
fi

# System Load
echo "📈 System Load:"
cat /proc/loadavg

# Top Memory Consuming Process
echo "💾 Top Memory Consumer:"
ps aux --sort=-%mem | head -2 | tail -1

# Network Interfaces
echo "🔗 Network Interfaces:"
ip link show | grep "^[0-9]"

# Last Login
echo "👤 Last Login:"
last -1 $(whoami)
```

---

## 🎯 LinkedIn Post Template

**Caption:**
```
🚀 Just built my first DevOps project! 

A System Health Monitor script that displays:
✅ CPU Usage
✅ Memory Status
✅ Disk Space
✅ Network Connectivity
✅ Running Processes
✅ System Info

Tools Used:
📌 Linux (Bash Scripting)
📌 Git & GitHub
📌 Command Line

This simple script helped me understand:
- Linux system commands
- Bash scripting
- Git workflows
- Command line operations

Perfect for monitoring server health! 

#DevOps #Linux #Git #Bash #Learning #GitHub
```

---

## 💡 What You Learned

| Concept | What You Did |
|---------|------------|
| **Linux Commands** | Used `uptime`, `free`, `df`, `ps`, `hostname`, `ip` |
| **Bash Scripting** | Created a shell script with variables & logic |
| **Git Workflow** | init → add → commit → push to GitHub |
| **Networking** | Checked internet with `ping` |
| **Process Management** | Viewed running processes with `ps` |

---

## 🔧 Troubleshooting

| Issue | Solution |
|-------|----------|
| **Permission Denied** | Run `chmod +x monitor.sh` |
| **Command not found** | Make sure you're in the right directory |
| **Git push fails** | Check your GitHub token/SSH key |
| **Script runs slow** | Some commands may take time on first run |

---

## 📈 Version 2: Add More Features

### Add Backup Functionality
```bash
#!/bin/bash

# Create backup of health check
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
./monitor.sh > backup_$TIMESTAMP.txt
echo "✅ Backup created: backup_$TIMESTAMP.txt"
```

### Add Color Output
```bash
# Add at the beginning of monitor.sh
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}✅ System Health Monitor${NC}"
```

### Add Email Alerts
```bash
# Check if CPU > 80%
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1)
if (( $(echo "$CPU > 80" | bc -l) )); then
    echo "⚠️ High CPU usage detected!" | mail -s "Alert" user@example.com
fi
```

---

## 🎓 Next Projects to Build

1. **Disk Space Alert Script** - Get notified when disk is full
2. **Process Monitor** - Restart crashed applications automatically
3. **Log Analyzer** - Parse and summarize system logs
4. **Network Monitor** - Track bandwidth usage
5. **Backup Script** - Automate file backups

---

## ✅ Completion Checklist

- [ ] Created project folder
- [ ] Created `monitor.sh` script
- [ ] Made script executable
- [ ] Tested script locally
- [ ] Created `README.md`
- [ ] Created `.gitignore`
- [ ] Initialized Git repository
- [ ] Committed changes
- [ ] Created GitHub repository
- [ ] Pushed to GitHub
- [ ] Verified on GitHub
- [ ] Posted on LinkedIn 🎉

---

## 🎉 Congratulations!

You've successfully created a portfolio project that demonstrates:
- ✅ Linux command knowledge
- ✅ Bash scripting ability
- ✅ Git/GitHub workflow
- ✅ Problem-solving skills

**You're ready to:**
- Apply for internships
- Build more complex projects
- Learn Docker & Kubernetes
- Master DevOps tools

---

## 📚 Resources

- [Bash Guide](https://mywiki.wooledge.org/BashGuide)
- [Linux Commands](https://linux.die.net/man/)
- [Git Basics](https://git-scm.com/book/en/v2/Getting-Started-About-Version-Control)
- [GitHub Guides](https://guides.github.com/)

---

**Happy Learning! 🚀 Your journey to DevOps mastery starts here! 💪**
