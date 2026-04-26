# The DevOps Interview Question Bank

Master these, and you will pass 80% of junior/intern interviews.

## 1. General & Linux
1.  **Q: What is DevOps?**
    *A*: It's a culture, not a role. It bridges the gap between Dev (Developers) and Ops (Operations) to deliver software faster and more reliably.
2.  **Q: Explain the boot process of Linux.**
    *A*: BIOS -> MBR -> GRUB -> Kernel -> Init (systemd) -> Runlevel (Target).
3.  **Q: How do you check memory usage?**
    *A*: `free -h` or `top`.
4.  **Q: What is the difference between Soft Link and Hard Link?**
    *A*: Soft Link is a shortcut (points to filename). Hard link points to the physical inode (data). If you delete the original file, Soft Link breaks, Hard Link stays.

## 2. Git
5.  **Q: Git Merge vs Git Rebase?**
    *A*: `Merge` preserves history and creates a merge commit. `Rebase` rewrites history to make it linear (cleaner, but risky on shared branches).
6.  **Q: What is the difference between `git pull` and `git fetch`?**
    *A*: `Pull` = `Fetch` + `Merge`. Fetch downloads changes but doesn't integrate them.

## 3. Docker
7.  **Q: Docker Image vs Container?**
    *A*: Image is the Class (Blueprint). Container is the Object (Running Instance).
8.  **Q: What happens if you don't specify a `CMD` in Dockerfile?**
    *A*: It falls back to the base image's default command.

## 4. Kubernetes
9.  **Q: What is a Pod?**
    *A*: The smallest deployable unit. Usually runs one container.
10. **Q: Architecture of K8s?**
    *A*: Master (API Server, Scheduler, Etcd) and Worker Nodes (Kubelet, Kube-Proxy).
11. **Q: What is a Namespace?**
    *A*: A virtual cluster inside your cluster. Used to isolate resources (e.g., `dev` vs `broad`).

## 5. IaC (Terraform & Ansible)
12. **Q: Terraform vs Ansible?**
    *A*: Terraform is for **Provisioning** (building the server). Ansible is for **Configuration** (installing software on the server). Terraform = Building the house. Ansible = Furnishing it.
13. **Q: What is the Terraform State file?**
    *A*: `terraform.tfstate` keeps track of what resources Terraform created. It maps real-world IDs to your configuration. It is critical and sensitive.

## 6. Monitoring & Logging
14. **Q: Push vs Pull Monitoring?**
    *A*: **Prometheus** uses a PULL model (it goes to the app and scrapes metrics). **Datadog/NewRelic** use a PUSH model (agent sends metrics to central server).
15. **Q: What are the golden signals of monitoring?**
    *A*: Latency, Traffic, Errors, and Saturation.

## 7. CI/CD & Cloud
16. **Q: Explain "Blue/Green Deployment".**
    *A*: You have two identical environments (Blue=Live, Green=Idle). You deploy to Green, test it, and then switch the router to point to Green. Zero downtime.
17. **Q: What is IAM?**
    *A*: Identity and Access Management. Controls who can do what in AWS.
