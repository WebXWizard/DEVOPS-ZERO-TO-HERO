# Complete Linux & Shell Scripting Guide for DevOps

## Table of Contents
1. [Introduction](#introduction)
2. [Basic Linux Commands](#basic-linux-commands)
3. [Shell Scripting Fundamentals](#shell-scripting-fundamentals)
4. [Advanced Shell Scripting](#advanced-shell-scripting)
5. [DevOps-Specific Scripts](#devops-specific-scripts)
6. [Best Practices and Templates](#best-practices-and-templates)
7. [Quick Reference](#quick-reference)

---

## Introduction

This comprehensive guide covers everything you need to know about Linux and Shell Scripting for DevOps. It includes practical examples, production-ready scripts, and best practices used in modern DevOps environments.

### Why Linux for DevOps?
- **90% of cloud infrastructure** runs on Linux
- **Container platforms** (Docker, Kubernetes) run on Linux
- **CI/CD servers** predominantly use Linux
- **Server environments** are mostly Linux-based
- **Scripting and automation** is most efficient on Linux

---

## Basic Linux Commands

### Navigation and File Operations

```bash
# Basic Navigation
pwd                    # Print working directory
ls -la                 # List all files with details (permissions, owner, size, date)
cd /path/to/directory  # Change directory
cd ..                  # Go up one level
cd ~                   # Go to home directory
cd -                   # Go to previous directory

# File and Directory Management
mkdir -p project/{src,docs,tests}    # Create nested directories
mkdir -p /path/{dir1,dir2,dir3}      # Create multiple directories at once
touch file.txt                        # Create empty file
cp -r source/ dest/                   # Copy directory recursively
cp file1.txt file2.txt backup.txt     # Copy multiple files
mv old-name.txt new-name.txt          # Rename/move file
mv *.log /backup/                     # Move all log files
rm -rf directory/                     # Remove directory and contents
rm file.txt                           # Remove file
rm -i *.txt                          # Interactive remove (prompt before delete)

# File Viewing and Editing
cat file.txt                          # Display entire file
cat file1.txt file2.txt               # Concatenate and display files
cat > newfile.txt << EOF              # Create file with content
This is line 1
This is line 2
EOF

less file.txt                         # View file with pagination (q to quit)
more file.txt                         # View file page by page
head -n 20 file.txt                   # First 20 lines
tail -n 50 file.txt                   # Last 50 lines
tail -f /var/log/app.log              # Follow log file in real-time
grep -r "error" /var/log/             # Search recursively in directory
grep -i "ERROR" logfile.log           # Case-insensitive search
grep -n "pattern" file.txt            # Show line numbers
grep -A 5 -B 5 "error" file.txt       # Show context (5 lines before and after)

# Find and Search
find /path -name "*.txt"              # Find files by name
find /path -type f -size +100M        # Find files larger than 100MB
find /path -mtime -7                  # Find files modified in last 7 days
find /path -user username             # Find files owned by user
locate filename                       # Find file by database (updatedb first)


# ----------------------------------------------------------------------------------

# Linux and Shell Scripting Essentials

A practical guide to mastering Linux commands and shell scripting. This repository provides curated resources, practical examples, and a comprehensive cheat sheet to accelerate your Linux journey.

## 📖 Table of Contents

- [Quick Start Guide](#quick-start-guide)
- [Core Linux Concepts](#core-linux-concepts)
- [Shell Scripting Basics](#shell-scripting-basics)
- [Essential Command Cheat Sheet](#essential-command-cheat-sheet)
- [Sample Scripts](#sample-scripts)
- [Learning Resources](#learning-resources)
- [Contributing](#contributing)
- [License](#license)

## Quick Start Guide

This section provides the essential knowledge needed to get started with Linux and shell scripting. It covers everything from basic file system navigation to writing your first automated script.

### Core Linux Concepts

1. **Filesystem Structure**
   - Understanding the Linux directory hierarchy (`/`, `/bin`, `/usr`, `/etc`, etc.)
   - Navigation and file operations

2. **Permissions & Ownership**
   - File permissions (`rwx` bits)
   - Changing permissions with `chmod` and ownership with `chown`

3. **User Management**
   - Creating and managing users and groups
   - Using `sudo` and privilege escalation

4. **Process Management**
   - Viewing and controlling running processes
   - Understanding PID and background jobs

5. **Package Management**
   - Installing software using `apt`, `yum`, `pacman`, etc.

### Shell Scripting Basics

1. **Essential Syntax**
   - Shebangs, variables, quoting
   - Control structures (if/then, loops, functions)

2. **Advanced Topics**
   - Error handling and debugging
   - Redirection and piping
   - Arrays and associative arrays

## Essential Command Cheat Sheet

### Core Utilities
| Command | Description | Example |
|---------|-------------|---------|
| `ls` | List files and directories | `ls -la` |
| `cd` | Change directory | `cd /var/log` |
| `pwd` | Print current directory | `pwd` |
| `mkdir` | Create directories | `mkdir -p newdir/subdir` |
| `rm` | Remove files/directories | `rm -rf olddir` |
| `cp` | Copy files/directories | `cp file.txt backup/` |
| `mv` | Move/rename files | `mv oldname.txt newname.txt` |
| `chmod` | Change permissions | `chmod +x script.sh` |
| `grep` | Search text | `grep -R "pattern" .` |

### Process Management
| Command | Description | Example |
|---------|-------------|---------|
| `ps` | List processes | `ps aux` |
| `top` | Monitor processes | `top` |
| `kill` | Terminate processes | `kill -9 1234` |
| `jobs` | List background jobs | `jobs` |

### Network & System Info
| Command | Description | Example |
|---------|-------------|---------|
| `ip` | Network interface info | `ip a` |
| `ping` | Test connectivity | `ping google.com` |
| `curl` | Transfer data | `curl -I https://example.com` |
| `uname` | System information | `uname -a` |
| `df` | Disk space | `df -h` |

## Sample Scripts

### Example 1: System Monitor Script
```bash
#!/usr/bin/env bash
# system_monitor.sh - Checks system resources and alerts on thresholds

# Configuration
THRESHOLD_CPU=80
THRESHOLD_DISK=90

# Check CPU usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | awk -F'%' '{print $1}')
if (( $(echo "$CPU_USAGE > $THRESHOLD_CPU" | bc -l) )); then
    echo "WARNING: CPU usage is at ${CPU_USAGE}%"
fi

# Check disk usage
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | awk -F'%' '{print $1}')
if [ "$DISK_USAGE" -gt "$THRESHOLD_DISK" ]; then
    echo "WARNING: Disk usage is at ${DISK_USAGE}%"
fi
