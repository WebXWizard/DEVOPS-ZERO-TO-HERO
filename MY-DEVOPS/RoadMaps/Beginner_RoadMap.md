# 🐢 Absolute Beginner's Guide to DevOps
**From Zero to Hero: A 4-Week Foundation Plan**

If you have **zero** prior experience with coding or servers, start here. This roadmap focuses on building a strong foundation before jumping into complex tools.

---

## 🗓️ Week 1: Computer & Web Fundamentals
**Goal:** Understand how computers and the internet actually work.

### 1. How the Internet Works
*   **Concepts:** Clients vs. Servers, IP Addresses, DNS (Phonebook of the internet), HTTP/HTTPS.
*   **Activity:** Open your browser's "Developer Tools" (F12) and look at the "Network" tab while loading a website.
*   **Resource:** [How the Internet Works in 5 Minutes](https://www.youtube.com/watch?v=7_LPdttKXPc)

### 2. OS Basics (Windows vs. Linux)
*   **Concepts:** What is an Operating System? File systems, Processes, Memory (RAM) vs. Storage (Disk).
*   **Activity:** Install **Git Bash** on Windows to get a feel for a Linux-like terminal.
*   **Resource:** [Operating Systems Basics](https://www.youtube.com/watch?v=vBURTt97ekY)

### 3. Basic HTML/CSS (The "Dev" part)
*   **Concepts:** Structure of a webpage. You don't need to be a pro, just understand what developers build.
*   **Activity:** Create a simple `index.html` file that says "Hello World" and open it in Chrome.
*   **Resource:** [HTML Crash Course](https://www.youtube.com/watch?v=qz0aGYrrlhU)

---

## 🗓️ Week 2: The Command Line & Linux
**Goal:** Stop using the mouse. The server world lives in the terminal.

### 1. The Terminal (CLI)
*   **Why?** Servers often don't have a screen or mouse. You control them with text commands.
*   **Commands:** `pwd` (Where am I?), `ls` (List files), `cd` (Change folder), `mkdir` (Make folder), `touch` (Create file).
*   **Activity:** Navigate your computer folders using only Git Bash.

### 2. Linux Permissions & Editors
*   **Concepts:** Root user (Administrator), Read/Write/Execute permissions.
*   **Tools:** `nano` or `vim` (Text editors inside the terminal).
*   **Activity:** Use `nano` to edit a text file inside the terminal.

### 3. Shell Scripting Basics
*   **Concepts:** Automating commands.
*   **Activity:** Write a script `hello.sh` that prints "Hello [Your Name]" when run.
*   **Resource:** [Linux Command Line for Beginners](https://www.youtube.com/watch?v=wBp0Rb-ZJak)

---

## 🗓️ Week 3: Version Control (Git)
**Goal:** Save your work like a pro and collaborate.

### 1. Git Basics
*   **Concept:** It's like a "Save Game" checkpoint system for code.
*   **Commands:** `git init`, `git add`, `git commit` (Save point).

### 2. GitHub
*   **Concept:** Storing your "Save Games" in the cloud.
*   **Activity:** Push your HTML file from Week 1 to a GitHub repository.
*   **Resource:** [Git & GitHub for Beginners](https://www.youtube.com/watch?v=RGOj5yH7evk)

---

## 🗓️ Week 4: Your First Deployment
**Goal:** Put a website on the internet for the world to see.

### 1. Cloud Basics
*   **Concept:** "The Cloud" is just someone else's computer.
*   **Provider:** AWS (Amazon) or DigitalOcean.
*   **Activity:** Create a Free Tier account on AWS.

### 2. Virtual Machines (EC2)
*   **Activity:** Launch a "Virtual Machine" (EC2 instance) on AWS. It's a remote Linux computer.

### 3. Deploy!
*   **Activity:**
    1.  SSH (Connect) into your AWS server from your home computer.
    2.  Install a web server (Apache or Nginx).
    3.  Copy your HTML file there.
    4.  Access it via the Public IP.

---

## 📚 Best Resources for Absolute Beginners

### 🎥 YouTube Channels (Hinglish & English)
1.  **[CodeWithHarry (Hindi)](https://www.youtube.com/c/CodeWithHarry)**
    *   *Start here.* Look for his "Linux in One Video" and "Git in One Video".
2.  **[Apna College (Hindi)](https://www.youtube.com/c/ApnaCollege)**
    *   Great for basic coding concepts (HTML/Python).
3.  **[NetworkChuck (English)](https://www.youtube.com/c/NetworkChuck)**
    *   *Highly Recommended.* He makes learning IT/Networking very exciting. Watch his "Linux for Hackers" series.
4.  **[Tech With Tim (English)](https://www.youtube.com/c/TechWithTim)**
    *   Good for Python basics.

### 📖 Interactive Websites
*   **[W3Schools](https://www.w3schools.com/)** - The dictionary for web concepts. Simple and easy.
*   **[Codecademy](https://www.codecademy.com/)** - Interactive coding lessons.

### 💡 Tips for Success
*   **Don't Rush:** Spend time understanding *what* a server is before trying to use Docker.
*   **Google Everything:** If you see an error, copy-paste it into Google. This is 90% of the job.
*   **Build Projects:** Don't just watch videos. You only learn when you type the commands yourself.
