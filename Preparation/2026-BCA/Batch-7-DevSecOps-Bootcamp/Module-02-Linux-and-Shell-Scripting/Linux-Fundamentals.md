# Module 2 | Linux & Shell Scripting

Mastering the Linux environment is the first step toward system automation. This guide simplifies the core concepts with tables and quick-reference charts.

## 🐧 Linux Key Features

| Feature | Description |
| :--- | :--- |
| **Open Source** | Source code is free to use, modify, and distribute. |
| **Multi-User** | Multiple users can access system resources simultaneously. |
| **Multi-Tasking** | Multiple services/processes can run at once. |
| **Secure** | Robust permission system and kernel-level security. |

## 📂 Linux File System Hierarchy

```mermaid
graph TD
    Root[/] --> Bin(bin: User Binaries)
    Root --> Boot(boot: Boot Loader Files)
    Root --> Dev(dev: Device Files)
    Root --> Etc(etc: Configuration Files)
    Root --> Home(home: User Directories)
    Root --> Lib(lib: Shared Libraries)
    Root --> Var(var: Logs/Variable Data)
    Root --> Tmp(tmp: Temp Files)
    Root --> RootUser(root: Root User Home)
```

## 📜 File and Directory Permissions

Permissions are represented by 3 digits (e.g., `755`).

| Value | Permissions | r w x |
| :--- | :--- | :--- |
| **4** | Read Only | r - - |
| **2** | Write Only | - w - |
| **1** | Execute Only | - - x |
| **7** | Read + Write + Execute | r w x |
| **5** | Read + Execute | r - x |

**Example Permission Table (`chmod 764`):**

| Group | Permissions | Numeric |
| :--- | :--- | :--- |
| **User (Owner)** | Read, Write, Execute | 7 |
| **Group** | Read, Write | 6 |
| **Others** | Read | 4 |

## 🛠️ Essential Linux Commands

| Category | Commands |
| :--- | :--- |
| **Navigation** | `ls`, `cd`, `pwd`, `mkdir` |
| **File Ops** | `cp`, `mv`, `rm`, `touch`, `cat`, `nano/vi` |
| **Networking** | `ping`, `ifconfig`, `netstat`, `curl` |
| **Processes** | `ps`, `top`, `kill`, `bg`, `fg` |
| **User Mgmt** | `useradd`, `passwd`, `chmod`, `chown` |
| **Package Mgmt** | `apt`, `yum`, `dpkg`, `rpm` |

## 🐚 Shell Scripting Quick Start

A shell script is a file containing a series of commands.

**Basic Syntax Reference:**

| Concept | Syntax |
| :--- | :--- |
| **Shebang** | `#!/bin/bash` |
| **Variables** | `NAME="DevSecOps"` |
| **Printing** | `echo "Hello $NAME"` |
| **User Input** | `read INPUT_VAR` |
| **If-Else** | `if [ condition ]; then ... fi` |
| **Loops** | `for i in {1..5}; do ... done` |

---
**Practical Note**: Always use `ls -lah` to see hidden files and detailed properties!
