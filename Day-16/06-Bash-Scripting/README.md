# 📜 Bash Scripting — Complete Revision Guide

> **Bash = Bourne Again SHell — The language of Linux automation.**

---

## 📖 What is Bash?

Bash (Bourne Again Shell) is a **command-line interpreter** and **scripting language** for Linux/Unix systems. It allows you to automate tasks, manage systems, and create powerful scripts.

### Why Bash in DevOps?

- 🤖 **Automation** — Automate repetitive tasks
- 📊 **Monitoring** — System health checks
- 🚀 **Deployment** — Automated deployments
- 💾 **Backup** — Automated backup scripts
- 📝 **Log Management** — Log rotation, parsing
- 🔧 **Configuration** — Server setup automation

---

## 🏗️ Bash Script Basics

### Shebang Line

Every bash script starts with a **shebang** that tells the system which interpreter to use:

```bash
#!/bin/bash       # Bash interpreter
#!/bin/sh         # POSIX shell
#!/usr/bin/env bash  # Portable (finds bash in PATH)
```

### Creating & Running a Script

```bash
# 1. Create script
nano myscript.sh

# 2. Add shebang + code
#!/bin/bash
echo "Hello, DevOps!"

# 3. Make executable
chmod +x myscript.sh

# 4. Run script
./myscript.sh           # Direct execution
bash myscript.sh        # Using bash command
source myscript.sh      # Run in current shell
```

---

## 📦 Variables

### Variable Types

```bash
#!/bin/bash

# String variable
NAME="Shahe Alam"
echo "Hello, $NAME"

# Integer variable
AGE=25
echo "Age: $AGE"

# Command substitution
CURRENT_DATE=$(date)
echo "Date: $CURRENT_DATE"

HOSTNAME=$(hostname)
echo "Server: $HOSTNAME"

# Read-only variable
readonly PI=3.14
# PI=3.15  # This would cause an error

# Unset variable
TEMP="temporary"
unset TEMP
```

### Variable Rules

```
✅ No spaces around = sign:        NAME="Shahe"
❌ Wrong:                           NAME = "Shahe"
✅ Use $VAR or ${VAR}:             echo "$NAME"
✅ Double quotes preserve spaces:   echo "$NAME"
✅ Single quotes are literal:       echo '$NAME' → prints $NAME
```

### Special Variables

| Variable | Description | Example |
|----------|-------------|---------|
| `$0` | Script name | `./myscript.sh` |
| `$1, $2, $3...` | Positional arguments | `$1` = first argument |
| `$#` | Number of arguments | `3` |
| `$@` | All arguments (as separate words) | `"arg1" "arg2" "arg3"` |
| `$*` | All arguments (as single string) | `"arg1 arg2 arg3"` |
| `$?` | Exit status of last command | `0` = success |
| `$$` | Current script's PID | `12345` |
| `$!` | PID of last background process | `12346` |
| `$USER` | Current username | `shahe` |
| `$HOME` | Home directory | `/home/shahe` |
| `$PWD` | Current directory | `/var/www` |
| `$PATH` | Executable search path | `/usr/bin:/usr/local/bin` |

### Example: Using Arguments

```bash
#!/bin/bash
echo "Script name: $0"
echo "First argument: $1"
echo "Second argument: $2"
echo "Total arguments: $#"
echo "All arguments: $@"

# Run: ./script.sh hello world
# Output:
# Script name: ./script.sh
# First argument: hello
# Second argument: world
# Total arguments: 2
# All arguments: hello world
```

---

## 🔢 Arrays

```bash
#!/bin/bash

# Indexed Array
FRUITS=("apple" "banana" "cherry" "date")

echo "${FRUITS[0]}"        # First element: apple
echo "${FRUITS[2]}"        # Third element: cherry
echo "${FRUITS[@]}"        # All elements
echo "${#FRUITS[@]}"       # Array length: 4

# Add element
FRUITS+=("elderberry")

# Loop through array
for fruit in "${FRUITS[@]}"; do
    echo "Fruit: $fruit"
done

# Associative Array (dictionary)
declare -A SERVERS
SERVERS[web]="192.168.1.10"
SERVERS[db]="192.168.1.20"
SERVERS[cache]="192.168.1.30"

echo "Web server: ${SERVERS[web]}"

# Loop associative array
for key in "${!SERVERS[@]}"; do
    echo "$key: ${SERVERS[$key]}"
done
```

