# 🚀 Deploy Website on Linux using Killercoda

A complete step-by-step guide to deploy a website on a Linux server using Killercoda Playground.

---

# 📌 Project Overview

This project demonstrates how to:

* Launch a Linux environment on Killercoda
* Install Apache Web Server
* Deploy a static website
* Configure permissions
* Access the website publicly

This project is perfect for beginners learning Linux and DevOps.

---

# 🛠️ Technologies Used

* Linux (Ubuntu)
* Apache2
* Killercoda
* HTML
* CSS
* JavaScript

---

# 🌐 What is Killercoda?

Killercoda is an interactive learning platform that provides real Linux and Kubernetes environments for hands-on practice.

---

# 📂 Project Structure

```bash
website/
│── index.html
│── style.css
│── script.js
```

---

# ⚙️ Step 1 — Open Killercoda

Visit:

```bash
https://killercoda.com/
```

Select:

```bash
Ubuntu Playground
```

---

# ⚙️ Step 2 — Update Linux Packages

```bash
sudo apt update && sudo apt upgrade -y
```

---

# ⚙️ Step 3 — Install Apache Web Server

```bash
sudo apt install apache2 -y
```

Check Apache status:

```bash
sudo systemctl status apache2
```

Enable Apache:

```bash
sudo systemctl enable apache2
```

---

# ⚙️ Step 4 — Start Apache Service

```bash
sudo systemctl start apache2
```

Verify:

```bash
sudo systemctl status apache2
```

---

# ⚙️ Step 5 — Navigate to Web Directory

```bash
cd /var/www/html
```

Remove default Apache page:

```bash
sudo rm index.html
```

---

# ⚙️ Step 6 — Upload Website Files

Create HTML file:

```bash
sudo nano index.html
```

Paste your HTML code and save.

(Optional)

```bash
sudo nano style.css
sudo nano script.js
```

---

# ⚙️ Step 7 — Set Permissions

```bash
sudo chmod -R 755 /var/www/html
```

```bash
sudo chown -R www-data:www-data /var/www/html
```

---

# ⚙️ Step 8 — Restart Apache

```bash
sudo systemctl restart apache2
```

---

# 🌍 Step 9 — Access Website

Click:

```bash
Traffic / Port 80
```

Killercoda will generate a public URL.

Example:

```bash
https://80-port-xxxxx.killercoda.com
```

---

# ✅ Deployment Successful

Your website is now live on Linux using Killercoda 🎉

---

# 🔥 Important Linux Commands Used

```bash
pwd
ls
cd
nano
chmod
chown
systemctl
apt
```

---

# 📚 Learning Outcomes

After completing this project, you will understand:

* Linux Basics
* Apache Web Server
* Website Deployment
* File Permissions
* Beginner DevOps Workflow

---

# 🚀 Future Improvements

* Deploy using Nginx
* Configure SSL
* Add Docker
* Implement CI/CD
* Reverse Proxy Setup

---

# 👨‍💻 Author

## Shahe Alam

* MERN Stack Developer
* DevOps Learner
* Linux Enthusiast

---

# ⭐ Support

If you found this project helpful:

```bash
⭐ Star this repository
🍴 Fork this repository
📢 Share with others
```

---

# 📜 License

This project is licensed under the MIT License.
