# 🔧 Linux + Git + Networking Guide for DevOps

## 📋 Overview
This guide demonstrates how **Git manages code**, **Linux runs applications**, and **Networking connects everything**—the three pillars of DevOps.

---

## 🧱 Step 1: Code Management (Git & GitHub)

### Essential Git Commands:
```bash
# Initialize repository
git init

# Stage and commit code
git add .
git commit -m "Initial commit"

# Push to GitHub
git push origin main

# View logs and history
git log --oneline
git status
```

**DevOps Context:**
- Git tracks **infrastructure-as-code**, application code, and deployment scripts
- GitHub/GitLab/Bitbucket act as **single source of truth**
- Enables **CI/CD pipelines** and team collaboration

---

## 🐧 Step 2: Linux Server Setup

### Common DevOps Linux Commands:
```bash
# Directory management
mkdir app
cd app

# File operations
cp source.txt destination.txt
mv file1.txt file2.txt
rm unnecessary-file
ls -la

# Package management
sudo apt update
sudo apt install nodejs npm
sudo yum install nginx  # For RedHat-based systems

# User & permissions
sudo useradd devops-user
chmod 755 script.sh
chown user:group file.txt

# Process management
ps aux
systemctl start nginx
systemctl enable nginx
```

**DevOps Context:**
- Automate deployments on **AWS EC2, Azure VMs, bare metal servers**
- Install and configure **Docker, Kubernetes, Jenkins, Terraform**
- Manage system resources and security

---

## 🌐 Step 3: Networking & Connectivity

### Network Diagnostics:
```bash
# Test connectivity
ping google.com
ping 8.8.8.8

# Check listening ports
netstat -tulnp
ss -tulnp  # Modern alternative

# DNS resolution
nslookup google.com
dig google.com

# Test application response
curl localhost:3000
curl -v http://api.example.com/health

# Port forwarding/tunneling
ssh -L 8000:localhost:3000 user@remote-server

# Network interface info
ip addr show
ifconfig
```

**DevOps Context:**
- Verify **firewall rules** and security groups
- Load balancer configuration (**NGINX, HAProxy**)
- Health checks for **Kubernetes services**
- Debugging application accessibility

---

## 🔐 Step 4: Remote Access (SSH)

```bash
# Basic SSH login
ssh user@server-ip

# SSH with specific port
ssh -p 2222 user@server-ip

# Copy files via SCP
scp file.txt user@server-ip:/path/to/destination
scp -r user@server-ip:/remote/folder ./local/folder

# SSH without password (key-based auth)
ssh-keygen -t rsa -b 4096
ssh-copy-id -i ~/.ssh/id_rsa.pub user@server-ip

# Execute remote commands
ssh user@server-ip "docker ps"
ssh user@server-ip "systemctl status nginx"
```

**DevOps Context:**
- **AWS EC2** key pair authentication
- Automated scripts running on remote servers
- Cloud infrastructure management

---

## 🔄 Complete Real DevOps Workflow

```
┌─────────┐     ┌──────────┐     ┌──────────┐     ┌─────────┐     ┌──────────┐
│Developer│────→│  GitHub  │────→│  Linux   │────→│Network  │────→│Live App  │
│  Codes  │     │  (Store) │     │(Execute) │     │(Connect)│     │ Running  │
└─────────┘     └──────────┘     └──────────┘     └─────────┘     └──────────┘

 Git Push      CI/CD Pipeline    SSH Deploy    Port Mapping    User Access
```

---

## 💡 Practical DevOps Scenario

### Deploying a Node.js App:

```bash
# 1. Push code to GitHub (Git)
git add . && git commit -m "Feature: Auth module" && git push origin main

# 2. Login to Linux Server (SSH)
ssh ec2-user@35.160.45.78

# 3. Clone and setup (Git + Linux)
git clone https://github.com/user/app.git
cd app
npm install

# 4. Install dependencies (Linux)
sudo apt install nginx

# 5. Configure networking (Networking)
sudo nano /etc/nginx/sites-available/default
# Point nginx to localhost:3000

# 6. Verify connectivity (Network Testing)
curl localhost:3000
ping google.com
netstat -tulnp | grep 3000

# 7. Start application
npm start  # App runs on port 3000
# Nginx reverse proxy on port 80
```

---

## 🎯 Key Takeaways for DevOps Engineers

| Component | Role | DevOps Tool/Example |
|-----------|------|-------------------|
| **Git** | Version control, CI/CD trigger | GitHub Actions, GitLab CI |
| **Linux** | Server OS, container runtime | Ubuntu, CentOS, Alpine (Docker) |
| **Networking** | Application accessibility | AWS Security Groups, Kubernetes ingress |

---

## 🚀 Next Steps

1. **Master Docker** → Containerize apps running on Linux
2. **Learn Kubernetes** → Orchestrate containers across networks
3. **CI/CD Pipelines** → Automate Git → Linux → Network deployment
4. **Infrastructure-as-Code** → Terraform, CloudFormation
5. **Monitoring & Logging** → Prometheus, ELK Stack, CloudWatch

---

## 🔗 Additional Resources

- **Git Official Docs:** https://git-scm.com/doc
- **Linux Man Pages:** https://man7.org/
- **SSH Protocol Guide:** https://www.ssh.com/academy/ssh
- **Networking Tools Reference:** https://linux.die.net/man/
- **DevOps Best Practices:** https://12factor.net/

---

## 📌 Summary

DevOps = **Integration of Multiple Skills**
- **Git** manages code
- **Linux** runs it
- **Networking** connects it

Real-world problems require **cross-domain knowledge** across all three domains. Master these fundamentals, and you'll be ready for advanced DevOps tools and cloud platforms!

💪 Happy Learning! 🚀
