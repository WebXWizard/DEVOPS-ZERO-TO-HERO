# 🚀 30 Days of DevOps Mastery: Zero to Cloud Architect

Welcome to my **DevOps Transformation Lab**. This repository documents an intensive 30-day sprint from absolute beginner to cloud-ready engineer. I am following the professional curriculum provided by the **Code with Mosh DevOps Roadmap**, focusing on automation, scalability, and the "Infrastructure as Code" philosophy.

---

## 🛠 Progress Dashboard
- **Current Phase:** 🟦 Phase 1: Infrastructure Foundations
- **Days Completed:** 00 / 30
- **Learning Streak:** 🔥 0 Days
- **Status:** 🟢 Active

---

## 📅 The 30-Day Technical & Content Strategy
This roadmap combines deep technical learning with a professional **LinkedIn RCTF Strategy** (Role, Context, Task, Final Result) to build my public profile.

### 🟦 Week 1: Linux & Networking Bedrock
*Goal: Master the environment where the internet lives.*
- **Day 1:** Commitment & Environment Setup (WSL2/Ubuntu).
- **Day 2:** Navigation & File Operations (`find`, `grep`, `pipe`).
- **Day 3:** Permissions & Security (`chmod`, `chown`, `umask`).
- **Day 4:** Process Management & System Monitoring (`top`, `ps`, `kill`).
- **Day 5:** Networking Fundamentals (IP, DNS, OSI Model).
- **Day 6:** Remote Access & SSH Hardening.
- **Day 7:** **MINI PROJECT 1: The System Auditor**
  - *Task:* A Bash script to audit system health and email a report via Cron.

### 🟨 Week 2: Version Control & Python Automation
*Goal: Transition from manual execution to "Code First" thinking.*
- **Day 8:** Git Internals (The `.git` folder and Objects).
- **Day 9:** Branching Strategies (GitFlow vs. Trunk-based).
- **Day 10:** Mastering Merge Conflicts & Rebasing.
- **Day 11:** Python Basics for Ops (Data types, Loops).
- **Day 12:** Log Parsing with Python.
- **Day 13:** Interacting with APIs & Cloud SDKs (Boto3).
- **Day 14:** **MINI PROJECT 2: The Log Scraper**
  - *Task:* A Python script that detects suspicious IP behavior in Nginx logs.

### 🟧 Week 3: AWS Cloud & Containerization
*Goal: Infrastructure at scale and application isolation.*
- **Day 15:** AWS IAM & Security (The Principle of Least Privilege).
- **Day 16:** EC2 & VPC: Virtual Networking and Compute.
- **Day 17:** S3 & CloudFront: Static Content Delivery.
- **Day 18:** Docker Basics: Writing optimized `Dockerfiles`.
- **Day 19:** Multi-stage Builds & Image Security.
- **Day 20:** Orchestration with Docker Compose.
- **Day 21:** **MINOR PROJECT 1: Containerized Full-Stack**
  - *Task:* A Node.js/Python app linked to Redis/Postgres via Compose.

### 🟪 Week 4: CI/CD, IaC & Observability
*Goal: Automating the "Source-to-Production" lifecycle.*
- **Day 22:** The CI/CD Philosophy (Build → Test → Deploy).
- **Day 23:** GitHub Actions: Automating Linting and Unit Tests.
- **Day 24:** Container Registry: Pushing images to AWS ECR.
- **Day 25:** Terraform 101: Provisioning Cloud with Code.
- **Day 26:** Terraform State & Remote Backends.
- **Day 27:** Monitoring with Prometheus & Grafana.
- **Day 28-30:** **THE CAPSTONE PROJECT: The Self-Healing Pipeline**
  - *Task:* Auto-deploying a containerized app to AWS ECS via GitHub Actions.

---

## 🏆 Tiered Projects Showcase

### 🛠 Mini Project: Automated Auditor (Week 1)
- **Tech:** Bash, Crontab
- **Description:** A script that monitors disk usage and CPU temperature, logging errors if thresholds are exceeded.

### 🛠 Minor Project: The Web Stack (Week 3)
- **Tech:** Docker, Docker Compose, Nginx
- **Description:** A production-ready containerized environment with a reverse proxy and database persistence.

### 🥇 Capstone Project: Self-Healing CI/CD Pipeline (Week 4)
- **Tech:** Terraform, AWS (ECR/ECS), GitHub Actions, Prometheus
- **Architecture:** 1. Code push triggers GitHub Action.
  2. Docker image is built and scanned for vulnerabilities.
  3. Image pushed to ECR.
  4. Terraform updates ECS service to roll out the new version.
  5. Grafana monitors the deployment health.

---

## ✍️ LinkedIn RCTF Posting Template
For every day of this journey, I use the following framework to share my growth:

> **[Headline: Punchy Hook]**
>
> **[ROLE]**
> As an aspiring DevOps Engineer, I am focused on [Current Week Pillar].
>
> **[CONTEXT]**
> While working on [Concept], I realized that [Common Problem].
>
> **[TASK]**
> I used [Tool] to [Actions taken to solve the problem].
>
> **[FINAL RESULT]**
> ✅ [The Outcome]. Key takeaway: [Technical lesson learned].
> 
> #DevOps #30DaysOfDevOps #Cloud #AWS #Automation

---

## 📚 Technical Resource Vault
- **Official Roadmap:** [Code with Mosh DevOps Guide](https://codewithmosh.com)
- **Linux:** [The Art of Command Line](https://github.com/jlevy/the-art-of-command-line)
- **AWS:** [The Open Guide to AWS](https://github.com/open-guides/og-aws)
- **Docker:** [Play with Docker Classroom](https://training.play-with-docker.com/)

---

## 📈 Learning Journal

| Day | Topic | Key Insight | Commit Link |
| :--- | :--- | :--- | :--- |
| 01 | Env Setup | WSL2 is much faster than a standard VM. | [view](https://github.com/) |
| 02 | CLI Mastery | Pipes (`|`) are the superpower of Linux. | [view](https://github.com/) |
| ... | ... | ... | ... |

---
*Created and maintained by [Your Name]. Let's connect on [LinkedIn Link].*