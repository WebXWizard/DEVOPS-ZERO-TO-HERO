# 🚀 Complete Revision (Day 1–14) — Cumulative Guide

> **"Repetition is the mother of all learning."** A complete synthesis of the curriculum covered from Day 1 to Day 14, summarizing Linux, Networking, Git, Bash scripting, and containerization.

---

## 📚 Curriculum Synopsis & Core Concepts

### Week 1: Linux & Networking (The Foundation)
- **Linux Administration**: The core operating system of cloud infrastructure. Essential topics include permission flags (`chmod`/`chown`), directory hierarchies (`/etc`, `/var`, `/opt`), process management (`systemctl`, `journalctl`), and server access (`SSH` key authorization).
- **Networking Core**: Understanding how packets move. Key concepts: IP addressing, DNS lookups, ports (22: SSH, 80: HTTP, 443: HTTPS), and diagnostics (`ping`, `curl`, `ss`, `netstat`, `nslookup`).
- **Website Deployment**: Hosting websites using web servers like Apache, Nginx, or IIS. Configuring server blocks, virtual hosts, and mapping them to domain configurations.

### Week 2: Git & Scripting (The Automation)
- **Version Control**: Tracking changes with Git. Focus areas: repository staging, commit histories, branching strategies (GitFlow), merging, pull request procedures, and resolving merge conflicts.
- **Bash Scripting**: Automating administrative work. Core elements: shebang headers (`#!/bin/bash`), variable declarations, conditional routing (`if`/`else`), execution loops (`for`/`while`), and output redirection (`>` / `>>`).
- **Monitoring Automation**: Building scripts to query resources (CPU load, memory thresholds, disk usage) and trigger alerts.

### Week 3: Containers & Docker (The Infrastructure)
- **Containerization**: Standardizing application runtimes. Using Docker to packaging files, libraries, and binaries to prevent environment discrepancy.
- **Dockerfile Design**: Designing image assembly instructions while leveraging layer caches and multi-stage pipelines to minimize final image size.
- **Docker Compose**: Running multi-container networks locally. Declarative definition of web, API, and database services with isolated bridges and persistent data mounts.

---

## ⚡ The Ultimate DevOps Command Cheat Sheet

### 1. Linux Operations
```bash
ls -la                         # List all files with permissions and size
chmod 400 key.pem              # Restrict permissions (Read-only for owner)
chown root:root file.txt       # Change owner and group
ps aux | grep node             # Find running Node processes
df -h                          # View disk space usage
free -m                        # View system memory in MB
systemctl status nginx         # Check Nginx service state
journalctl -u nginx -n 50      # View last 50 log lines for Nginx
```

### 2. Networking Diagnostics
```bash
ping google.com                # Check network connectivity
curl -I https://google.com     # Fetch HTTP header response
nslookup google.com            # Query DNS records
ss -tulnp                      # List all listening ports and their PIDs
traceroute google.com          # Map network route hops
```

### 3. Git Collaboration
```bash
git checkout -b feature/auth   # Create and switch to new branch
git add .                      # Stage all changed files
git commit -m "feat: auth"     # Commit staged changes
git push origin feature/auth   # Push branch to remote GitHub
git merge feature/auth         # Merge feature branch into current branch
git status                     # View current branch and changes status
```

### 4. Docker & Compose
```bash
docker build -t my-app:1.0 .   # Build image from local Dockerfile
docker run -d -p 8080:80 app   # Run container in background mapping ports
docker exec -it web bash       # Access running container's shell
docker logs -f web             # Stream container logs
docker system prune -a         # Delete all unused container data
docker compose up -d           # Start multi-container compose stack
docker compose down -v         # Stop stack and delete persistent volumes
```

---

## 🎯 Cumulative Revision Quiz (25 Questions)

### Q1: Explain the purpose of `/etc`, `/var`, and `/opt` directories in Linux.
**A:**
- `/etc`: Stores host-specific system configuration files (e.g., `/etc/passwd`, `/etc/nginx/nginx.conf`).
- `/var`: Stores variable data files that grow over time, such as logs (`/var/log`), caches, and spool files.
- `/opt`: Reserved for installing optional, third-party software packages (e.g., self-contained installations like Google Chrome or custom scripts).

### Q2: How do you make a Bash script executable and run it?
**A:**
1. Add the shebang line at the very top of the script: `#!/bin/bash`.
2. Give execution permissions using chmod: `chmod +x script.sh`.
3. Run the script from the terminal: `./script.sh`.

