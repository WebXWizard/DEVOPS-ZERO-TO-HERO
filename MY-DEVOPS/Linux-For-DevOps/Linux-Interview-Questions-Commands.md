# Linux Commands & Interview Questions for DevOps Internships

This guide covers essential Linux commands and common interview scenarios to help you crack your DevOps internship interview.

---

## 1. File Management & Searching
*Common Question: "How do you find a specific file or a string inside a file?"*

### `find` - Search for files
- **Find files by name:** `find /path -name "filename.txt"`
- **Find files larger than 100MB:** `find / -size +100M`
- **Find files modified in the last 7 days:** `find /path -mtime -7`

### `grep` - Search inside files
- **Search for a string in a file:** `grep "error" /var/log/syslog`
- **Recursive search in a directory:** `grep -r "config" /etc/`
- **Ignore case:** `grep -i "error" logfile.txt`
- **Count occurrences:** `grep -c "error" logfile.txt`

---

## 2. System Monitoring & Performance
*Common Question: "How do you check for high CPU or Memory usage?"*

### `top` / `htop` - Real-time process monitoring
- **Usage:** Run `top` to see active processes, CPU, and RAM usage.
- **Key shortcuts:** `P` (sort by CPU), `M` (sort by Memory), `q` (quit).

### `free` - Check Memory usage
- **Usage:** `free -h` (Human readable format - MB/GB).
- **Key metric:** Look at "Available" memory, not just "Free".

### `df` & `du` - Disk Space
- **Check file system disk space:** `df -h`
- **Check size of a directory:** `du -sh /var/log`

---

## 3. Process Management
*Common Question: "How do you kill a frozen process?"*

### `ps` - Process Status
- **List all running processes:** `ps aux`
- **Find a specific process ID (PID):** `ps aux | grep nginx`

### `kill` - Terminate processes
- **Kill by PID:** `kill <PID>`
- **Force kill:** `kill -9 <PID>` (Use carefully!)
- **Kill by name:** `pkill nginx`

---

## 4. Networking
*Common Question: "How do you check if a port is open or troubleshoot connectivity?"*

### `netstat` / `ss` - Network Statistics
- **List all listening ports:** `netstat -tuln` or `ss -tuln`
- **Check if port 80 is open:** `netstat -an | grep :80`

### `curl` - Transfer data / Test endpoints
- **Test if a website is up:** `curl -I https://google.com` (Returns headers only)
- **Make a GET request:** `curl https://api.example.com`

### `ping` - Check connectivity
- **Usage:** `ping google.com`

---

## 5. Permissions & Ownership
*Common Question: "Explain 'chmod 777' and how to change file ownership."*

### `chmod` - Change Permissions
- **Read (4), Write (2), Execute (1)**
- **Give full permissions (Read+Write+Execute) to everyone:** `chmod 777 file` (Not recommended for production!)
- **Owner R/W/X, Group R/X, Others R/X:** `chmod 755 script.sh`

### `chown` - Change Ownership
- **Change owner:** `chown user file`
- **Change owner and group:** `chown user:group file`
- **Recursive change:** `chown -R user:group /var/www/html`

---

## 6. Text Processing (The "Big Three")
*Common Question: "How do you replace a string in a file without opening it?"*

### `sed` - Stream Editor
- **Replace 'foo' with 'bar' in a file:** `sed 's/foo/bar/g' filename.txt`
- **Replace in-place (save changes):** `sed -i 's/foo/bar/g' filename.txt`

### `awk` - Text Processing
- **Print the first column of a file:** `awk '{print $1}' filename.txt`
- **Print specific rows:** `awk 'NR==5' filename.txt` (Prints 5th line)

### `head` & `tail`
- **View first 10 lines:** `head filename.txt`
- **View last 10 lines:** `tail filename.txt`
- **Live monitor a log file:** `tail -f /var/log/syslog` (Crucial for debugging!)

---

## 7. Archiving & Compression
*Common Question: "How do you extract a .tar.gz file?"*

### `tar`
- **Create an archive:** `tar -cvf archive.tar /path/to/dir`
- **Create a compressed archive (gzip):** `tar -czvf archive.tar.gz /path/to/dir`
- **Extract an archive:** `tar -xvf archive.tar`
- **Extract a compressed archive:** `tar -xzvf archive.tar.gz`

---

## 8. Miscellaneous Useful Commands
- **`history`**: View command history.
- **`alias`**: Create shortcuts for commands (e.g., `alias ll='ls -la'`).
- **`man`**: Manual pages (e.g., `man tar` to see how to use it).
- **`diff`**: Compare two files line by line.
- **`ln -s`**: Create a symbolic link (shortcut).

---

## 9. Scenario-Based Questions
1.  **"I can't write to a file. Why?"**
    *   Check permissions (`ls -l`).
    *   Check if disk is full (`df -h`).
    *   Check if file system is Read-Only.
2.  **"The server is slow. What do you do?"**
    *   Check `top` for CPU/RAM.
    *   Check `iostat` or `iotop` for Disk I/O.
    *   Check logs (`/var/log/syslog`).

Good luck with your interview!
