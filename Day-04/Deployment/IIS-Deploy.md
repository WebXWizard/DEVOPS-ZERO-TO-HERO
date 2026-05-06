# 🚀 Deploy Website on IIS Server (Windows)

A complete step-by-step guide to deploy a website using Internet Information Services (IIS) on Windows Server or Windows OS.

---

# 📌 Project Overview

This project demonstrates how to:

* Enable IIS on Windows
* Configure a website on IIS
* Deploy static website files
* Configure bindings and ports
* Access the website locally and publicly

Perfect for:

* DevOps Beginners
* Windows Server Learners
* Hosting Practice
* IIS Administration Practice

---

# 🛠️ Technologies Used

* Windows
* IIS (Internet Information Services)
* HTML
* CSS
* JavaScript

---

# 🌐 What is IIS?

Internet Information Services is a web server software created by Microsoft used for hosting websites and web applications on Windows servers.

---

# 📂 Project Structure

```bash id="t9wp9m"
website/
│── index.html
│── style.css
│── script.js
```

---

# ⚙️ Step 1 — Enable IIS in Windows

Open:

```bash id="8n2pkl"
Control Panel → Programs → Turn Windows Features On or Off
```

Enable:

```bash id="l9d7zx"
✔ Internet Information Services (IIS)
✔ Web Management Tools
✔ World Wide Web Services
```

Click:

```bash id="7z5xpv"
OK
```

Wait for installation to complete.

---

# ⚙️ Step 2 — Open IIS Manager

Press:

```bash id="zru3yv"
Windows + R
```

Type:

```bash id="8oj3mv"
inetmgr
```

Press Enter.

---

# ⚙️ Step 3 — Create Website Folder

Create a folder:

```bash id="n9a2c7"
C:\inetpub\mywebsite
```

Copy your website files into this folder.

Example:

```bash id="n31jlwm"
index.html
style.css
script.js
```

---

# ⚙️ Step 4 — Add Website in IIS

In IIS Manager:

```bash id="89zwy6"
Sites → Right Click → Add Website
```

Fill details:

| Field         | Value                |
| ------------- | -------------------- |
| Site Name     | MyWebsite            |
| Physical Path | C:\inetpub\mywebsite |
| Port          | 80                   |

Click:

```bash id="z2rc0o"
OK
```

---

# ⚙️ Step 5 — Start Website

Right-click your website:

```bash id="h3bovm"
Manage Website → Start
```

---

# ⚙️ Step 6 — Configure Firewall

Open:

```bash id="vme3hm"
Windows Defender Firewall
```

Allow:

```bash id="1z73l8"
Port 80 (HTTP)
```

---

# ⚙️ Step 7 — Access Website

Open browser:

```bash id="5mryyx"
http://localhost
```

Or:

```bash id="9y6jcb"
http://your-ip-address
```

---

# ✅ Deployment Successful

Your website is now successfully hosted on IIS 🎉

---

# 🔥 Important IIS Concepts

```bash id="8m0v0w"
IIS Manager
Application Pool
Bindings
Port Configuration
Physical Path
Website Hosting
```

---

# 📚 Learning Outcomes

After completing this project, you will understand:

* IIS Basics
* Windows Web Hosting
* Website Deployment
* Port Binding
* Firewall Configuration
* Beginner DevOps Workflow

---

# 🚀 Future Improvements

* Deploy ASP.NET Applications
* Configure HTTPS/SSL
* Add Reverse Proxy
* Setup Load Balancer
* Integrate CI/CD Pipeline
* Host Multiple Websites

---

# 👨‍💻 Author

## Shahe Alam

* MERN Stack Developer
* DevOps Learner
* Linux & Windows Server Enthusiast

---

# ⭐ Support

If you found this project helpful:

```bash id="8d8ftq"
⭐ Star this repository
🍴 Fork this repository
📢 Share with others
```

---

# 📜 License

This project is licensed under the MIT License.
