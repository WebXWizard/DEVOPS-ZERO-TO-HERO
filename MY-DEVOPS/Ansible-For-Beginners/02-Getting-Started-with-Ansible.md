# Getting Started with Ansible

## 1. Installation

**Prerequisites**:
*   **Control Node**: Ansible works best on Linux (Ubuntu/CentOS) or macOS. For **Windows** users, it is highly recommended to use **WSL (Windows Subsystem for Linux)**.
*   **Python**: Python 3.8+ must be installed.

### Installing on Ubuntu/Debian (or WSL Ubuntu)
```bash
sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible
```

### Installing on RHEL/CentOS
```bash
sudo dnf install epel-release
sudo dnf install ansible
```

### Verify Installation
```bash
ansible --version
```

---

## 2. Architecture & Inventory

Ansible works by connecting to your nodes and pushing out small programs, called "Ansible modules", to them.

### The Inventory File
The inventory file tells Ansible which servers to manage. It can be a simple text file (INI format) or a YAML file.

Location: `/etc/ansible/hosts` (default) or you can create a local one like `inventory.ini`.

#### Example `inventory.ini`:
```ini
[webservers]
192.168.1.10
192.168.1.11

[dbservers]
db1.example.com
```

### Testing Connection
Once your inventory is ready and you have SSH access to those servers (using SSH keys is recommended!), you can test the connection.

```bash
# Ping all servers in the inventory
ansible all -m ping -i inventory.ini
```
*   `-m ping`: Uses the 'ping' module (not networking ping, but an Ansible connectivity test).
*   `-i inventory.ini`: Specifies the inventory file to use.

If successful, you will see a 'SUCCESS' message with 'pong' in the output.