---

## ⚡ Conditionals (if/elif/else)

### Basic Syntax

```bash
#!/bin/bash

if [ condition ]; then
    # code if true
elif [ condition ]; then
    # code if second condition true
else
    # code if all conditions false
fi
```

### String Comparisons

| Operator | Meaning | Example |
|----------|---------|---------|
| `=` or `==` | Equal | `[ "$a" == "$b" ]` |
| `!=` | Not equal | `[ "$a" != "$b" ]` |
| `-z` | String is empty | `[ -z "$str" ]` |
| `-n` | String is not empty | `[ -n "$str" ]` |

### Numeric Comparisons

| Operator | Meaning | Example |
|----------|---------|---------|
| `-eq` | Equal | `[ $a -eq $b ]` |
| `-ne` | Not equal | `[ $a -ne $b ]` |
| `-gt` | Greater than | `[ $a -gt $b ]` |
| `-lt` | Less than | `[ $a -lt $b ]` |
| `-ge` | Greater or equal | `[ $a -ge $b ]` |
| `-le` | Less or equal | `[ $a -le $b ]` |

### File Tests

| Operator | Meaning | Example |
|----------|---------|---------|
| `-f` | File exists (regular) | `[ -f "/path/file" ]` |
| `-d` | Directory exists | `[ -d "/path/dir" ]` |
| `-e` | File/dir exists | `[ -e "/path" ]` |
| `-r` | File is readable | `[ -r "file" ]` |
| `-w` | File is writable | `[ -w "file" ]` |
| `-x` | File is executable | `[ -x "script.sh" ]` |
| `-s` | File is not empty | `[ -s "file" ]` |

### Logical Operators

| Operator | Meaning | Example |
|----------|---------|---------|
| `&&` or `-a` | AND | `[ $a -gt 0 ] && [ $a -lt 100 ]` |
| `\|\|` or `-o` | OR | `[ $a -eq 0 ] \|\| [ $a -eq 1 ]` |
| `!` | NOT | `[ ! -f "file" ]` |

### Practical Examples

```bash
#!/bin/bash

# Check if file exists
FILE="/etc/nginx/nginx.conf"
if [ -f "$FILE" ]; then
    echo "Nginx config found!"
else
    echo "Nginx config not found!"
fi

# Check disk usage
USAGE=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')
if [ "$USAGE" -gt 80 ]; then
    echo "⚠️ ALERT: Disk usage is ${USAGE}%"
elif [ "$USAGE" -gt 60 ]; then
    echo "⚡ WARNING: Disk usage is ${USAGE}%"
else
    echo "✅ Disk usage is healthy: ${USAGE}%"
fi

# Check if service is running
if systemctl is-active --quiet nginx; then
    echo "✅ Nginx is running"
else
    echo "❌ Nginx is NOT running"
    sudo systemctl start nginx
fi
```

---

## 🔄 Case Statement

```bash
#!/bin/bash

echo "Enter environment (dev/staging/prod):"
read ENV

case $ENV in
    dev|development)
        echo "🔧 Deploying to Development..."
        PORT=3000
        ;;
    staging)
        echo "🧪 Deploying to Staging..."
        PORT=3001
        ;;
    prod|production)
        echo "🚀 Deploying to Production..."
        PORT=80
        ;;
    *)
        echo "❌ Unknown environment: $ENV"
        exit 1
        ;;
esac

echo "Using port: $PORT"
```

---

## 🔁 Loops

### For Loop

```bash
#!/bin/bash

# Basic for loop
for i in 1 2 3 4 5; do
    echo "Number: $i"
done

# Range
for i in {1..10}; do
    echo "Count: $i"
done

# Range with step
for i in {0..20..5}; do
    echo "Step: $i"     # 0, 5, 10, 15, 20
done

# C-style for loop
for ((i=1; i<=5; i++)); do
    echo "Iteration: $i"
done

# Loop through files
for file in /var/log/*.log; do
    echo "Log file: $file"
done

# Loop through array
SERVERS=("web-01" "web-02" "db-01")
for server in "${SERVERS[@]}"; do
    echo "Checking $server..."
    ping -c 1 "$server" &>/dev/null && echo "✅ $server is UP" || echo "❌ $server is DOWN"
done
```

