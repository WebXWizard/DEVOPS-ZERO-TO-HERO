# 🌍 Website Deployment — Complete Revision Guide

> **Deployment = Making your application accessible to users over the internet.**

---

## 📖 What is Website Deployment?

Website deployment is the process of **publishing your website/application** to a server so that users can access it via a browser. It involves configuring web servers, domain names, SSL certificates, and networking.

---

## 🏗️ Types of Websites

| Type | Description | Examples | Server Needs |
|------|-------------|----------|--------------|
| **Static Website** | Fixed HTML/CSS/JS files, no backend | Portfolio, Landing pages | Nginx, Apache, S3 |
| **Dynamic Website** | Server-side processing, database | E-commerce, Social media | Node.js, Python, PHP + DB |
| **SPA** | Single Page Application (client-side rendering) | React, Angular, Vue apps | Nginx + API server |
| **SSR** | Server-Side Rendered | Next.js, Nuxt.js | Node.js server |

---

## 🖥️ Web Servers

### Nginx vs Apache

| Feature | Nginx | Apache |
|---------|-------|--------|
| **Architecture** | Event-driven, async | Process/thread-per-request |
| **Performance** | ✅ Better for static & high traffic | Good for dynamic content |
| **Memory** | ✅ Low memory usage | Higher memory usage |
| **Config** | Centralized (`nginx.conf`) | Distributed (`.htaccess`) |
| **Market** | Most popular (33%+ web) | Second most popular |
| **Best For** | Reverse proxy, load balancer | PHP apps, .htaccess |
| **Concurrency** | ✅ Handles 10K+ connections | Limited by threads |

---

## 🐧 Linux Deployment (Nginx) — Step by Step

### Step 1: Update System

```bash
sudo apt update && sudo apt upgrade -y
```

### Step 2: Install Nginx

```bash
sudo apt install nginx -y
```

### Step 3: Verify Installation

```bash
nginx -v                        # Check version
sudo systemctl status nginx     # Check service status
curl http://localhost            # Test locally
```

### Step 4: Configure Firewall

```bash
sudo ufw allow 'Nginx Full'    # Allow HTTP (80) + HTTPS (443)
sudo ufw allow 22               # Allow SSH
sudo ufw enable                 # Enable firewall
sudo ufw status                 # Verify rules
```

### Step 5: Deploy Website Files

```bash
# Default web root
ls /var/www/html/

# Copy your website files
sudo cp -r /path/to/your/website/* /var/www/html/

# Set proper ownership
sudo chown -R www-data:www-data /var/www/html/

# Set proper permissions
sudo chmod -R 755 /var/www/html/
```

### Step 6: Configure Nginx

```bash
sudo nano /etc/nginx/sites-available/default
```

**Basic Static Site Configuration:**

```nginx
server {
    listen 80;
    listen [::]:80;

    server_name yourdomain.com www.yourdomain.com;

    root /var/www/html;
    index index.html index.htm;

    location / {
        try_files $uri $uri/ =404;
    }

    # Enable gzip compression
    gzip on;
    gzip_types text/plain text/css application/json application/javascript;

    # Cache static assets
    location ~* \.(jpg|jpeg|png|gif|ico|css|js)$ {
        expires 30d;
        add_header Cache-Control "public, no-transform";
    }
}
```

**Node.js App (Reverse Proxy) Configuration:**

```nginx
server {
    listen 80;
    server_name yourdomain.com;

    location / {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_cache_bypass $http_upgrade;
    }
}
```

### Step 7: Test & Reload

```bash
sudo nginx -t                   # Test configuration syntax
sudo systemctl reload nginx     # Reload with new config
sudo systemctl restart nginx    # Full restart if needed
```

---

## 🔒 SSL/TLS Certificate Setup (Let's Encrypt)

### What is SSL/TLS?

SSL (Secure Sockets Layer) / TLS (Transport Layer Security) encrypts data between the browser and server, enabling HTTPS.

### Install Certbot (Free SSL)

