# Linux Fundamentals Study Guide

**Estimated Time**: 2-3 weeks

Linux is an open-source operating system that's essential for servers and DevOps infrastructure. Mastery of the command line and Bash scripting is non-negotiable for a DevOps engineer.

## Essential Concepts

### 1. Basic Linux Commands
To navigate and manipulate files, you must be comfortable with:
- `ls`: List files and directories.
- `cd`: Change directory.
- `pwd`: Print current working directory.
- `cp`: Copy files or directories.
- `mv`: Move or rename files or directories.
- `rm`: Remove files or directories.
- `mkdir`: Create a new directory.
- `cat`: Concatenate and display file content.
- `man`: Display the manual for a command.

### 2. File System Hierarchy
Understand how Linux organizes its directories:
- `/`: The root directory.
- `/bin` & `/sbin`: Core executable binaries.
- `/etc`: Configuration files for the system.
- `/home`: User home directories.
- `/var`: Variable data files like logs.
- `/tmp`: Temporary files.
- `/usr`: User binaries and shared data.
- `/root`: Home directory for the root user.

### 3. Permissions and Ownership
Linux is a multi-user system, so security is paramount:
- `chmod`: Change file permissions (Read (r), Write (w), Execute (x)).
- `chown`: Change file owner and group.
- Understand the 3 sets of permissions: **Owner**, **Group**, and **Others**.

### 4. Processes and Signals
Manage running applications:
- `ps`: View a snapshot of current processes.
- `top` / `htop`: Interactive process viewer.
- `kill`: Send a signal to a process (e.g., `SIGTERM`, `SIGKILL`).
- `bg` & `fg`: Move processes to background/foreground.

### 5. Package Management
Install and manage software:
- `apt`: Advanced Package Tool (Debian/Ubuntu).
- `yum` / `dnf`: Package manager for Red Hat/CentOS/Fedora.
- Commands like `install`, `update`, `remove`, and `search`.

### 6. Shell Scripting Basics (Bash)
Automate repetitive tasks:
- **Variables**: Storing and retrieving data.
- **Loops**: `for`, `while`.
- **Conditionals**: `if`, `elif`, `else`, `case`.
- **Functions**: Grouping commands into reusable blocks.
- **Redirects**: `>`, `>>`, `<`, `|` (pipes).

---
**Practical Challenge**: Write a script that checks if a certain directory exists, creates it if not, and then lists the contents of `/etc` into a file within that directory.
