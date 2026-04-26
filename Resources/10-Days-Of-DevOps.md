# 🎓 DevOps Intern Interview Prep: 10-Day Crash Course

This roadmap is specifically designed to get you ready for a **DevOps Intern Interview**. It focuses on the *most asked questions* and the *core concepts* interviewers look for.

---

## 📅 The Strategy
*   **Days 1-3:** The "Must-Haves" (Linux, Network, Git). If you fail these, the interview is over.
*   **Days 4-6:** The "Core DevOps" (Docker, CI/CD, Cloud). This is where you show value.
*   **Days 7-9:** The "Bonus Points" (K8s, IaC, Monitoring). These make you stand out.
*   **Day 10:** The "Behavioral" (Soft skills, Projects).

---

## 🗓️ Day 1: Linux & Shell Scripting (The Bread & Butter)
**Focus:** You will live in the terminal. Prove you are comfortable there.

### 🔑 Key Concepts
*   **File Permissions:** `chmod`, `chown`, `777` vs `755`.
*   **Process Management:** `ps aux`, `top`, `kill`, `systemctl`.
*   **Text Processing:** `grep`, `awk`, `sed` (Basic usage).
*   **Networking Commands:** `curl`, `ping`, `netstat`, `ssh`.

### ❓ Common Interview Questions
1.  *How do you check which process is consuming the most memory?* (Ans: `top` or `htop`)
2.  *What does `chmod 755` mean?* (Ans: Owner: Read/Write/Exec, Group/Others: Read/Exec)
3.  *How do you find a specific string in a file?* (Ans: `grep "string" filename`)
4.  *How do you run a script in the background?* (Ans: Append `&` or use `nohup`)

### 🛠️ Daily Task
*   Write a bash script that checks if a website (e.g., google.com) is up. If it's down, print "Down", else print "Up".