```bash
# Install certbot
sudo apt install certbot python3-certbot-nginx -y

# Obtain and install certificate
sudo certbot --nginx -d yourdomain.com -d www.yourdomain.com

# Auto-renewal test
sudo certbot renew --dry-run

# Certificates are stored at:
# /etc/letsencrypt/live/yourdomain.com/fullchain.pem
# /etc/letsencrypt/live/yourdomain.com/privkey.pem
```

### Nginx HTTPS Configuration (Auto-generated)

```nginx
server {
    listen 443 ssl;
    server_name yourdomain.com;

    ssl_certificate /etc/letsencrypt/live/yourdomain.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/yourdomain.com/privkey.pem;

    root /var/www/html;
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }
}

# Redirect HTTP to HTTPS
server {
    listen 80;
    server_name yourdomain.com;
    return 301 https://$server_name$request_uri;
}
```

---

## 🪟 Windows Deployment (IIS) — Step by Step

### What is IIS?

IIS (Internet Information Services) is Microsoft's web server for Windows. It supports ASP.NET, PHP, and static websites.

### Step 1: Enable IIS

```
Control Panel → Programs → Turn Windows features on/off
✅ Check "Internet Information Services"
✅ Check "World Wide Web Services"
✅ Check "Web Management Tools"
→ Click OK → Wait for installation
```

Or via PowerShell:

```powershell
# Install IIS
Install-WindowsFeature -name Web-Server -IncludeManagementTools

# Verify installation
Get-WindowsFeature -name Web-*
```

### Step 2: Add Website

```
1. Open IIS Manager (inetmgr)
2. Right-click "Sites" → "Add Website"
3. Fill in:
   - Site name: MyWebsite
   - Physical path: C:\inetpub\wwwroot\mysite
   - Port: 80
   - Host name: yourdomain.com (optional)
4. Click OK
```

### Step 3: Configure Bindings

```
1. Select your website in IIS Manager
2. Click "Bindings" in the right panel
3. Add:
   - Type: http, Port: 80
   - Type: https, Port: 443 (with SSL certificate)
```

### Step 4: Test

```
Open browser → http://localhost → Your website appears
```

### IIS Important Paths

| Path | Purpose |
|------|---------|
| `C:\inetpub\wwwroot\` | Default web root |
| `C:\inetpub\logs\` | Log files |
| `web.config` | Site configuration |

---

## 🌐 Domain Name Setup

### How DNS & Domain Work Together

```
1. Buy domain from registrar (GoDaddy, Namecheap, Route53)
2. Point domain to your server IP using DNS records
3. Configure web server with the domain
```

### DNS Records to Configure

```
Type    Name              Value                 TTL
A       @                 YOUR_SERVER_IP        3600
A       www               YOUR_SERVER_IP        3600
CNAME   www               yourdomain.com        3600
```

---

## 🚀 Modern Deployment Platforms

| Platform | Best For | Free Tier | Deploy Method |
|----------|----------|-----------|---------------|
| **Vercel** | Next.js, React | ✅ Yes | Git push |
| **Netlify** | Static sites, JAMstack | ✅ Yes | Git push |
| **AWS EC2** | Full server control | ✅ 12 months | SSH + config |
| **AWS S3** | Static websites | ✅ Limited | Upload files |
| **DigitalOcean** | VPS (droplets) | ❌ Paid | SSH + config |
| **Railway** | Full-stack apps | ✅ Limited | Git push |
| **Render** | Full-stack apps | ✅ Limited | Git push |
| **GitHub Pages** | Static sites | ✅ Yes | Git push |

---

## 🔧 Nginx Commands Reference

```bash
# Service management
sudo systemctl start nginx     # Start Nginx
sudo systemctl stop nginx      # Stop Nginx
sudo systemctl restart nginx   # Restart Nginx
sudo systemctl reload nginx    # Reload config (graceful)
sudo systemctl status nginx    # Check status
sudo systemctl enable nginx    # Enable on boot

# Configuration
sudo nginx -t                  # Test config syntax
sudo nginx -T                  # Test and print config

