# 🎯 USING KILLERKODA PLATFORM FOR SYSTEM HEALTH MONITOR PROJECT

## 📌 What is KillerKoda?

**KillerKoda** is a FREE online platform where you can run Linux commands in your browser without any installation!

✅ No setup needed
✅ Real Linux terminal access
✅ Free to use
✅ Perfect for beginners
✅ Interactive learning
✅ Shareable scenarios

---

## 🚀 Step 1: Access KillerKoda

### 1.1 Go to the Website
```
https://killercoda.com/
```

### 1.2 Sign Up (Free)
1. Click **"Sign Up"** (top right)
2. Choose: **Sign up with GitHub** (recommended)
3. Authorize KillerKoda to access your GitHub
4. ✅ You're in!

---

## 🛠️ Step 2: Create New Scenario

### 2.1 Start a Scenario
1. Click **"Create Scenario"** or **"Ubuntu"** (pre-made Linux environment)
2. Or click **"Start"** on any existing scenario
3. You'll see a browser-based terminal

### 2.2 What You See

```
┌─────────────────────────────────────────┐
│  Left Panel: Instructions               │
├─────────────────────────────────────────┤
│  Right Panel: Linux Terminal            │
│  $ _                                    │
│  (You can type here!)                   │
└─────────────────────────────────────────┘
```

---

## 💻 Step 3: Set Up Your Project on KillerKoda

### 3.1 Create Project Directory
Copy and paste in the terminal:

```bash
mkdir system-health-monitor
cd system-health-monitor
```

### 3.2 Initialize Git
```bash
git init
git config user.name "Your Name"
git config user.email "your@email.com"
```

### 3.3 Create monitor.sh
Copy the entire script below and paste it:

```bash
cat > monitor.sh << 'EOF'
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
EOF
```

### 3.4 Make Script Executable
```bash
chmod +x monitor.sh
```

### 3.5 Test the Script
```bash
./monitor.sh
```

**You should see output!** ✅

---

## 📝 Step 4: Create README on KillerKoda

```bash
cat > README.md << 'EOF'
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

```bash
git clone https://github.com/YOUR-USERNAME/system-health-monitor.git
cd system-health-monitor
chmod +x monitor.sh
```

## Usage

```bash
./monitor.sh
```

## Requirements

- Linux/Unix system
- Bash shell

## Author

Your Name | DevOps Learner

## License

MIT
EOF
```

---

## 🔧 Step 5: Create .gitignore

```bash
cat > .gitignore << 'EOF'
*.log
.DS_Store
.vscode/
EOF
```

---

## 📤 Step 6: Git Commands on KillerKoda

### 6.1 Check Status
```bash
git status
```

### 6.2 Add Files
```bash
git add .
```

### 6.3 First Commit
```bash
git commit -m "Initial commit: Add system health monitor script"
```

### 6.4 View Commit History
```bash
git log --oneline
```

---

## 🌐 Step 7: Push to GitHub (From KillerKoda)

### 7.1 Create GitHub Repository
1. Go to **github.com**
2. Click **New** → Name it `system-health-monitor`
3. Choose **Public**
4. Copy the HTTPS URL (e.g., `https://github.com/username/system-health-monitor.git`)

### 7.2 Add Remote & Push (On KillerKoda)

```bash
# Add remote
git remote add origin https://github.com/YOUR-USERNAME/system-health-monitor.git

# Rename branch
git branch -M main

# Push code
git push -u origin main
```

**It will ask for:**
- Username: Your GitHub username
- Password: Your GitHub **token** (NOT password!)

### 7.3 Create GitHub Token (if needed)

1. Go to **github.com** → **Settings** → **Developer settings** → **Personal access tokens**
2. Click **Generate new token**
3. Select: `repo` ✅
4. Copy the token
5. Paste in KillerKoda when prompted

---

## ✅ Step 8: Verify on GitHub

1. Go to your GitHub repo
2. You should see:
   - ✅ `monitor.sh`
   - ✅ `README.md`
   - ✅ `.gitignore`

**Perfect!** Your code is now on GitHub! 🎉

---

## 📊 KillerKoda Features You Can Use

### 1. Run Multiple Commands
```bash
# All at once or one by one
mkdir test && cd test && pwd
```

