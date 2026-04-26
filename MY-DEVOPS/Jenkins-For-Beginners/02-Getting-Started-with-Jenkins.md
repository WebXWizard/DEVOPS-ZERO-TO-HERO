# 02 Getting Started with Jenkins

This guide covers the prerequisites and installation process for Jenkins.

## Prerequisites
Jenkins is a Java-based application. You need Java installed on your machine to run it.
- **Java Development Kit (JDK)**: JDK 11 or JDK 17 are the recommended Long Term Support (LTS) versions.
- **Hardware**: Minimum 256MB RAM (Recommended 1GB+), 1GB Drive space.

## Installation Options

### Option 1: Docker (Recommended for Learning)
If you have Docker installed, this is the cleanest way to run Jenkins.
```bash
docker run -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts
```
- Access Jenkins at `http://localhost:8080`

### Option 2: Windows Installer (MSI)
1. Download the Windows installer from the [official Jenkins website](https://www.jenkins.io/download/).
2. Run the `.msi` file.
3. Choose "Run service as LocalSystem" (easiest for beginners) or provide specific credentials.
4. Select port (default is `8080`).
5. Point to your JDK installation directory.

### Option 3: WAR File (Universal)
1. Download `jenkins.war` from the official site.
2. Open terminal/command prompt.
3. Run: `java -jar jenkins.war`
4. Access at `http://localhost:8080`

## First Time Setup (Post-Installation)

1. **Unlock Jenkins**:
   - Access `http://localhost:8080`.
   - You will see a screen asking for an **Administrator Password**.
   - **Where to find it?**
     - **Docker**: It is printed in the terminal logs on startup.
     - **Windows/Linux**: Look in the file path shown on the screen (usually `secrets/initialAdminPassword`).

2. **Customize Jenkins**:
   - Click **"Install suggested plugins"**.
   - This installs Git, Pipeline, and other essential tools automatically.

3. **Create First Admin User**:
   - Create your username and password. This will be your login for future sessions.

4. **Instance Configuration**:
   - Confirm the Jenkins URL (default `http://localhost:8080/`).

5. **Start using Jenkins!**
   - You will land on the main Dashboard.

---
*Next Step: [Jenkins Basics](./03-Jenkins-Basics.md)*