### While Loop

```bash
#!/bin/bash

# Basic while loop
COUNT=1
while [ $COUNT -le 5 ]; do
    echo "Count: $COUNT"
    ((COUNT++))
done

# Read file line by line
while IFS= read -r line; do
    echo "Line: $line"
done < "/etc/hosts"

# Infinite loop (monitoring)
while true; do
    echo "$(date): System check..."
    sleep 60
done
```

### Until Loop

```bash
#!/bin/bash

# Wait until service is running
until systemctl is-active --quiet nginx; do
    echo "Waiting for Nginx to start..."
    sleep 2
done
echo "✅ Nginx is now running!"
```

### Loop Control

```bash
# break - exit loop
for i in {1..10}; do
    if [ $i -eq 5 ]; then
        break           # Stop at 5
    fi
    echo "$i"
done

# continue - skip iteration
for i in {1..10}; do
    if [ $((i % 2)) -eq 0 ]; then
        continue        # Skip even numbers
    fi
    echo "$i"           # Print odd numbers only
done
```

---

## 🔧 Functions

```bash
#!/bin/bash

# Basic function
greet() {
    echo "Hello, $1! Welcome to DevOps."
}
greet "Shahe"

# Function with return value
check_disk() {
    local usage=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')
    if [ "$usage" -gt 80 ]; then
        return 1        # Error (high usage)
    else
        return 0        # Success (normal)
    fi
}

check_disk
if [ $? -eq 0 ]; then
    echo "✅ Disk is healthy"
else
    echo "⚠️ Disk usage is high!"
fi

# Function with output capture
get_ip() {
    hostname -I | awk '{print $1}'
}
MY_IP=$(get_ip)
echo "Server IP: $MY_IP"

# Function with multiple arguments
deploy_app() {
    local app_name=$1
    local environment=$2
    local port=$3

    echo "🚀 Deploying $app_name to $environment on port $port"
}
deploy_app "MyApp" "production" "3000"
```

---

## 📥 User Input

```bash
#!/bin/bash

# Read input
echo "Enter your name:"
read NAME
echo "Hello, $NAME!"

# Read with prompt (on same line)
read -p "Enter your age: " AGE
echo "You are $AGE years old"

# Read password (hidden input)
read -sp "Enter password: " PASSWORD
echo ""
echo "Password accepted"

# Read with timeout
read -t 10 -p "Enter value within 10 seconds: " VALUE

# Read with default value
read -p "Enter environment [dev]: " ENV
ENV=${ENV:-dev}     # Default to "dev" if empty
echo "Environment: $ENV"
```

---

## 📝 String Operations

```bash
#!/bin/bash

STR="Hello, DevOps World!"

# Length
echo ${#STR}                    # 20

# Substring
echo ${STR:7:6}                 # DevOps (start:length)

# Replace
echo ${STR/DevOps/CloudOps}     # Hello, CloudOps World!
echo ${STR//o/0}                # Replace all 'o' with '0'

# Remove prefix
FILE="document.tar.gz"
echo ${FILE#*.}                 # tar.gz (shortest match)
echo ${FILE##*.}                # gz (longest match)

# Remove suffix
echo ${FILE%.*}                 # document.tar (shortest match)
echo ${FILE%%.*}                # document (longest match)

# Uppercase/Lowercase
echo ${STR^^}                   # HELLO, DEVOPS WORLD!
echo ${STR,,}                   # hello, devops world!

# Default value
echo ${UNDEFINED_VAR:-"default"} # "default" if not set
```

---

## 🔄 Exit Codes & Error Handling

