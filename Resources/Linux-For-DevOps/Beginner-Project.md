# Beginner Project: Set Up a Web Server (CLI Only)

The ultimate test for a beginner: Can you host a website using only the black screen (Terminal)?

## 🎯 Objective
Install Nginx (a web server), customize the HTML page, and confirm it is running.

## ⚠️ Requirements
This requires a Linux machine (Ubuntu/Debian). If you are on Windows, you can use **WSL (Windows Subsystem for Linux)**.

## 🛠️ Step 1: Update and Install
1.  Open your terminal.
2.  Update package lists:
    ```bash
    sudo apt update
    ```
3.  Install Nginx:
    ```bash
    sudo apt install nginx -y
    ```

## 🚦 Step 2: Start the Service
1.  Start the server:
    ```bash
    sudo service nginx start
    ```
2.  Check status:
    ```bash
    sudo service nginx status
    ```
    (Press `q` to exit the status screen).

## 🌐 Step 3: Verify it Works
Open your web browser and go to `http://localhost`.
You should see "Welcome to nginx!".

## 📝 Step 4: Customize the Page
The default file lives in `/var/www/html/index.nginx-debian.html` (or similar). Let's maximize it.
1.  Navigate to the folder:
    ```bash
    cd /var/www/html
    ```
2.  Overwrite the file using a simple echo command (needs `sudo`):
    ```bash
    echo "<h1>Hello DevOps! This is my first Linux Server.</h1>" | sudo tee index.html
    ```

## Step 5: Refresh
Refresh your browser. You should see your custom message!

## 🎉 Congratulations!
You just provisioned a web server manually. In the real world, you would automate this script!
