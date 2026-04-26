# Ansible Basics

## 1. Ad-Hoc Commands
Ad-hoc commands are one-liners used for quick tasks that you don't need to save for later. They use the `ansible` command (not `ansible-playbook`).

**Syntax**:
`ansible [pattern] -m [module] -a "[module options]"`

**Examples**:
```bash
# Check uptime of all servers
ansible all -m command -a "uptime"

# Install a package (e.g., git) on webservers
ansible webservers -m apt -a "name=git state=present" --become
```
*   `--become`: Run as root (sudo).

---

## 2. Playbooks
Playbooks are the core of Ansible. They describe the desired state of your system in a YAML file.

**Structure**:
1.  **Target**: Which hosts to execute on.
2.  **Tasks**: List of actions to perform (using modules).

**Example `webserver.yml`**:
```yaml
---
- name: Configure Web Server
  hosts: webservers
  become: yes  # Run as sudo

  tasks:
    - name: Install Nginx
      apt:
        name: nginx
        state: present
        update_cache: yes

    - name: Start Nginx Service
      service:
        name: nginx
        state: started
        enabled: yes

    - name: Create a custom index.html
      copy:
        content: "<h1>Hello from Ansible!</h1>"
        dest: /var/www/html/index.html
```

**Running a Playbook**:
```bash
ansible-playbook -i inventory.ini webserver.yml
```

---

## 3. Variables & Loops
You can make playbooks dynamic using variables.

**Using Loops**:
Instead of writing a task for each package, use a loop.

```yaml
    - name: Install multiple packages
      apt:
        name: "{{ item }}"
        state: present
      loop:
        - git
        - curl
        - vim
```