```bash
#!/bin/bash

# Exit codes
# 0 = success
# 1-255 = error

# Custom exit code
exit 0          # Success
exit 1          # General error

# Check last command's exit code
ls /tmp
echo $?         # 0 (success)

ls /nonexistent
echo $?         # 2 (error)

# Error handling with set
set -e          # Exit on any error
set -u          # Exit on undefined variable
set -o pipefail # Exit on pipe failure
set -euo pipefail  # All three (recommended)

# Trap errors
trap 'echo "Error on line $LINENO"; exit 1' ERR

# Clean up on exit
cleanup() {
    echo "Cleaning up temporary files..."
    rm -f /tmp/myapp_*
}
trap cleanup EXIT
```

---

## 🛠️ Real-World Script Examples

### 1. System Health Monitor

```bash
#!/bin/bash
# System Health Monitoring Script

echo "============================================"
echo "   🖥️  SYSTEM HEALTH REPORT"
echo "   📅 $(date '+%Y-%m-%d %H:%M:%S')"
echo "============================================"
echo ""

# Hostname & OS
echo "🏷️  Hostname: $(hostname)"
echo "🐧 OS: $(cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2 | tr -d '"')"
echo ""

# Uptime
echo "⏱️  Uptime: $(uptime -p)"
echo ""

# CPU Usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}')
echo "🔥 CPU Usage: ${CPU_USAGE}%"

# Memory Usage
echo "💾 Memory Usage:"
free -h | awk 'NR==2{printf "   Total: %s | Used: %s | Free: %s | Usage: %.1f%%\n", $2, $3, $4, $3/$2*100}'

# Disk Usage
echo "💿 Disk Usage:"
df -h / | awk 'NR==2{printf "   Total: %s | Used: %s | Free: %s | Usage: %s\n", $2, $3, $4, $5}'

# Top 5 Processes
echo ""
echo "📊 Top 5 CPU-consuming Processes:"
ps aux --sort=-%cpu | head -6 | awk '{printf "   %-10s %5s%% CPU  %5s%% MEM  %s\n", $1, $3, $4, $11}'

# Network
echo ""
echo "🌐 Network:"
echo "   IP Address: $(hostname -I | awk '{print $1}')"

# Services Check
echo ""
echo "🔍 Service Status:"
for service in nginx docker ssh; do
    if systemctl is-active --quiet $service 2>/dev/null; then
        echo "   ✅ $service: Running"
    else
        echo "   ❌ $service: Not Running"
    fi
done

echo ""
echo "============================================"
echo "   Report generated successfully! ✅"
echo "============================================"
```

### 2. Backup Script

```bash
#!/bin/bash
# Automated Backup Script

set -euo pipefail

# Configuration
BACKUP_DIR="/backup"
SOURCE_DIR="/var/www/html"
DB_NAME="myapp_db"
DATE=$(date '+%Y%m%d_%H%M%S')
BACKUP_FILE="${BACKUP_DIR}/backup_${DATE}.tar.gz"
RETAIN_DAYS=7

# Create backup directory
mkdir -p "$BACKUP_DIR"

echo "🔄 Starting backup..."

# Backup files
echo "📁 Backing up files from $SOURCE_DIR..."
tar -czf "$BACKUP_FILE" -C "$(dirname $SOURCE_DIR)" "$(basename $SOURCE_DIR)"

# Backup database (if MySQL)
echo "💾 Backing up database..."
# mysqldump -u root -p"$DB_PASSWORD" "$DB_NAME" > "${BACKUP_DIR}/db_${DATE}.sql"

# Check backup size
BACKUP_SIZE=$(du -sh "$BACKUP_FILE" | awk '{print $1}')
echo "✅ Backup completed: $BACKUP_FILE ($BACKUP_SIZE)"

# Remove old backups
echo "🗑️  Removing backups older than $RETAIN_DAYS days..."
find "$BACKUP_DIR" -name "backup_*.tar.gz" -mtime +$RETAIN_DAYS -delete

echo "✅ Backup process completed!"
```

### 3. Deploy Script

