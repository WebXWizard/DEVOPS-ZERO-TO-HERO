# Configuration Management (Ansible) Study Guide

**Estimated Time**: 3-4 weeks

Configuration management ensures that all your servers are configured consistently and automatically. Ansible is the preferred choice for its simplicity, agentless architecture, and human-readable YAML syntax.

## Essential Concepts

### 1. Ansible (Recommended)
Key components:
- **Control Node**: The machine where Ansible is installed and from which commands are run.
- **Inventory**: A list of managed nodes (managed servers) and their metadata.
- **Modules**: Reusable units of code that perform specific tasks (e.g., `apt`, `yum`, `user`, `service`).

### 2. Writing Ansible Playbooks
Defining the desired state of your infrastructure:
- **YAML format**: Uses key-value pairs and indentation.
- **Plays**: Collections of tasks to be run on a specific set of hosts.
- **Tasks**: Sequential actions to be performed (e.g., "Install Nginx", "Start Service").
- **Handlers**: Actions that are only triggered when a task makes a change (e.g., restarting a service after a config change).

### 3. Roles and Modules
- **Roles**: A way to organize playbooks by functionality (e.g., `common`, `webserver`, `database`).
- **Ansible Galaxy**: A public repository for sharing and discovering Ansible roles.

### 4. Managing Variables and Templates
- **Variables**: Dynamic values that change based on environment or host.
- **Jinja2 Templates**: Using Python's templating engine to generate configuration files dynamically.
- **Facts**: Information collected by Ansible about the managed nodes (e.g., hostname, IP address, OS version).

### 5. Puppet and Chef (Alternative Tools)
While Ansible is agentless, these tools use an agent-based architecture:
- **Puppet**: Uses a declarative DSL (Domain Specific Language).
- **Chef**: Uses Ruby-based scripts ("Recipes" and "Cookbooks").
- Understanding when and why to use these tools over Ansible.

---
**Practical Challenge**: Write an Ansible playbook that installs Apache on a target server, starts the service, and copies a custom `index.html` file to the web root.
