# 🚀 Ultimate 30-Day DevOps & AWS Architect Roadmap

Welcome to my **DevOps Transformation Lab**. This repository documents an intensive 30-day sprint from absolute beginner to cloud-ready engineer. I am following the professional curriculum provided by the **Code with Mosh DevOps Roadmap**, focusing on high-availability, scalability, and automation.



---

## 🛠 Progress Dashboard
- **Current Phase:** 🟦 Phase 1: Infrastructure Foundations
- **Days Completed:** 01/30
- **Status:** 🟢 On Track
- **Mastery Level:** Beginner

---

## 📅 The 30-Day Technical Sprint

### 🟦 Week 1: The Linux & Networking Bedrock
*Goal: Master the environment where 90% of the internet lives.*
- **Day 1-3:** Shell Navigation, File system hierarchy, and I/O Redirection.
- **Day 4-5:** Permissions (`chmod 755`), Ownership (`chown`), and Process management (`top`, `ps`, `kill`).
- **Day 6-7:** Networking: TCP/IP stack, SSH tunneling, DNS resolution, and Load balancing basics.
- **🚀 MINI PROJECT 1:** **"The Automated Auditor"**
  - **Task:** Write a Bash script that checks system disk usage, active users, and open ports, then exports the report to a `.txt` file every hour using `crontab`.

### 🟨 Week 2: Version Control & Python Automation
*Goal: Transition from manual execution to "Script First" thinking.*
- **Day 8-10:** Advanced Git: Rebase vs. Merge, Stashing, and Git Hooks for pre-commit checks.
- **Day 11-14:** Python for Ops: File handling, JSON parsing, and using the `boto3` library for AWS.
- **🚀 MINI PROJECT 2:** **"The Log Scraper"**
  - **Task:** Build a Python script that parses Nginx access logs, identifies IP addresses with more than 100 failed requests (404/500), and alerts the admin.

### 🟧 Week 3: AWS Cloud & Containerization
*Goal: Provisioning virtual hardware and isolating applications.*
- **Day 15-17:** AWS Core: Launching EC2 instances, configuring VPC Security Groups, and S3 Bucket Policies.
- **Day 18-21:** Docker: Multi-stage builds (reducing image size), Docker Compose for microservices.
- **🚀 MINOR PROJECT 1:** **"The Containerized Web Stack"**
  - **Task:** Dockerize a Node.js/Python app with a Redis database. Use Docker Compose to ensure they communicate and persist data using Volumes.

### 🟪 Week 4: CI/CD, IaC & Observability
*Goal: Automating the "Source-to-Production" lifecycle.*
- **Day 22-24:** CI/CD: Building GitHub Actions to run tests and build Docker images automatically.
- **Day 25-27:** Infrastructure as Code: Provisioning an AWS S3 bucket and EC2 using **Terraform**.
- **Day 28-30:** **THE CAPSTONE PROJECT** (See below).

---

## 🏆 Capstone Project: "The Self-Healing Pipeline"
**Objective:** Deploy a highly available web application on AWS with zero manual intervention.

1. **Infrastructure:** Provision a VPC with Public/Private subnets using **Terraform**.
2. **CI/CD:** Trigger a **GitHub Action** on code push to:
   - Run security linting.
   - Build a Docker image.
   - Push the image to **AWS ECR**.
3. **Deployment:** Automatically update an **AWS ECS** (Fargate) service with the new image.
4. **Monitoring:** Setup **Prometheus & Grafana** to track CPU/Memory usage and alert on downtime.



---

## 📚 Technical Resource Vault

### 🐧 Linux & Networking
- [Linux Journey](https://linuxjourney.com/) - Interactive lessons.
- [The Art of Command Line](https://github.com/jlevy/the-art-of-command-line) - Professional CLI tips.

### ☁️ AWS & Cloud
- [AWS Ramp-Up Guide](https://aws.amazon.com/training/ramp-up-guides/) - Official AWS paths.
- [The Open Guide to AWS](https://github.com/open-guides/og-aws) - Community-driven tips.

### 🐳 Containers & K8s
- [Docker Labs](https://github.com/docker/labs) - Official hands-on tutorials.
- [Kubernetes The Hard Way](https://github.com/kelseyhightower/kubernetes-the-hard-way) - For deep architecture understanding.

---

## ✍️ Daily Learning Journal

| Day | Topic | Key Takeaway | Project Commit |
| :--- | :--- | :--- | :--- |
| 01 | Linux Basics | `mkdir -p` is a lifesaver for nested folders. | [Initial Setup] |
| 02 | Permissions | Learned why `777` is a security nightmare. | [Perm Script] |
| ... | ... | ... | ... |

---

## 👤 Connect & Follow
- **LinkedIn:** [Your Name](https://linkedin.com/in/YourProfile)
- **Twitter/X:** [@YourHandle](https://twitter.com/YourHandle)

---
*Roadmap inspired by Shahe Alam. Built for the 30-Day DevOps Challenge.*