# Logs
sudo tail -f /var/log/nginx/access.log   # Access logs (live)
sudo tail -f /var/log/nginx/error.log    # Error logs (live)

# Config files
/etc/nginx/nginx.conf                    # Main config
/etc/nginx/sites-available/              # Available sites
/etc/nginx/sites-enabled/               # Enabled sites (symlinks)
```

---

## 🐞 Troubleshooting Common Deployment Issues

| Issue | Cause | Solution |
|-------|-------|----------|
| **Site not loading** | Service not running | `sudo systemctl start nginx` |
| **403 Forbidden** | Permission issue | `sudo chmod -R 755 /var/www/html` |
| **502 Bad Gateway** | Backend not running | Check if Node.js/app is running |
| **Connection refused** | Port not open | `sudo ufw allow 80` |
| **404 Not Found** | Wrong root path | Check `root` in Nginx config |
| **SSL Error** | Certificate issue | Renew with `sudo certbot renew` |
| **Config error** | Syntax issue | Run `sudo nginx -t` to check |
| **Port already in use** | Another service | `sudo lsof -i :80` to find process |

### Debugging Checklist

```bash
# 1. Is the service running?
sudo systemctl status nginx

# 2. Is the port open?
ss -tulnp | grep :80

# 3. Is the firewall blocking?
sudo ufw status

# 4. Can you access locally?
curl http://localhost

# 5. Is the config correct?
sudo nginx -t

# 6. Check error logs
sudo tail -20 /var/log/nginx/error.log

# 7. Check app logs (for reverse proxy)
pm2 logs    # If using PM2
docker logs container_name  # If using Docker
```

---

## 📦 Process Managers for Node.js

### PM2 (Production Process Manager)

```bash
# Install
npm install -g pm2

# Start application
pm2 start app.js               # Start app
pm2 start app.js --name "api"  # With custom name
pm2 start app.js -i max        # Cluster mode (all CPUs)

# Management
pm2 list                       # List all processes
pm2 stop api                   # Stop process
pm2 restart api                # Restart process
pm2 delete api                 # Delete process
pm2 logs                       # View logs
pm2 monit                      # Monitor dashboard