### Q3: What does the command `chmod 755 file.txt` mean?
**A:** It assigns read, write, and execute permissions to the file:
- **7 (Owner)**: Read (4) + Write (2) + Execute (1) = 7 (Full access).
- **5 (Group)**: Read (4) + Execute (1) = 5 (Read & Execute).
- **5 (Others)**: Read (4) + Execute (1) = 5 (Read & Execute).

### Q4: Explain the difference between symbolic links (soft links) and hard links.
**A:**
- **Soft Link (Symbolic Link):** A shortcut file that points to the filename of the target file. If the target file is deleted, the soft link becomes broken (dangling). Works across different file systems.
- **Hard Link:** A direct link that points to the target file's physical data block (inode). If the original file is deleted, the hard link still accesses the file data. Cannot span across different file systems.

### Q5: How do you troubleshoot a process running on port 8080 on a Linux server?
**A:**
1. Identify the process ID (PID) using port 8080: `ss -tulnp | grep :8080` or `lsof -i :8080`.
2. Check process details: `ps aux | grep <PID>`.
3. Monitor system performance: `top` or `htop`.
4. Check process system service logs: `journalctl -u <service_name>`.
5. Terminate the process if it's hung or duplicate: `kill -9 <PID>`.

### Q6: What is DNS, and what are A, CNAME, and MX records?
**A:** DNS (Domain Name System) translates human-readable domain names (e.g., `google.com`) into computer-readable IP addresses (e.g., `142.250.190.46`).
- **A Record**: Maps a domain name directly to an IPv4 address.
- **CNAME Record**: Maps a domain alias to another domain name (e.g., `www.example.com` to `example.com`).
- **MX Record**: Specifies the mail servers responsible for receiving email for the domain.

### Q7: Explain the difference between TCP and UDP protocols.
**A:**
- **TCP (Transmission Control Protocol):** Connection-oriented. Establishes a connection via a 3-way handshake before sending data. Ensures all packets arrive in order and error-free. Slow but reliable (used for HTTP, SSH, databases).
- **UDP (User Datagram Protocol):** Connectionless. Sends packets immediately without handshakes or delivery confirmation. Fast but prone to packet loss (used for video streaming, DNS, gaming).

### Q8: What does the SSH key generation process do? How do you copy public keys to a remote server?
**A:** SSH key generation (`ssh-keygen`) creates a cryptographic key pair: a **private key** (stored securely on your local computer) and a **public key** (shared with servers). You authorize access by copying your public key into the remote server's `~/.ssh/authorized_keys` file, typically using the tool:
```bash
ssh-copy-id -i ~/.ssh/id_rsa.pub user@remote-ip
```

### Q9: What is the difference between `git merge` and `git rebase`?
**A:**
- **`git merge`**: Combines branches by creating a new "merge commit" that ties the history of both branches together. It preserves the chronological order of commits, showing exactly when branches diverged and merged.
- **`git rebase`**: Rewrites commit history by moving all commits of the current branch on top of the target branch. It results in a clean, linear git history without extra merge commits, but alters commit hashes.

### Q10: How do you resolve a Git merge conflict?
**A:**
1. Git will halt during a merge and flag conflicting files. Run `git status` to locate them.
2. Open conflicting files and search for conflict markers (`<<<<<<< HEAD`, `=======`, `>>>>>>>`).
3. Manually edit the files to combine or select the desired code, removing the conflict markers.
4. Stage the resolved files: `git add <filename>`.
5. Finalize the merge: `git commit -m "Merge resolved"`.

### Q11: Explain the purpose of `git stash` and when you would use it.
**A:** `git stash` temporarily shelves (saves) uncommitted changes in your working directory (both staged and unstaged) so you can work on a different branch without committing incomplete work. You restore the changes later using `git stash pop`.

### Q12: How do you run a shell command inside a script and capture its output into a variable?
**A:** Use **command substitution** using the `$()` syntax:
```bash
CURRENT_DATE=$(date +%Y-%m-%d)
echo "Today is $CURRENT_DATE"
```

### Q13: What does the command `set -euo pipefail` do at the top of a Bash script?
**A:** It enforces strict error handling:
- `-e`: Exits the script immediately if any command returns a non-zero (error) status.
- `-u`: Exits the script if it references an undefined/unset variable.
- `-o pipefail`: Causes a pipeline (e.g. `cmd1 | cmd2`) to return the exit status of the first failing command, instead of hiding it behind the final command's success.

