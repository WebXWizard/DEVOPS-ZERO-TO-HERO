# 🚀 DevOps in 10 Days Roadmap

Welcome to the **DevOps in 10 Days** roadmap! This guide is designed to fast-track your journey into the world of DevOps, covering essential tools and concepts day by day.

## 📅 Roadmap Overview

| Day | Topic | Key Concepts |
|-----|-------|--------------|
| **Day 1** | 🐧 Linux & Networking | CLI, Permissions, SSH, DNS, HTTP/HTTPS |
| **Day 2** | 🐙 Version Control (Git) | Repos, Commits, Branches, Pull Requests |
| **Day 3** | 📜 Scripting & Automation | Bash scripting, Python basics for DevOps |
| **Day 4** | 🐳 Containerization (Docker) | Images, Containers, Dockerfile, Docker Compose |
| **Day 5** | 🔄 CI/CD Pipelines | Jenkins, GitHub Actions, Automated Testing |
| **Day 6** | 🏗️ Infrastructure as Code (IaC) | Terraform basics, State, Providers |
| **Day 7** | ⚙️ Configuration Management | Ansible, Playbooks, Inventory |
| **Day 8** | ☸️ Orchestration (Kubernetes) | Pods, Services, Deployments, Minikube |
| **Day 9** | 📊 Monitoring & Logging | Prometheus, Grafana, ELK Stack basics |
| **Day 10** | ☁️ Cloud & Capstone | AWS/Azure/GCP basics, Final Project |

---

## 🗓️ Daily Breakdown

### Day 1: Linux & Networking Fundamentals
**Goal:** Master the command line and understand how computers talk to each other.
- **Linux:** `ls`, `cd`, `grep`, `awk`, `sed`, file permissions (`chmod`, `chown`), Process management (`ps`, `top`, `kill`).
- **Networking:** IP addresses, Ports, SSH (`ssh-keygen`), DNS, OSI Model basics.
- **Hands-on:** Set up a Linux VM (or use WSL) and configure SSH keys.

### Day 2: Version Control with Git & GitHub
**Goal:** Manage code changes and collaborate effectively.
- **Concepts:** Distributed version control, Staging area, Remote repositories.
- **Commands:** `git init`, `git clone`, `git add`, `git commit`, `git push`, `git pull`.
- **Workflow:** Branching strategies, Merge conflicts, Pull Requests (PRs).
- **Hands-on:** Create a repo, push code, create a branch, and merge a PR.

### Day 3: Scripting & Automation
**Goal:** Automate repetitive tasks.
- **Bash:** Shebang, variables, loops, conditionals, cron jobs.
- **Python:** Basic syntax, libraries for OS interaction (`os`, `sys`, `subprocess`).
- **Hands-on:** Write a script to backup a directory or monitor disk usage.

### Day 4: Containerization with Docker
**Goal:** Package applications for consistency across environments.
- **Concepts:** Images vs. Containers, Registry (Docker Hub).
- **Tools:** Docker CLI, Dockerfile instructions (`FROM`, `RUN`, `CMD`, `COPY`).
- **Hands-on:** Containerize a simple Python or Node.js app and run it.

### Day 5: Continuous Integration & Deployment (CI/CD)
**Goal:** Automate the software delivery process.
- **Tools:** Jenkins (Classic) or GitHub Actions (Modern).
- **Concepts:** Pipelines, Build stages, Test automation, Artifacts.
- **Hands-on:** Create a pipeline that builds your Docker image from Day 4 automatically on push.

### Day 6: Infrastructure as Code (Terraform)
**Goal:** Provision infrastructure using code.
- **Concepts:** Declarative vs. Imperative, Providers, Resources, State file.
- **Hands-on:** Use Terraform to provision a local Docker resource or a simple AWS EC2 instance (free tier).

### Day 7: Configuration Management (Ansible)
**Goal:** Manage configuration of servers automatically.
- **Concepts:** Agentless architecture, Inventory files, Playbooks (YAML).
- **Hands-on:** Write an Ansible playbook to install Nginx on a local server or VM.

### Day 8: Container Orchestration (Kubernetes)
**Goal:** Manage containerized applications at scale.
- **Concepts:** Cluster architecture, Nodes, Pods, Services, Deployments.
- **Tools:** `kubectl`, Minikube or Kind.
- **Hands-on:** Deploy the app from Day 4 into a local Kubernetes cluster.

### Day 9: Monitoring & Observability
**Goal:** Keep an eye on system health and performance.
- **Tools:** Prometheus (Metrics), Grafana (Visualization).
- **Concepts:** Metrics, Logs, Traces, Alerts.
- **Hands-on:** Set up Grafana to visualize metrics from your Kubernetes cluster or Linux server.

### Day 10: Cloud Basics & Capstone Project
**Goal:** Tie everything together in the cloud.
- **Cloud:** Basics of AWS (EC2, S3, IAM) or Azure/GCP.
- **Capstone Project:**
    1.  Write a simple web app.
    2.  Containerize it (Docker).
    3.  Push code to GitHub.
    4.  Trigger a CI/CD pipeline (GitHub Actions).
    5.  Deploy to a Cloud Server or Kubernetes cluster.
    6.  Monitor it.

---

## 📚 Free Resources to Learn

### 📺 Best Hinglish (Hindi + English) YouTube Channels
These channels explain complex DevOps concepts in simple Hinglish, perfect for Indian learners.
- **[TrainWithShubham](https://www.youtube.com/c/TrainWithShubham)** - *Highly Recommended* for complete DevOps roadmaps and projects.
- **[Abhishek Veeramalla](https://www.youtube.com/@AbhishekVeeramalla)** - Excellent real-world DevOps projects and cloud tutorials.
- **[Technical Guftgu](https://www.youtube.com/c/TechnicalGuftgu)** - Great for AWS, Azure, and core infrastructure concepts in Hindi.
- **[CodeWithHarry](https://www.youtube.com/c/CodeWithHarry)** - Good for basics like Git, Linux, and Python.
- **[WsCube Tech](https://www.youtube.com/c/WsCubeTech)** - Offers full courses on Python, Ethical Hacking, and some DevOps tools.

### 🌍 Top Global Free Resources (English)
- **[TechWorld with Nana](https://www.youtube.com/c/TechWorldwithNana)** - The gold standard for Docker, K8s, and CI/CD visuals.
- **[FreeCodeCamp](https://www.youtube.com/c/Freecodecamp)** - Massive 10+ hour full courses on almost every topic.
- **[Kunal Kushwaha](https://www.youtube.com/c/KunalKushwaha)** - Deep dives into Cloud Native and Kubernetes.
- **[Hitesh Choudhary](https://www.youtube.com/c/HiteshChoudharydotcom)** - Great for understanding the "Why" behind tools (often in Hinglish too).

### 📖 Documentation & Interactive Learning
- **[Roadmap.sh/devops](https://roadmap.sh/devops)** - The ultimate interactive guide.
- **[Katacoda (O'Reilly)](https://www.oreilly.com/online-learning/katacoda.html)** - Interactive browser-based labs (if available) or **[Killercoda](https://killercoda.com/)**.
- **[Docker Labs](https://labs.play-with-docker.com/)** - Practice Docker in the browser.

Good luck on your journey! 🚀
