# 03 Jenkins Basics

Once you are logged in, you need to understand the core components of the Jenkins Dashboard.

## 1. The Dashboard
The main screen lists all your **Projects** (or Jobs).
- **Status Column**: A "Weather" icon indicates the health of the build history (Sunny = All good, Stormy = Frequent failures).
- **Last Success/Failure**: Quick view of recent performance.

## 2. Managing Jenkins
Click on **"Manage Jenkins"** from the left sidebar. This is the control center. Important sections include:

### A. Plugins (`Manage Plugins`)
Jenkins is minimal by default; plugins give it power.
- **Available**: Search and install new plugins (e.g., "Docker", "Blue Ocean", "Slack Notification").
- **Installed**: View and update existing plugins.

### B. Security (`Manage Users` / `Configure Global Security`)
- **Manage Users**: Create new accounts for team members.
- **Configure Global Security**: Define *Authorization* (who can do what).
  - *Matrix-based security* is common: Admins can do everything, Developers can build/read, Viewers can only read.

### C. Nodes and Clouds (`Manage Nodes`)
- Configure "Agents" (Slaves) to run builds.
- You can add a new node (e.g., a Linux server) via SSH so Jenkins can run Linux-specific builds there.

## 3. Types of Jobs (Items)
When you click **"New Item"**, you see several options:

1.  **Freestyle Project**: The classic, GUI-based way to configure a build. Good for simple scripts but hard to version control.
2.  **Pipeline**: The modern standard. Describes the build process using code (`Jenkinsfile`).
3.  **Folder**: Group jobs together (e.g., "Frontend", "Backend").
4.  **Multibranch Pipeline**: Automatically creates pipelines for every branch in your Git repository.

---
*Next Step: [Jenkins Pipelines](./04-Jenkins-Pipelines.md)*
