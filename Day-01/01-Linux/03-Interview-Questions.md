# Linux Interview Questions and Answers

## Beginner Level

### Q1: What is Linux?
**Answer:** Linux is an open-source operating system based on Unix. It consists of the Linux kernel (core) and various distributions (distros) like Ubuntu, CentOS, Debian. It's widely used in servers, cloud computing, and DevOps because it's stable, secure, free, and highly customizable.

### Q2: What is the difference between Linux and Unix?
**Answer:**
- **Unix**: Proprietary, commercial OS (e.g., Solaris, AIX)
- **Linux**: Open-source, free OS based on Unix principles
- **Linux** is more accessible, has better community support, and runs on diverse hardware

### Q3: Explain the Linux file system hierarchy
**Answer:**
```
/       - Root directory
/home   - User home directories
/root   - Root user's home
/etc    - Configuration files
/var    - Variable data (logs, databases)
/bin    - Essential command binaries
/sbin   - System administration binaries
/usr    - User programs
/tmp    - Temporary files
/opt    - Optional software packages
```

### Q4: What is the difference between absolute and relative paths?
**Answer:**
- **Absolute path**: Full path from root directory (e.g., `/home/user/documents/file.txt`)
- **Relative path**: Path from current directory (e.g., `../documents/file.txt`)

### Q5: What does chmod 755 mean?
**Answer:**
- `7` (owner): read(4) + write(2) + execute(1) = rwx
- `5` (group): read(4) + execute(1) = r-x
- `5` (others): read(4) + execute(1) = r-x
- Result: `rwxr-xr-x` - Owner has full access, others can read and execute

### Q6: What is the purpose of the sudo command?
**Answer:** `sudo` (Super User DO) allows a permitted user to execute a command as the superuser or another user. It provides temporary elevated privileges without logging in as root, improving security and accountability.

### Q7: Difference between hard link and soft link?
**Answer:**
- **Hard Link**: Direct reference to file data on disk. If original is deleted, data remains accessible
  ```bash
  ln original.txt hardlink.txt
  ```
- **Soft Link (Symbolic Link)**: Pointer to the file name. If original is deleted, link breaks
  ```bash
  ln -s original.txt softlink.txt
  ```

### Q8: What is a daemon in Linux?
**Answer:** A daemon is a background process that runs continuously without direct user interaction. Examples: `sshd` (SSH server), `httpd` (Apache web server), `cron` (task scheduler). They usually end with 'd' suffix.

### Q9: How do you check disk usage?
**Answer:**
```bash
df -h          # Disk free space (human-readable)
du -sh dir/    # Directory size
du -h --max-depth=1  # Size of subdirectories
```

### Q10: What is the difference between `ps` and `top`?
**Answer:**
- **ps**: Static snapshot of current processes
- **top**: Real-time, interactive process monitoring with CPU/memory usage updates

## Intermediate Level

### Q11: How do you find and kill a hanging process?
**Answer:**
```bash
# Method 1: Find and kill
ps aux | grep process_name
kill -9 PID

# Method 2: Using pkill
pkill -9 process_name

# Method 3: Using killall
killall -9 process_name
```

### Q12: Explain different run levels in Linux
**Answer:**
```
0 - Halt (shutdown)
1 - Single-user mode (maintenance)
2 - Multi-user mode without networking
3 - Multi-user mode with networking (command-line)
4 - Undefined (custom)
5 - Multi-user mode with GUI
6 - Reboot
```
*Modern systems use systemd targets instead of runlevels*

### Q13: What is a zombie process?
**Answer:** A zombie process is a process that has completed execution but still has an entry in the process table. This occurs when the parent process hasn't read the child's exit status. They consume minimal resources but indicate poor process management.

### Q14: How do you check which ports are listening?
**Answer:**
```bash
# Modern way
ss -tuln

# Traditional way
netstat -tuln

# With process information
ss -tulnp
```

### Q15: Explain stdin, stdout, and stderr
**Answer:**
- **stdin (0)**: Standard input - data fed into the program
- **stdout (1)**: Standard output - normal program output
- **stderr (2)**: Standard error - error messages

**Example:**
```bash
command > output.txt 2> error.log    # Separate outputs
command > all.log 2>&1               # Combine both
```

### Q16: What is the purpose of /etc/fstab?
**Answer:** `/etc/fstab` (File Systems Table) contains information about file systems and their mount points. It's used to automatically mount file systems at boot time.

### Q17: How do you make a script executable?
**Answer:**
```bash
chmod +x script.sh
# or
chmod 755 script.sh
```
Then add shebang at the top: `#!/bin/bash`