```bash
#!/bin/bash
# Simple Deployment Script

set -euo pipefail

APP_DIR="/var/www/myapp"
REPO_URL="https://github.com/user/myapp.git"
BRANCH="${1:-main}"

echo "🚀 Deploying branch: $BRANCH"

# Pull latest code
if [ -d "$APP_DIR" ]; then
    cd "$APP_DIR"
    git fetch origin
    git checkout "$BRANCH"
    git pull origin "$BRANCH"
else
    git clone -b "$BRANCH" "$REPO_URL" "$APP_DIR"
    cd "$APP_DIR"
fi

# Install dependencies
echo "📦 Installing dependencies..."
npm install --production

# Restart application
echo "🔄 Restarting application..."
pm2 restart myapp || pm2 start app.js --name myapp

echo "✅ Deployment completed successfully!"
echo "🌐 App is running at http://localhost:3000"
```

---

## 🔧 Useful Bash One-Liners

```bash
# Find largest files
find / -type f -exec du -sh {} + 2>/dev/null | sort -rh | head -10

# Count lines in all files
find . -name "*.js" | xargs wc -l | tail -1

# Watch a command (refresh every 2 seconds)
watch -n 2 "docker ps"

# Kill process on specific port
kill $(lsof -t -i:3000)

# Check if port is in use
ss -tulnp | grep :3000

# Find and replace in multiple files
find . -name "*.txt" -exec sed -i 's/old/new/g' {} +

# Monitor log file in real-time
tail -f /var/log/nginx/access.log | grep "ERROR"

# Disk usage summary sorted
du -sh /* 2>/dev/null | sort -rh

# Get public IP
curl -s ifconfig.me

# List all open connections
ss -s
```

---

## ⚡ Quick Reference Cheat Sheet

| Concept | Syntax |
|---------|--------|
| Variable | `VAR="value"` |
| Print | `echo "$VAR"` |
| Read input | `read -p "Prompt: " VAR` |
| If statement | `if [ condition ]; then ... fi` |
| For loop | `for i in {1..5}; do ... done` |
| While loop | `while [ condition ]; do ... done` |
| Function | `func_name() { ... }` |
| Arguments | `$1, $2, $#, $@` |
| Exit code | `$?` (0=success) |
| Command sub | `$(command)` |
| Redirect | `> overwrite`, `>> append` |
| Pipe | `cmd1 \| cmd2` |
| Background | `command &` |
| String length | `${#VAR}` |
| Default value | `${VAR:-default}` |

---

## 🎯 Interview Questions & Answers

### Q1: What is the Shebang line?
**A:** The shebang (`#!/bin/bash`) is the first line of a script that specifies the interpreter to use. `#!` tells the OS this is a script, and `/bin/bash` is the path to the Bash interpreter. The portable version `#!/usr/bin/env bash` finds bash anywhere in the PATH.

### Q2: What is the difference between `$@` and `$*`?
**A:**
- `$@` treats each argument as a **separate quoted string**: `"arg1" "arg2" "arg3"`
- `$*` treats all arguments as a **single string**: `"arg1 arg2 arg3"`
In a for loop, `$@` preserves argument boundaries, making it the preferred choice.

### Q3: What is the difference between `[ ]` and `[[ ]]`?
**A:**
- `[ ]` (test) is POSIX-compliant, works in all shells
- `[[ ]]` is a Bash-specific extension with additional features: regex matching (`=~`), pattern matching, no word splitting, safer with empty variables
Best practice: Use `[[ ]]` in Bash scripts for better safety.

### Q4: How do you handle errors in Bash?
**A:**
```bash
set -e           # Exit on any error
set -u           # Exit on undefined variables
set -o pipefail  # Exit on pipe failures
trap 'echo "Error at line $LINENO"' ERR  # Trap errors
```
Together: `set -euo pipefail` at the top of every production script.

### Q5: What is the difference between `'single'` and `"double"` quotes?
**A:**
- **Single quotes** `'...'`: Everything is literal. No variable expansion. `'$NAME'` prints literally `$NAME`.
- **Double quotes** `"..."`: Variables and command substitution are expanded. `"$NAME"` prints the value of NAME.
- **Backticks** `` `...` ``: Command substitution (legacy). Use `$(...)` instead.

### Q6: What is `set -e` and why is it important?
**A:** `set -e` causes the script to immediately exit if any command returns a non-zero exit code (error). Without it, scripts continue running even after errors, which can lead to cascading failures. It's essential for reliable production scripts.

