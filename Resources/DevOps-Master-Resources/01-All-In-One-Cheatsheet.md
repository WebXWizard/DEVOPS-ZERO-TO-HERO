# All-In-One DevOps Cheatsheet

## 1. Linux (Universal)
| Command | Description |
| :--- | :--- |
| `ls -la` | List all files (including hidden) with details. |
| `chmod +x script.sh` | Make a file executable. |
| `chown user:group file` | Change file owner. |
| `ps aux | grep java` | Find a running Java process. |
| `kill -9 <PID>` | Force kill a process. |
| `tar -czvf archive.tar.gz folder` | Compress a folder. |
| `curl -I http://example.com` | Check header response of a URL. |
| `top` / `htop` | Monitor system resources. |
| `df -h` | Check disk space usage. |

## 2. Git (Version Control)
| Command | Description |
| :--- | :--- |
| `git init` | Initialize a repo. |
| `git clone <url>` | Download a repo. |
| `git status` | Check what changed. |
| `git add .` | Stage all changes. |
| `git commit -m "msg"` | Save changes. |
| `git push origin main` | Upload to GitHub. |
| `git branch` | List branches. |
| `git checkout -b new-feat` | Create and switch to a new branch. |
| `git stash` | Temporarily save changes. |

## 3. Docker (Containers)
| Command | Description |
| :--- | :--- |
| `docker build -t app:v1 .` | Build an image from Dockerfile. |
| `docker run -d -p 80:80 nginx` | Run Nginx in background on port 80. |
| `docker ps` | List running containers. |
| `docker exec -it <id> bash` | Enter a container's shell. |
| `docker logs <id>` | View container logs. |
| `docker system prune` | Clean up unused data. |
| `docker-compose up -d` | Start services defined in compose file. |

## 4. Kubernetes (Orchestration)
| Command | Description |
| :--- | :--- |
| `kubectl get nodes` | Check cluster status. |
| `kubectl get pods` | List all pods. |
| `kubectl apply -f file.yaml` | Create/Update resources. |
| `kubectl delete -f file.yaml` | Delete resources. |
| `kubectl logs <pod-name>` | View logs of a pod. |
| `kubectl exec -it <pod> -- bash` | Enter a pod. |
| `kubectl get svc` | List Services. |

## 5. Terraform (IaC)
| Command | Description |
| :--- | :--- |
| `terraform init` | Initialize provider/backend. |
| `terraform plan` | specific what *will* happen. |
| `terraform apply` | Make it happen. |
| `terraform destroy` | Burn it all down. |
| `terraform fmt` | Auto-format your code. |

## 6. Ansible (Configuration Management)
| Command | Description |
| :--- | :--- |
| `ansible -m ping all` | Ping all servers in inventory. |
| `ansible-playbook site.yml` | Run a playbook. |
| `ansible-galaxy install <role>` | Install a role from Galaxy. |

## 7. Bash Scripting (The Glue)
- **Shebang**: `#!/bin/bash` (First line of every script).
- **Variables**: `NAME="John"` -> `echo $NAME`.
- **Condition**:
  ```bash
  if [ -f "/etc/passwd" ]; then
      echo "File exists"
  fi
  ```
- **Loop**:
  ```bash
  for i in {1..5}; do
      echo "Number $i"
  done
  ```

## 8. Prometheus (Monitoring)
| Query | Description |
| :--- | :--- |
| `up` | Is the target reachable? (1=yes, 0=no). |
| `rate(http_requests_total[5m])` | Rate of requests over last 5 mins. |
| `node_memory_MemAvailable_bytes` | Available memory on node. |