# Startup (auto-start on reboot)
pm2 startup                    # Generate startup script
pm2 save                       # Save current processes
```

---

## ⚡ Deployment Cheat Sheet

| Step | Action | Command |
|------|--------|---------|
| 1 | Update server | `sudo apt update && sudo apt upgrade -y` |
| 2 | Install Nginx | `sudo apt install nginx -y` |
| 3 | Copy files | `sudo cp -r site/* /var/www/html/` |
| 4 | Set permissions | `sudo chown -R www-data:www-data /var/www/html/` |
| 5 | Configure Nginx | `sudo nano /etc/nginx/sites-available/default` |
| 6 | Test config | `sudo nginx -t` |
| 7 | Reload Nginx | `sudo systemctl reload nginx` |
| 8 | Open firewall | `sudo ufw allow 'Nginx Full'` |
| 9 | Install SSL | `sudo certbot --nginx -d domain.com` |
| 10 | Test | `curl https://yourdomain.com` |

---

## 🎯 Interview Questions & Answers

### Q1: What is Nginx?
**A:** Nginx is a high-performance, open-source web server that also serves as a reverse proxy, load balancer, and HTTP cache. It's known for its event-driven architecture, low memory usage, and ability to handle thousands of concurrent connections efficiently.

### Q2: What is the difference between Nginx and Apache?
**A:** Nginx uses an event-driven, asynchronous architecture and is better at handling high concurrency and static content. Apache uses a process/thread-per-request model and supports `.htaccess` for distributed configuration. Nginx is preferred for reverse proxy and load balancing, while Apache is popular for PHP applications.

### Q3: What is a Reverse Proxy?
**A:** A reverse proxy sits in front of backend servers and forwards client requests to them. Benefits: load balancing, SSL termination, caching, security (hides backend servers), and compression. Nginx is commonly used as a reverse proxy for Node.js apps.

### Q4: What is SSL/TLS and why is it important?
**A:** SSL/TLS encrypts data between the client browser and server, enabling HTTPS. It prevents eavesdropping, data tampering, and man-in-the-middle attacks. Let's Encrypt provides free SSL certificates. SSL operates on port 443.

### Q5: How do you deploy a Node.js app on Linux?
**A:**
1. Install Node.js and npm
2. Clone the app, run `npm install`
3. Start with PM2 (`pm2 start app.js`)
4. Install Nginx as reverse proxy
5. Configure Nginx to proxy_pass to `localhost:3000`
6. Set up SSL with Certbot
7. Open firewall ports

### Q6: What is the difference between Static and Dynamic deployment?
**A:**
- **Static**: HTML/CSS/JS files served directly by Nginx/Apache. No server-side processing. Fast, can be hosted on CDN/S3.
- **Dynamic**: Requires server-side runtime (Node.js, Python, PHP). Processes requests, interacts with databases, generates content dynamically.

### Q7: What is a CDN?
**A:** CDN (Content Delivery Network) is a distributed network of servers that delivers content to users from the nearest geographic location. It improves loading speed, reduces server load, and provides DDoS protection. Examples: CloudFlare, AWS CloudFront, Akamai.

### Q8: What port does HTTP and HTTPS use?
**A:** HTTP uses port **80**, HTTPS uses port **443**. In production, port 80 should redirect to port 443 (HTTP to HTTPS redirect).

### Q9: What is PM2 and why is it used?
**A:** PM2 is a production process manager for Node.js. It keeps apps running continuously, auto-restarts on crash, supports cluster mode for multi-core utilization, provides log management, and can auto-start apps on server reboot.

### Q10: What is the purpose of `proxy_pass` in Nginx?
**A:** `proxy_pass` forwards incoming requests to a backend server. For example, `proxy_pass http://localhost:3000;` forwards all requests to a Node.js app running on port 3000, allowing Nginx to handle SSL, caching, and load balancing.

### Q11: What is `try_files` in Nginx?
**A:** `try_files` tells Nginx to check for files in a specified order. `try_files $uri $uri/ =404;` means: first try the exact URI, then try it as a directory, and if neither exists, return a 404 error. Essential for SPAs: `try_files $uri $uri/ /index.html;`.

### Q12: How do you troubleshoot a website that's not loading?
**A:** Systematic approach:
1. Check if the web server is running (`systemctl status nginx`)
2. Verify port is open (`ss -tulnp | grep :80`)
3. Check firewall rules (`ufw status`)
4. Test locally (`curl localhost`)
5. Verify config (`nginx -t`)
6. Check error logs (`tail /var/log/nginx/error.log`)
7. Verify DNS points to correct IP (`nslookup domain.com`)

### Q13: What is the difference between `systemctl reload` and `systemctl restart`?
**A:**
- **reload**: Re-reads config without stopping the service. Zero downtime. Used after config changes.
- **restart**: Stops and starts the service. Brief downtime. Used after major changes or updates.

### Q14: What are Nginx virtual hosts / server blocks?
**A:** Server blocks (virtual hosts) allow Nginx to host multiple websites on a single server. Each server block defines a different `server_name` and `root` directory, routing traffic based on the requested domain name.

### Q15: What is zero-downtime deployment?
**A:** Deploying new code without any service interruption. Strategies include: Blue-Green deployment, Rolling updates, Canary deployment, and using load balancers to gradually shift traffic to new servers.

---

## 💡 Deployment Best Practices

```
✅ Always use HTTPS in production
✅ Use a reverse proxy (Nginx) for Node.js apps
✅ Use PM2 for Node.js process management
✅ Enable gzip compression for faster loading
✅ Set up proper file permissions (755 for dirs, 644 for files)
✅ Configure log rotation to prevent disk full
✅ Use environment variables for secrets (never hardcode)
✅ Set up auto-renewal for SSL certificates
✅ Monitor server resources (CPU, RAM, Disk)
✅ Always test configuration before reloading (nginx -t)
```

---

> 🚀 *"Deployment is not the end — it's the beginning of the next iteration."*