### 2. Edit Files with nano
```bash
nano monitor.sh
# Edit content, Ctrl+X to save
```

### 3. View File Content
```bash
cat monitor.sh
```

### 4. Copy Code to Clipboard
```bash
cat monitor.sh | xclip -selection clipboard
```

### 5. Download Files
Use the terminal to copy, then download from your computer

---

## 🎯 Full Project Walkthrough (Copy These Commands)

**Just copy-paste each command group into KillerKoda terminal:**

```bash
# STEP 1: Setup
mkdir system-health-monitor
cd system-health-monitor
git init
git config user.name "Your Name"
git config user.email "your@email.com"

# STEP 2: Create monitor.sh (copy the script above)
cat > monitor.sh << 'EOF'
#!/bin/bash
... (paste the entire script here)
EOF

# STEP 3: Test it
chmod +x monitor.sh
./monitor.sh

# STEP 4: Create README
cat > README.md << 'EOF'
... (paste README content)
EOF

# STEP 5: Create .gitignore
cat > .gitignore << 'EOF'
*.log
.DS_Store
.vscode/
EOF

# STEP 6: Git workflow
git add .
git commit -m "Initial commit: Add system health monitor script"
git status

# STEP 7: Push to GitHub
git remote add origin https://github.com/YOUR-USERNAME/system-health-monitor.git
git branch -M main
git push -u origin main
```

---

## 🐛 Troubleshooting on KillerKoda

| Issue | Solution |
|-------|----------|
| **Command not found** | Make sure you're in the right directory (`pwd` to check) |
| **Permission denied** | Run `chmod +x monitor.sh` |
| **Git push fails** | Use GitHub token, not password. Generate one in GitHub settings |
| **Terminal cleared by accident** | Just continue - KillerKoda saves your files |
| **Can't see output** | Scroll down in terminal |

---

## 📸 What to Screenshot for LinkedIn

1. **Screenshot 1:** Terminal showing script output
   ```bash
   ./monitor.sh
   ```
   Shows: System info, CPU, Memory, Disk, Network status

2. **Screenshot 2:** Git commands
   ```bash
   git log --oneline
   ```

3. **Screenshot 3:** GitHub repository with your code
   `github.com/username/system-health-monitor`

---





## 🚀 Next Steps After This

1. **Add features** to your script (more system info)
2. **Create scheduled checks** (cron jobs)
3. **Add logging** (save output to file)
4. **Build next project:** Disk space alert script
5. **Learn Docker:** Containerize applications
6. **Learn Kubernetes:** Orchestrate containers

---

## 💡 Pro Tips for KillerKoda

✅ **Copy-Paste Multiple Lines:**
- Select all text in code block
- Right-click → Copy
- Right-click in terminal → Paste

✅ **Keep Terminal Clean:**
```bash
clear  # Clear screen
```

✅ **Create Multiple Files Efficiently:**
Use `cat > filename << 'EOF'` pattern

✅ **Check Current State:**
```bash
ls -la      # List files
pwd         # Show directory
git status  # Git status
```

✅ **Save Work:**
Git automatically backs up your work!

---

## ✅ Complete Checklist

- [ ] Created KillerKoda account
- [ ] Created project directory on KillerKoda
- [ ] Initialized Git
- [ ] Created monitor.sh script
- [ ] Made script executable
- [ ] Tested script (saw output!)
- [ ] Created README.md
- [ ] Created .gitignore
- [ ] Committed to Git
- [ ] Pushed to GitHub
- [ ] Verified on GitHub
- [ ] Took screenshots


---

## 🎉 You Did It!

You've successfully:
✅ Used KillerKoda (online Linux environment)
✅ Wrote a Bash script
✅ Used Git & GitHub
✅ Created a portfolio project
✅ Ready for LinkedIn post!

**Total time: 30-45 minutes**

---

## 📚 Resources

- [KillerKoda Official](https://killercoda.com/)
- [KillerKoda Docs](https://killercoda.com/help)
- [Bash Guide](https://mywiki.wooledge.org/BashGuide)
- [Git Basics](https://git-scm.com/book/en/v2)

---

**Happy Learning! 🚀 You've got this! 💪**