### Q7: How do you debug a Bash script?
**A:**
```bash
bash -x script.sh    # Print every command before executing (trace mode)
set -x               # Enable debug mode within script
set +x               # Disable debug mode
bash -n script.sh    # Check syntax without running
```

### Q8: What is `crontab`?
**A:** Crontab is the cron table — a file that stores scheduled tasks. Each line defines a schedule (minute, hour, day, month, weekday) and a command. `crontab -e` edits it, `crontab -l` lists jobs. Example: `0 2 * * * /backup.sh` runs backup daily at 2 AM.

### Q9: What is the difference between `source` and `./`?
**A:**
- `./script.sh`: Runs script in a **new subprocess**. Variables set in the script don't affect the current shell.
- `source script.sh` or `. script.sh`: Runs script in the **current shell**. Variables and functions persist in the current session.

### Q10: What are exit codes?
**A:** Exit codes (0-255) indicate command success or failure:
- `0` = Success
- `1` = General error
- `2` = Misuse of command
- `126` = Permission denied (not executable)
- `127` = Command not found
- `130` = Ctrl+C (SIGINT)
Check with `$?` after any command.

### Q11: What is `trap` in Bash?
**A:** `trap` catches signals and executes cleanup code. Commonly used for:
```bash
trap cleanup EXIT    # Run cleanup function when script exits
trap 'echo "Ctrl+C pressed"' SIGINT  # Handle interrupts
trap 'echo "Error at $LINENO"' ERR   # Handle errors
```

### Q12: How do you read a file line by line?
**A:**
```bash
while IFS= read -r line; do
    echo "$line"
done < filename.txt
```
`IFS=` prevents trimming whitespace, `-r` prevents backslash interpretation.

### Q13: What is command substitution?
**A:** Command substitution captures the output of a command into a variable:
```bash
# Modern syntax (preferred)
result=$(ls -la)
# Legacy syntax (backticks)
result=`ls -la`
```

### Q14: What is the difference between `>` and `>>`?
**A:**
- `>` **overwrites** the file with new content
- `>>` **appends** new content to the end of the file
```bash
echo "first" > file.txt    # file.txt contains "first"
echo "second" >> file.txt  # file.txt contains "first\nsecond"
```

### Q15: How do you pass and use arguments in a function?
**A:**
```bash
greet() {
    local name=$1
    local role=$2
    echo "Hello $name, you are a $role"
}
greet "Shahe" "DevOps Engineer"
```
`local` limits variable scope to the function. Arguments accessed via `$1`, `$2`, etc.

### Q16: What is an infinite loop and when would you use it?
**A:**
```bash
while true; do
    # Monitoring or daemon behavior
    check_system_health
    sleep 60
done
```
Used for: continuous monitoring, daemon processes, service health checks, watching for file changes.

### Q17: What is `awk` and give an example?
**A:** `awk` is a powerful text processing tool that works on columns:
```bash
# Print specific column
ps aux | awk '{print $1, $3, $11}'  # user, CPU%, command

# Filter rows
df -h | awk '$5 > 80 {print $1, $5}'  # Disks over 80% full

# Sum a column
cat numbers.txt | awk '{sum += $1} END {print sum}'
```

### Q18: What is `sed` and give an example?
**A:** `sed` (Stream Editor) modifies text in a file or stream:
```bash
# Replace text
sed 's/old/new/g' file.txt          # Replace all occurrences
sed -i 's/old/new/g' file.txt       # In-place edit
sed '3d' file.txt                    # Delete line 3
sed -n '5,10p' file.txt              # Print lines 5-10
```

---

## 💡 Bash Best Practices

```
✅ Always use #!/bin/bash (or #!/usr/bin/env bash) shebang
✅ Use set -euo pipefail for error handling
✅ Quote all variables: "$VAR" not $VAR
✅ Use local variables in functions
✅ Add comments explaining "why" not "what"
✅ Use meaningful variable names (UPPERCASE for constants)
✅ Test scripts with bash -n (syntax check)
✅ Debug with bash -x (trace mode)
✅ Use functions for reusable code
✅ Always handle errors and edge cases
```

---

> 🚀 *"The best DevOps engineers automate everything — and Bash is their first language."*