### Q18: What is the difference between TCP and UDP?
**Answer:**
- **TCP (Transmission Control Protocol)**:
  - Connection-oriented
  - Reliable delivery (acknowledgments)
  - Slower but ensures data integrity
  - Used for: HTTP, HTTPS, SSH, FTP

- **UDP (User Datagram Protocol)**:
  - Connectionless
  - No delivery guarantee
  - Faster but less reliable
  - Used for: DNS, DHCP, streaming, gaming

### Q19: How do you monitor system logs in real-time?
**Answer:**
```bash
tail -f /var/log/syslog
# or with filtering
tail -f /var/log/syslog | grep ERROR
```

### Q20: What is swap space?
**Answer:** Swap is disk space used as virtual memory when RAM is full. The system moves inactive pages from RAM to swap, freeing RAM for active processes. However, it's much slower than actual RAM.

## Advanced Level

### Q21: How do you troubleshoot high CPU usage?
**Answer:**
```bash
# 1. Identify top processes
top
# or
htop

# 2. Find specific high-CPU processes
ps aux --sort=-%cpu | head -10

# 3. Check process details
ps -p PID -f

# 4. Check system load
uptime
cat /proc/loadavg

# 5. Analyze with sar (if sysstat installed)
sar -u 1 10
```

### Q22: How do you recover a forgotten root password?
**Answer:**
1. Reboot and enter GRUB menu
2. Edit boot parameters, add `init=/bin/bash` or `single`
3. Mount filesystem as read-write: `mount -o remount,rw /`
4. Change password: `passwd root`
5. Sync and reboot: `sync; reboot -f`

### Q23: Explain inode and how to check inode usage
**Answer:** An inode is a data structure that stores metadata about a file (permissions, ownership, timestamps, location on disk). Each file has one inode.

```bash
# Check inode usage
df -i

# Find inode number
ls -i file.txt

# Find file by inode
find / -inum INODE_NUMBER
```

### Q24: What is umask and how does it work?
**Answer:** umask sets default permissions for newly created files and directories by subtracting from the maximum permissions.

```bash
# Default umask (usually 022)
umask

# Maximum permissions:
# Files: 666 (rw-rw-rw-)
# Directories: 777 (rwxrwxrwx)

# With umask 022:
# Files: 666 - 022 = 644 (rw-r--r--)
# Directories: 777 - 022 = 755 (rwxr-xr-x)

# Set custom umask
umask 027  # Results in 640 for files, 750 for directories
```

### Q25: How do you find files modified in the last 24 hours?
**Answer:**
```bash
# Last 24 hours
find /path -type f -mtime -1

# Last 7 days
find /path -type f -mtime -7

# Last 1 hour
find /path -type f -mmin -60

# Between 2 and 5 days ago
find /path -type f -mtime +2 -mtime -5
```

### Q26: Explain the difference between /etc/passwd and /etc/shadow
**Answer:**
- **/etc/passwd**: Contains user account information (username, UID, GID, home directory, shell). World-readable.
- **/etc/shadow**: Contains encrypted passwords and password policies. Only readable by root for security.

### Q27: How do you configure a static IP address?
**Answer:**
**Ubuntu (Netplan):**
```yaml
# /etc/netplan/01-netcfg.yaml
network:
  version: 2
  ethernets:
    eth0:
      addresses: [192.168.1.100/24]
      gateway4: 192.168.1.1
      nameservers:
        addresses: [8.8.8.8, 8.8.4.4]
```
Then: `netplan apply`

**RHEL/CentOS:**
```bash
# /etc/sysconfig/network-scripts/ifcfg-eth0
BOOTPROTO=static
IPADDR=192.168.1.100
NETMASK=255.255.255.0
GATEWAY=192.168.1.1
DNS1=8.8.8.8
```

### Q28: What is SELinux and how do you check its status?
**Answer:** SELinux (Security-Enhanced Linux) is a security architecture that provides mandatory access control (MAC). It enforces security policies to limit program capabilities.

```bash
# Check status
sestatus
getenforce

# Modes:
# - Enforcing: Policy is enforced
# - Permissive: Violations logged but not enforced
# - Disabled: SELinux is off

# Change mode (temporary)
setenforce 0  # Permissive
setenforce 1  # Enforcing
```

### Q29: How do you check system resource usage over time?
**Answer:**
```bash
# Install sysstat
apt install sysstat  # Ubuntu
yum install sysstat  # RHEL

# CPU usage
sar -u 1 5

# Memory usage
sar -r 1 5

# Disk I/O
sar -b 1 5

# Network
sar -n DEV 1 5

# Historical data
sar -f /var/log/sa/sa01
```