### Q14: Explain the difference between `>` and `>>` operators in Bash scripting.
**A:**
- `>` (Redirect Write): Redirects output to a file, **overwriting** any existing content.
- `>>` (Redirect Append): Redirects output to a file, **appending** it to the end of the file without deleting existing lines.

### Q15: How do you write a simple `for` loop in Bash to iterate from 1 to 5?
**A:**
```bash
for i in {1..5}; do
    echo "Iteration $i"
done
```

### Q16: What is a container image registry? Name three examples.
**A:** A registry is a cloud-based or self-hosted service that stores, versions, and distributes Docker/OCI container images. Examples:
1. Docker Hub (default public registry).
2. Amazon Elastic Container Registry (AWS ECR).
3. GitHub Container Registry (GHCR) / JFrog Artifactory.

### Q17: Why are Docker containers faster to start than Virtual Machines?
**A:** Virtual Machines require booting a complete Guest OS kernel, initializing virtual hardware drivers, and starting system services. Docker containers share the Host OS kernel directly and run as simple isolated processes. Starting a container is practically instant because it only involves executing a process, bypassing any OS boot sequence.

### Q18: What is a dangling image, and how do you remove it?
**A:** A dangling image is an image that has no name tag and is no longer associated with any container (often listed as `<none>:<none>`). They occur when you rebuild an image with an existing tag name. Remove them using:
```bash
docker image prune
```

### Q19: Explain the difference between executing commands using shell form vs exec form in a Dockerfile.
**A:**
- **Shell Form** (e.g. `RUN apt-get install nginx`): Runs the command inside `/bin/sh -c`. The shell runs as PID 1, preventing the application process from directly receiving OS signals like SIGTERM on shutdown.
- **Exec Form** (e.g. `RUN ["apt-get", "install", "nginx"]`): Runs the binary directly as a JSON array without shell wrapper, meaning the app runs as PID 1 and can handle graceful shutdowns.

### Q20: What is the difference between `docker run -p 8080:80` and `docker run -P`?
**A:**
- `docker run -p 8080:80` publishes a specific mapping: traffic hitting host port 8080 is routed to container port 80.
- `docker run -P` publishes all ports explicitly exposed by the `EXPOSE` instruction in the Dockerfile to random high-range ports (32768–60999) on the host.

### Q21: What is the difference between named volumes and bind mounts?
**A:**
- **Named Volumes** are managed by Docker inside `/var/lib/docker/volumes/` on Linux. They are decoupled from the host directory structure and are ideal for databases.
- **Bind Mounts** link a container directory directly to a specific folder on the host disk (e.g. `/home/user/code`). They are user-managed and best for local file sharing/live code reloading during development.

### Q22: How do containers communicate in Docker Compose by default?
**A:** Docker Compose automatically creates a default user-defined bridge network for the stack. Every service container joins this network. The containers can communicate securely with each other using their service names (defined in the YAML file) as DNS hostnames.

### Q23: What does the `--volumes` or `-v` flag do during `docker compose down`?
**A:** By default, `docker compose down` only deletes the containers and networks created by the stack, preserving the volumes. Passing `-v` or `--volumes` forces Docker Compose to **delete the associated named volumes** as well, permanently erasing any persistent database files or data.

### Q24: What is the difference between AWS Security Groups and AWS NACLs?
**A:** Security groups are **stateful** firewalls operating at the individual EC2 instance level. Network ACLs (NACLs) are **stateless** firewalls operating at the subnet level, inspecting both inbound and outbound traffic flowing across the subnet boundaries.

### Q25: How do you build an automated system health script in Bash?
**A:** By writing a shell script that checks system indicators:
- CPU: using `top -b -n1 | grep "Cpu(s)"`
- Memory: using `free -h`
- Disk: using `df -h`
And pipes the output to a log file or triggers email/webhook alerts if limits are exceeded, running the script on a schedule using `cron`.

---

## 💡 Key Takeaways of Days 1-14

```
✅ Linux permissions and process management underlay all server operations.
✅ Secure shell configuration (SSH) handles secure authentication.
✅ Git version control makes collaboration and continuous integration possible.
✅ Bash scripting replaces slow manual operations with reliable code automation.
✅ Networking knowledge is vital to debugging container networks and Cloud VPCs.
✅ Docker packages applications into portable containers, ending dependency conflicts.
✅ Docker Compose coordinates complex, multi-service topologies in a single YAML file.
```

---

> 🏆 **Congratulations on completing the first half of the DevOps Zero to Hero curriculum! Ready to proceed to Week 4 (CI/CD Pipelines, AWS deployments, and Terraform)?**
