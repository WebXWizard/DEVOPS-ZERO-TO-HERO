# Essential Linux Commands for DevOps

## File and Directory Operations

### Navigation
```bash
pwd                     # Print working directory
cd /path/to/dir        # Change directory
cd ~                   # Go to home directory
cd ..                  # Go up one directory
cd -                   # Go to previous directory
```

### Listing Files
```bash
ls                     # List files
ls -l                  # Long format (permissions, size, date)
ls -la                 # Include hidden files
ls -lh                 # Human-readable file sizes
ls -ltr                # Sort by time, reverse order
ls -R                  # Recursive listing
```

### File Operations
```bash
touch file.txt         # Create empty file or update timestamp
cp file1 file2         # Copy file
cp -r dir1 dir2        # Copy directory recursively
mv file1 file2         # Move/rename file
rm file.txt            # Remove file
rm -rf directory       # Remove directory and contents (DANGEROUS!)
mkdir directory        # Create directory
mkdir -p dir1/dir2     # Create nested directories
rmdir directory        # Remove empty directory
```

### Viewing Files
```bash
cat file.txt           # Display entire file
less file.txt          # View file page by page (q to quit)
more file.txt          # View file page by page (older)
head file.txt          # Show first 10 lines
head -n 20 file.txt    # Show first 20 lines
tail file.txt          # Show last 10 lines
tail -n 20 file.txt    # Show last 20 lines
tail -f file.txt       # Follow file updates (live logs)
```

## File Permissions and Ownership

```bash
chmod 755 file.txt     # Change permissions (rwxr-xr-x)
chmod +x script.sh     # Add execute permission
chmod -w file.txt      # Remove write permission
chmod u+x file.txt     # Add execute for user
chmod g-w file.txt     # Remove write for group
chmod o+r file.txt     # Add read for others

chown user file.txt    # Change owner
chown user:group file  # Change owner and group
chown -R user dir/     # Change ownership recursively

chgrp group file.txt   # Change group
```

## User and Group Management

```bash
whoami                 # Show current username
id                     # Show user ID and groups
su username            # Switch user
sudo command           # Execute as superuser

useradd username       # Add new user
useradd -m username    # Add user with home directory
userdel username       # Delete user
userdel -r username    # Delete user and home directory

passwd username        # Change password
usermod -aG group user # Add user to group

groups                 # Show current user's groups
groups username        # Show user's groups
```

## Process Management

```bash
ps                     # Show current processes
ps aux                 # Show all processes (detailed)
ps -ef                 # Show all processes (full format)
ps aux | grep nginx    # Find specific process

top                    # Interactive process viewer
htop                   # Enhanced process viewer (if installed)

kill PID               # Terminate process
kill -9 PID            # Force kill process
killall process_name   # Kill all processes by name

bg                     # Send process to background
fg                     # Bring process to foreground
jobs                   # List background jobs

nohup command &        # Run command immune to hangups

systemctl start service    # Start service
systemctl stop service     # Stop service
systemctl restart service  # Restart service
systemctl status service   # Check service status
systemctl enable service   # Enable service at boot
systemctl disable service  # Disable service at boot
```

## System Information

```bash
uname -a               # System information
hostname               # Show hostname
uptime                 # System uptime and load
date                   # Current date and time
cal                    # Calendar

df -h                  # Disk space usage (human-readable)
du -sh directory       # Directory size
du -h --max-depth=1    # Size of subdirectories

free -h                # Memory usage
cat /proc/cpuinfo      # CPU information
cat /proc/meminfo      # Memory information
lscpu                  # CPU architecture info
lsblk                  # List block devices
```

## Network Commands

```bash
ip addr                # Show IP addresses
ip a                   # Short version
ifconfig               # Network interfaces (older)

ping google.com        # Test connectivity
ping -c 4 google.com   # Ping 4 times

netstat -tuln          # Show listening ports
ss -tuln               # Socket statistics (modern)
ss -tulnp              # Include process information

curl website.com       # Fetch web content
curl -I website.com    # Show HTTP headers only
wget website.com       # Download file

nslookup domain.com    # DNS lookup
dig domain.com         # DNS information
host domain.com        # DNS lookup (simple)

traceroute google.com  # Trace route to host
route -n               # Show routing table
```

## File Searching

```bash
find /path -name "*.txt"           # Find files by name
find /path -type f                 # Find files only
find /path -type d                 # Find directories only
find /path -mtime -7               # Files modified in last 7 days
find /path -size +100M             # Files larger than 100MB
find /path -name "*.log" -delete   # Find and delete

locate filename        # Quick file search (uses database)
updatedb              # Update locate database

which command         # Show command path
whereis command       # Show command, source, and man page paths
```

