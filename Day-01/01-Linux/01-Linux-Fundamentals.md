# Linux Fundamentals for DevOps

## What is Linux?
Linux is an open-source operating system kernel that forms the foundation of many operating systems. It's crucial for DevOps because:
- Most servers run on Linux
- Lightweight and highly customizable
- Strong security and stability
- Free and open-source

## Linux File System Hierarchy

```
/           Root directory (top of filesystem)
├── /home   User home directories
├── /root   Root user's home
├── /bin    Essential user binaries
├── /sbin   System binaries
├── /etc    Configuration files
├── /var    Variable data (logs, databases)
├── /tmp    Temporary files
├── /usr    User programs and data
├── /opt    Optional software
└── /proc   Process information
```

## Essential Concepts

### 1. Users and Permissions
- **Root User**: Superuser with all privileges (UID 0)
- **Regular Users**: Limited privileges (UID >= 1000)
- **Groups**: Collections of users with shared permissions

### 2. File Permissions
```bash
-rwxrw-r--
│││││││││└─ Others: read
││││││││└── Others: write (-)
│││││││└─── Others: execute (-)
││││││└──── Group: read
│││││└───── Group: write
││││└────── Group: execute (-)
│││└─────── Owner: read
││└──────── Owner: write
│└───────── Owner: execute
└────────── File type (- = file, d = directory)
```

**Permission Values:**
- `r` (read) = 4
- `w` (write) = 2
- `x` (execute) = 1

**Examples:**
- `755` = rwxr-xr-x (owner full, others read+execute)
- `644` = rw-r--r-- (owner read+write, others read only)
- `777` = rwxrwxrwx (full permissions for all)

### 3. Processes
- **PID**: Process ID (unique identifier)
- **Parent Process**: Process that spawned the current process
- **Daemon**: Background process (e.g., httpd, sshd)
- **Foreground vs Background**: User interaction vs autonomous

### 4. Shell
- **Bash**: Bourne Again Shell (most common)
- **Zsh**: Z Shell (feature-rich alternative)
- **sh**: Original Unix shell

## Package Management

### APT (Debian/Ubuntu)
```bash
apt update              # Update package list
apt upgrade             # Upgrade packages
apt install package     # Install package
apt remove package      # Remove package
apt search package      # Search for package
```

### YUM/DNF (RHEL/CentOS/Fedora)
```bash
yum update              # Update packages
yum install package     # Install package
yum remove package      # Remove package
yum search package      # Search for package
```

## Network Concepts

### IP Addressing
- **IPv4**: 192.168.1.1 (32-bit)
- **IPv6**: 2001:0db8:85a3::8a2e:0370:7334 (128-bit)
- **Localhost**: 127.0.0.1 or ::1

### Common Ports
- **22**: SSH
- **80**: HTTP
- **443**: HTTPS
- **3306**: MySQL
- **5432**: PostgreSQL
- **8080**: Alternative HTTP

### Network Types
- **LAN**: Local Area Network
- **WAN**: Wide Area Network
- **VPN**: Virtual Private Network

## System Monitoring

### Key Metrics
1. **CPU Usage**: Percentage of CPU being used
2. **Memory Usage**: RAM consumption
3. **Disk Usage**: Storage space used
4. **Network Traffic**: Data in/out
5. **Load Average**: System load over time (1, 5, 15 minutes)

### Log Files
```
/var/log/syslog         # System logs
/var/log/auth.log       # Authentication logs
/var/log/kern.log       # Kernel logs
/var/log/apache2/       # Apache logs
/var/log/nginx/         # Nginx logs
```

## Text Processing

### Regular Expressions (Regex)
```bash
^           # Start of line
$           # End of line
.           # Any single character
*           # Zero or more of previous
+           # One or more of previous
?           # Zero or one of previous
[abc]       # Any character in brackets
[^abc]      # Any character NOT in brackets
\d          # Any digit
\w          # Any word character
|           # OR operator
```

## Interview Focus Areas

1. **File System Navigation**: Understanding directory structure
2. **Permission Management**: chmod, chown, umask
3. **Process Management**: ps, top, kill
4. **Network Troubleshooting**: ping, netstat, ss
5. **Text Processing**: grep, sed, awk
6. **System Monitoring**: df, du, free, uptime
7. **Package Management**: apt, yum, rpm
8. **Shell Scripting**: Automation basics

## Best Practices

1. **Security**
   - Use sudo instead of root login
   - Keep systems updated
   - Use SSH keys instead of passwords
   - Implement proper firewall rules

2. **Performance**
   - Monitor resource usage regularly
   - Clean up old logs and temp files
   - Optimize services and processes

3. **Documentation**
   - Keep track of changes
   - Document custom configurations
   - Maintain runbooks for common tasks

## Study Tips

1. Practice on a VM or container
2. Build muscle memory for common commands
3. Understand WHY commands work, not just HOW
4. Try to solve problems multiple ways
5. Read man pages (man command_name)