### Q30: Explain the boot process in Linux
**Answer:**
1. **BIOS/UEFI**: Hardware initialization, POST (Power-On Self-Test)
2. **Bootloader (GRUB)**: Loads kernel into memory
3. **Kernel**: Initializes hardware, mounts root filesystem
4. **Init/Systemd**: First process (PID 1), starts services
5. **Runlevel/Target**: Brings system to desired state
6. **Login**: User login prompt

## DevOps-Specific Questions

### Q31: How would you automate a task to run daily at 2 AM?
**Answer:**
```bash
# Edit crontab
crontab -e

# Add entry
0 2 * * * /path/to/script.sh

# Cron format:
# Minute Hour Day Month DayOfWeek Command
# 0 2 * * * = 2:00 AM daily
```

### Q32: How do you monitor log files for specific errors and send alerts?
**Answer:**
```bash
#!/bin/bash
# Monitor and alert script

tail -f /var/log/syslog | while read line; do
  if echo "$line" | grep -i "error\|critical\|failed"; then
    echo "$line" | mail -s "Error Alert" admin@example.com
  fi
done
```

### Q33: How would you find the top 10 largest files in a directory?
**Answer:**
```bash
# Method 1
find /path -type f -exec du -h {} + | sort -rh | head -10

# Method 2
du -ah /path | sort -rh | head -10

# Method 3 (faster for large directories)
find /path -type f -printf '%s %p\n' | sort -rn | head -10
```

### Q34: How do you secure SSH access?
**Answer:**
1. Disable root login: `PermitRootLogin no` in `/etc/ssh/sshd_config`
2. Use SSH keys instead of passwords: `PubkeyAuthentication yes`
3. Change default port: `Port 2222`
4. Disable password authentication: `PasswordAuthentication no`
5. Use fail2ban to block brute force attempts
6. Limit user access: `AllowUsers user1 user2`
7. Use firewall rules to restrict access

### Q35: How would you check if a port is open on a remote server?
**Answer:**
```bash
# Using telnet
telnet server_ip port

# Using nc (netcat)
nc -zv server_ip port

# Using nmap
nmap -p port server_ip

# Using curl (for HTTP/HTTPS)
curl -v telnet://server_ip:port
```

## Scenario-Based Questions

### Q36: A server is running out of disk space. How do you troubleshoot?
**Answer:**
```bash
# 1. Check overall disk usage
df -h

# 2. Find largest directories
du -sh /* | sort -rh | head -10

# 3. Find large files
find / -type f -size +100M -exec ls -lh {} \;

# 4. Check for deleted files still held by processes
lsof | grep deleted

# 5. Clean up:
# - Old logs: find /var/log -name "*.log" -mtime +30 -delete
# - Package cache: apt clean (Ubuntu) or yum clean all (RHEL)
# - Temp files: rm -rf /tmp/*
# - Docker: docker system prune -a
```

### Q37: A web service is slow. How do you investigate?
**Answer:**
```bash
# 1. Check CPU and memory
top
free -h

# 2. Check disk I/O
iostat -x 1 5

# 3. Check network
netstat -i
iftop

# 4. Check service logs
journalctl -u service_name -f

# 5. Check service status
systemctl status service_name

# 6. Check listening ports
ss -tulnp | grep :80

# 7. Test response time
time curl http://localhost
```

## Quick Tip Answers

### Q38: How do you create a backup script?
**Answer:**
```bash
#!/bin/bash
DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_DIR="/backup"
SOURCE="/var/www"

mkdir -p $BACKUP_DIR
tar -czf $BACKUP_DIR/backup_$DATE.tar.gz $SOURCE

# Keep only last 7 days
find $BACKUP_DIR -name "backup_*.tar.gz" -mtime +7 -delete
```

### Q39: How do you check which user is logged in?
**Answer:**
```bash
who       # Currently logged in users
w         # Who is doing what
last      # Login history
lastlog   # Last login for all users
```

### Q40: What command would you use to monitor network traffic?
**Answer:**
```bash
iftop          # Real-time bandwidth usage
nethogs        # Per-process network usage
tcpdump        # Packet capture
wireshark      # GUI packet analyzer
vnstat         # Network statistics
```

## Practice Tips

1. **Set up a VM** or use cloud instances to practice
2. **Simulate problems** (fill up disk, create high CPU load)
3. **Practice troubleshooting** under time pressure
4. **Understand the 'why'** behind each command
5. **Create cheat sheets** for quick reference
6. **Join DevOps communities** for real-world scenarios