## Text Processing

```bash
grep "pattern" file.txt              # Search for pattern
grep -i "pattern" file               # Case-insensitive search
grep -r "pattern" directory          # Recursive search
grep -v "pattern" file               # Invert match (exclude)
grep -n "pattern" file               # Show line numbers
grep -c "pattern" file               # Count matches
grep -l "pattern" *.txt              # Show only filenames

sed 's/old/new/' file                # Replace first occurrence per line
sed 's/old/new/g' file               # Replace all occurrences
sed -i 's/old/new/g' file            # Edit file in-place
sed -n '10,20p' file                 # Print lines 10 to 20

awk '{print $1}' file                # Print first column
awk -F: '{print $1}' /etc/passwd     # Use : as delimiter
awk '/pattern/ {print $0}' file      # Print lines matching pattern

cut -d: -f1 /etc/passwd              # Cut first field
cut -c1-10 file                      # Cut characters 1-10

sort file.txt                        # Sort lines
sort -r file                         # Reverse sort
sort -n file                         # Numeric sort
sort -u file                         # Sort and remove duplicates

uniq file.txt                        # Remove consecutive duplicates
uniq -c file                         # Count occurrences

wc file.txt                          # Count lines, words, chars
wc -l file                           # Count lines only
wc -w file                           # Count words only
```

## File Compression

```bash
tar -cvf archive.tar dir/          # Create tar archive
tar -czvf archive.tar.gz dir/      # Create gzipped tar
tar -xvf archive.tar               # Extract tar
tar -xzvf archive.tar.gz           # Extract gzipped tar
tar -tvf archive.tar               # List contents

gzip file.txt                      # Compress file
gunzip file.txt.gz                 # Decompress file

zip archive.zip file1 file2        # Create zip
zip -r archive.zip directory       # Zip directory
unzip archive.zip                  # Extract zip
unzip -l archive.zip               # List zip contents
```

## Redirection and Pipes

```bash
command > file.txt                 # Redirect output to file (overwrite)
command >> file.txt                # Append output to file
command < file.txt                 # Use file as input
command 2> error.log               # Redirect errors
command > output.txt 2>&1          # Redirect both output and errors
command &> output.txt              # Redirect both (bash 4+)

command1 | command2                # Pipe output to another command
cat file | grep "pattern"          # Combine commands
ps aux | grep nginx | wc -l        # Chain multiple commands
```

## File Editing

```bash
nano file.txt          # Edit with nano (beginner-friendly)
vi file.txt            # Edit with vi
vim file.txt           # Edit with vim

# Vim basics:
i                      # Enter insert mode
Esc                    # Exit insert mode
:w                     # Save
:q                     # Quit
:wq                    # Save and quit
:q!                    # Quit without saving
/pattern               # Search
:set number            # Show line numbers
```

## Aliases and Environment

```bash
alias ll='ls -la'      # Create alias
unalias ll             # Remove alias
alias                  # List all aliases

echo $PATH             # Show PATH variable
export VAR=value       # Set environment variable
env                    # Show all environment variables
printenv               # Show environment variables

source file            # Execute file in current shell
. file                 # Same as source
```

## System Maintenance

```bash
apt update             # Update package list (Ubuntu/Debian)
apt upgrade            # Upgrade packages
apt install package    # Install package

yum update             # Update packages (RHEL/CentOS)
yum install package    # Install package

reboot                 # Reboot system
shutdown -h now        # Shutdown now
shutdown -r now        # Restart now
shutdown -h +10        # Shutdown in 10 minutes

history                # Show command history
history | grep ssh     # Search command history
!123                   # Execute command #123 from history
!!                     # Execute last command
```

## Quick Tips for DevOps

1. **Use Tab completion**: Save time and avoid typos
2. **Use `Ctrl+R`**: Search command history
3. **Use `Ctrl+C`**: Cancel current command
4. **Use `Ctrl+Z`**: Suspend current process
5. **Use `&&`**: Run commands sequentially (cmd1 && cmd2)
6. **Use `||`**: Run second if first fails (cmd1 || cmd2)
7. **Use `man command`**: Read manual pages
8. **Use `--help`**: Quick command help

## Practice Exercises

1. Find all .log files in /var/log modified in the last 24 hours
2. Create a backup of a directory with timestamp
3. Monitor disk usage and alert when above 80%
4. Find top 10 largest files in a directory
5. Search for specific text in all files recursively
6. Kill all processes matching a pattern
7. Create a script to clean up old log files
8. Monitor a log file in real-time with filtering
