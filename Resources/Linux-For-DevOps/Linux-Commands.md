# DAY-01 | Linux for DevOps Engineers

Linux is an open-source operating system kernel that serves as the foundation for various Linux-based operating systems (distributions). Linux is known for its stability, security, and flexibility. It is based on the Unix operating system and follows the Unix philosophy of small, modular, and reusable components. Linux is highly customizable and can be tailored to suit various needs, ranging from desktop computers and servers to embedded systems and supercomputers.

---

## Linux Folder Structure

The folder structure in Ubuntu Linux follows the Filesystem Hierarchy Standard (FHS), which is a standard for organizing the files and directories on a Unix-like operating system.

### Main Directories:

- `/bin`: Contains essential command-line executable files (binaries) that are available to all users.  
- `/boot`: Contains files related to the boot process, including the Linux kernel and bootloader configuration.  
- `/dev`: Contains device files that represent and allow access to hardware devices.  
- `/etc`: Contains system-wide configuration files.  
- `/home`: Home directories for individual users.  
- `/lib` and `/lib64`: Contain shared libraries needed by the system and applications.  
- `/media`: Mount point for removable media devices.  
- `/mnt`: General-purpose mount point for temporarily mounting filesystems.  
- `/opt`: Contains optional software packages.  
- `/proc`: Virtual filesystem providing information about processes and system status.  
- `/root`: Home directory for the root user.  
- `/run`: Temporary filesystem with runtime data.  
- `/sbin`: Contains system binaries for administration tasks.  
- `/srv`: Contains data for system services.  
- `/sys`: Virtual filesystem exposing kernel-related info.  
- `/tmp`: Temporary files directory.  
- `/usr`: Contains user-related programs, libraries, documentation, and shared resources.  
- `/var`: Contains variable data such as logs, databases, and spool files.  

---

## Important Linux Commands for DevOps Engineers

### 1. `ls`
- **Description:** Lists files and directories.
- **Usage:**
  - `ls` – Lists files and directories.
  - `ls -l` – Lists in long format.
  - `ls -a` – Includes hidden files.

### 2. `cd`
- **Description:** Changes the current directory.
- **Usage:**
  - `cd /path/to/directory`
  - `cd ..`
  - `cd ~`

### 3. `mkdir`
- **Description:** Creates a directory.
- **Usage:**
  - `mkdir directory_name`
  - `mkdir -p path/to/directory`

### 4. `rm`
- **Description:** Removes files or directories.
- **Usage:**
  - `rm file_name`
  - `rm -r directory_name`
  - `rm -f file_name`

### 5. `cp`
- **Description:** Copies files or directories.
- **Usage:**
  - `cp source destination`
  - `cp -r source_dir destination_dir`

### 6. `mv`
- **Description:** Moves or renames files or directories.
- **Usage:**
  - `mv source destination`

### 7. `grep`
- **Description:** Searches for a specific pattern.
- **Usage:**
  - `grep pattern file`
  - `grep -r pattern directory`
  - `command | grep pattern`

### 8. `ps`
- **Description:** Lists running processes.
- **Usage:**
  - `ps`, `ps -ef`, `ps -eaf`

### 9. `top`
- **Description:** Displays real-time system info and processes.
- **Usage:**
  - `top` (Press `q` to exit)

### 10. `tail`
- **Description:** Displays the last part of a file.
- **Usage:**
  - `tail file_name`
  - `tail -n N file_name`
  - `tail -f file_name`

---

## Top 50 Networking Commands in Linux

Examples include:
- `ifconfig`
- `ip`
- `ping`
- `traceroute`
- `nslookup`
- `dig`
- `netstat`
- `ssh`
- `scp`
- `rsync`
- `iptables`

Each command supports multiple flags for diagnostics, routing, and configuration.

---

## File Permissions and Ownership

### `chmod`
Used to change permissions.

**Symbolic Mode Example:**
```bash
chmod u+rw file.txt
chmod g-x script.sh
chmod o+rx program
```

**Octal Mode Example:**
```bash
chmod 755 script.sh
chmod 700 private.txt
chmod 777 public_dir
```

### `chown`
Change file ownership.
```bash
chown user:group file.txt
chown -R user:group directory/
```

### `chgrp`
Change group ownership.
```bash
chgrp developers script.sh
chgrp -R team project_dir
```

---

## Top 100 Linux Commands

This includes:
`ls`, `cd`, `pwd`, `mkdir`, `rmdir`, `cp`, `mv`, `rm`, `cat`, `less`, `head`, `tail`, `grep`, `find`, `chmod`, `chown`, `tar`, `gzip`, `wget`, `curl`, `ssh`, `scp`, `ping`, `netstat`, `ps`, `top`, `kill`, `df`, `du`, `mount`, `umount`, `ln`, `echo`, `date`, `history`, `unzip`, `awk`, `sed`, `wc`, `sort`, `diff`, `apt-get`, `yum`, `systemctl`, `service`, `sudo`, `passwd`, `useradd`, `groupadd`, `crontab`, `reboot`, `shutdown`, and many others.

Refer to each command’s **man page** using:
```bash
man <command>
```
for detailed options and examples.