### 📺 Recommended Watch (Hinglish)
*   **[Linux for DevOps Playlist (TrainWithShubham)](https://www.youtube.com/playlist?list=PLlfy9GnSVerQr-Se9JRE_tZJk3OUoHCkh)** - Complete Linux Masterclass Series.

---

## 🗓️ Day 2: Git & Version Control
**Focus:** Collaboration and code safety.

### 🔑 Key Concepts
*   **Branching Strategy:** Feature branches, Main/Master protection.
*   **The Three Trees:** Working Directory, Staging Area, Repository.
*   **Merge vs. Rebase:** When to use which.

### ❓ Common Interview Questions
1.  *What is the difference between `git merge` and `git rebase`?*
2.  *How do you resolve a merge conflict?*
3.  *What is a Pull Request (PR)?*
4.  *How do you revert a bad commit that has already been pushed?* (`git revert` vs `git reset`)

### 🛠️ Daily Task
*   Create a repo, make a "bug" on a branch, fix it, and merge it via a Pull Request on GitHub.

### 📺 Recommended Watch (Hinglish)
*   **[Git & GitHub Tutorial (CodeWithHarry)](https://www.youtube.com/watch?v=apGV9Kg7ics)** - Complete Git course in Hindi.

---

## 🗓️ Day 3: Networking Fundamentals
**Focus:** How data moves.

### 🔑 Key Concepts
*   **OSI Model:** Layers 4 (Transport - TCP/UDP) and 7 (Application - HTTP).
*   **DNS:** How `google.com` becomes `142.250.x.x`.
*   **HTTP Status Codes:** 200 (OK), 301 (Redirect), 403 (Forbidden), 404 (Not Found), 500 (Server Error).
*   **SSH:** Keys vs. Passwords.

### ❓ Common Interview Questions
1.  *What happens when you type google.com in your browser?* (The classic question!)
2.  *Difference between TCP and UDP?*
3.  *What is Localhost?* (127.0.0.1)
4.  *What is a port? Name the port for SSH, HTTP, HTTPS.* (22, 80, 443)

### 📺 Recommended Watch (Hinglish)
*   **[Kubernetes Networking (Technical Guftgu)](https://www.youtube.com/watch?v=Jp_y_i2N2aM)** - Understand Networking in a DevOps context.

---

## 🗓️ Day 4: Docker (Containerization)
**Focus:** "It works on my machine" is not an excuse.

### 🔑 Key Concepts
*   **Image vs. Container:** Class vs. Object.
*   **Dockerfile:** `FROM`, `RUN`, `CMD`, `ENTRYPOINT`, `EXPOSE`.
*   **Volumes:** Persisting data.

### ❓ Common Interview Questions
1.  *Difference between a Virtual Machine (VM) and a Container?* (OS kernel sharing)
2.  *What is the difference between `CMD` and `ENTRYPOINT`?*
3.  *How do you reduce the size of a Docker image?* (Multi-stage builds, Alpine images)

### 🛠️ Daily Task
*   Dockerize a simple "Hello World" Python or Node.js app using a `Dockerfile`.

### 📺 Recommended Watch (Hinglish)
*   **[Docker In One Shot (TrainWithShubham)](https://www.youtube.com/watch?v=sI9fA10N-I8)** - The most popular Docker video in Hindi.

---

## 🗓️ Day 5: CI/CD (Continuous Integration/Deployment)
**Focus:** Automation.

### 🔑 Key Concepts
*   **CI:** Build & Test automatically on every commit.
*   **CD:** Deploy automatically (or with approval).
*   **Tools:** GitHub Actions, Jenkins, GitLab CI.

### ❓ Common Interview Questions
1.  *Explain the CI/CD pipeline you used in your project.*
2.  *Why do we need CI/CD?* (Faster feedback, less manual error)
3.  *What is a "Build Artifact"?*

### 🛠️ Daily Task
*   Set up a GitHub Action that prints "Build Success" whenever you push code to your repo.

### 📺 Recommended Watch (Hinglish)
*   **[GitHub Actions Crash Course (CodeWithHarry)](https://www.youtube.com/watch?v=kC7xR2k-F4Y)** - Learn CI/CD with GitHub Actions.

---

## 🗓️ Day 6: Cloud Basics (AWS/Azure/GCP)
**Focus:** Pick ONE cloud provider (AWS is most common).

### 🔑 Key Concepts
*   **Compute:** EC2 (VMs).
*   **Storage:** S3 (Object Storage).
*   **Security:** IAM (Users, Roles, Policies).
*   **Networking:** VPC, Security Groups (Firewall).

### ❓ Common Interview Questions
1.  *What is an Availability Zone vs. a Region?*
2.  *How do you secure an EC2 instance?* (Security Groups, Private Keys)
3.  *What is S3 used for?*

### 📺 Recommended Watch (Hinglish)
*   **[AWS Cloud for Beginners (Technical Guftgu)](https://www.youtube.com/watch?v=k_x5pI3B-40)** - Excellent AWS introduction.

---

## 🗓️ Day 7: Infrastructure as Code (Terraform)
**Focus:** Automating infrastructure.

### 🔑 Key Concepts
*   **Declarative vs. Imperative:** "I want a server" vs. "Run these commands to make a server".
*   **State File:** `terraform.tfstate` (The holy grail).
*   **Commands:** `init`, `plan`, `apply`, `destroy`.

### ❓ Common Interview Questions
1.  *Why use Terraform instead of clicking in the AWS Console?* (Reproducibility, Version Control)
2.  *What is the Terraform State file?*

### 📺 Recommended Watch (Hinglish)
*   **[Terraform Zero to Hero Playlist (Abhishek Veeramalla)](https://www.youtube.com/playlist?list=PLdpzxOOAlwvI0O4PeKVV1-yJoX2AqIWuf)** - Best practical guide.

---

## 🗓️ Day 8: Kubernetes (K8s) Basics
**Focus:** Orchestration (Managing many containers). *Keep it basic for interns.*

### 🔑 Key Concepts
*   **Pod:** The smallest unit (one or more containers).
*   **Service:** Networking for Pods.
*   **Deployment:** Managing replicas of Pods.

### ❓ Common Interview Questions
1.  *What is a Pod?*
2.  *Difference between Docker Swarm and Kubernetes?*
3.  *What is `kubectl`?*

### 📺 Recommended Watch (Hinglish)
*   **[Kubernetes In One Shot (TrainWithShubham)](https://www.youtube.com/watch?v=X48QCf2LhU0)** - Simplified K8s architecture.

---

## 🗓️ Day 9: Monitoring & Troubleshooting
**Focus:** Fixing things when they break.

### 🔑 Key Concepts
*   **Metrics:** CPU, RAM usage (Prometheus).
*   **Logs:** Error messages (ELK Stack, CloudWatch).
*   **Alerting:** Getting paged when the site is down.

### ❓ Common Interview Questions
1.  *The server is slow. How do you debug it?* (Check logs, check `top`, check disk space `df -h`)
2.  *What is the difference between Logging and Monitoring?*

### 📺 Recommended Watch (Hinglish)
*   **[Prometheus & Grafana (TrainWithShubham)](https://www.youtube.com/watch?v=Fj2I6JmE1Yg)** - Monitoring setup guide.

---

## 🗓️ Day 10: Behavioral & The "Capstone" Talk
**Focus:** Selling yourself.

### 🗣️ Behavioral Questions (STAR Method)
*   *Tell me about a time you faced a technical challenge. How did you solve it?*
    *   **S**ituation: "I was deploying my app..."
    *   **T**ask: "The build failed..."
    *   **A**ction: "I checked the logs, found a version mismatch..."
    *   **R**esult: "I fixed the version in `package.json` and it deployed successfully."

### 🚀 Your "Elevator Pitch" Project
Have **one** project ready to explain in detail.
*   "I built a Python web app, containerized it with Docker, pushed it to GitHub, and used GitHub Actions to deploy it to an AWS EC2 instance."
*   *Know every step of this project.*

### 📺 Recommended Watch (Hinglish)
*   **[End to End DevOps Project (Abhishek Veeramalla)](https://www.youtube.com/watch?v=kYJz1_x5x_c)** - Watch this to build your capstone.

---

## 📚 Ultimate Resources for Success

### 📺 Best Hinglish YouTube Channels (Interview Focused)
*   **[TrainWithShubham](https://www.youtube.com/c/TrainWithShubham)** - *Must Watch.* His "DevOps Zero to Hero" playlist is famous. He also does mock interviews.
*   **[Abhishek Veeramalla](https://www.youtube.com/@AbhishekVeeramalla)** - Best for real-world scenarios and "Day in the life" type content.
*   **[Technical Guftgu](https://www.youtube.com/c/TechnicalGuftgu)** - Deep dives into AWS services in Hindi.
*   **[Cloud Champ](https://www.youtube.com/@CloudChamp)** - Great for quick tutorials and interview questions in Hindi.

### 📄 Resume Template for DevOps Interns
**Structure:**
1.  **Header:** Name, LinkedIn, GitHub, Portfolio (if any).
2.  **Skills:** (Group them!)
    *   *Cloud:* AWS (EC2, S3)
    *   *Tools:* Docker, Git, Jenkins
    *   *OS:* Linux (Ubuntu/CentOS)
    *   *Languages:* Python, Bash
3.  **Projects:** (The most important part)
    *   *Project Name:* "Automated Web Deployment"
    *   *Tech Stack:* Docker, AWS, GitHub Actions.
    *   *Bullet Point:* "Reduced deployment time by 80% using a CI/CD pipeline." (Use numbers!)
4.  **Education:** Degree, College.

**Pro Tip:** Keep it 1 page. No photos. Use a clean layout (e.g., [Overleaf Latex Templates](https://www.overleaf.com/gallery/tagged/cv) or [Canva Simple Resumes](https://www.canva.com/resumes/templates/simple/)).

### 💼 LinkedIn Optimization Checklist
*   **Headline:** "Aspiring DevOps Engineer | Docker | AWS | Linux Enthusiast" (Keywords matter!)
*   **About Section:** "Passionate about automation and cloud computing. Currently building projects with Docker and Kubernetes..."
*   **Featured Section:** Pin your best GitHub project and your Resume.
*   **Activity:**
    *   Post about what you learned today ("Day 1 of #10DaysOfDevOps: Learned about Linux permissions...").
    *   Connect with DevOps Engineers and Recruiters.

### 🌍 Global Resources
*   **[DevOps Interview Questions (GitHub)](https://github.com/bregman-arie/devops-exercises)** - *Gold Mine*
*   **[TechWithNana](https://www.youtube.com/c/TechWorldwithNana)** - Great for explaining concepts simply.
*   **[Hussein Nasser](https://www.youtube.com/c/HusseinNasser)** - Amazing for Networking/Backend engineering.

Good luck! You got this. 💼
