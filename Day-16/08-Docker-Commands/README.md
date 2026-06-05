# 🐳 Docker Commands — Complete Revision Guide

> **"Theory is good, but commands build containers."** A structured handbook of CLI commands for container lifecycle, debugging, image management, and system cleanup.

---

## 🏗️ Docker CLI Syntax

Every Docker command follows a simple pattern:
```bash
docker <object> <command> [options]
```
For example: `docker container run -d nginx`. Older versions allowed shortcuts (e.g., `docker run -d nginx`), which still work but separating by object type is modern best practice.

---

## 🔄 Container Lifecycle Commands

Manage container states (Created, Running, Stopped, Paused, etc.).

| Command | Description | Example |
|---|---|---|
| `docker run` | Create and start a container | `docker run -d --name web -p 80:80 nginx` |
| `docker create` | Create a container but don't start it | `docker create --name db mysql` |
| `docker start` | Start a stopped container | `docker start web` |
| `docker stop` | Gracefully stop a running container (SIGTERM) | `docker stop web` |
| `docker restart` | Restart a container | `docker restart web` |
| `docker kill` | Forcefully kill a running container (SIGKILL) | `docker kill web` |
| `docker pause` | Pause all processes inside container | `docker pause web` |
| `docker unpause` | Resume paused container processes | `docker unpause web` |
| `docker ps` | List running containers | `docker ps` |
| `docker ps -a` | List all containers (running + stopped) | `docker ps -a` |
| `docker rm` | Remove a stopped container | `docker rm web` |
| `docker rm -f` | Forcefully remove a running container | `docker rm -f web` |

---

## 🖼️ Image Management Commands

Manage read-only images locally and on remote registries.

| Command | Description | Example |
|---|---|---|
| `docker images` | List local Docker images | `docker images` |
| `docker pull` | Download an image from Docker Hub | `docker pull redis:alpine` |
| `docker push` | Push an image to a registry | `docker push myusername/my-app:v1` |
| `docker build` | Build an image from a Dockerfile | `docker build -t my-app:v1 .` |
| `docker tag` | Reference an image with a new tag name | `docker tag my-app:v1 myusername/my-app:1.0` |
| `docker rmi` | Remove local image (must not be used by containers) | `docker rmi redis:alpine` |
| `docker history` | Show layers/history of an image | `docker history nginx` |
| `docker save` | Save an image to a tar archive | `docker save -o app.tar my-app:v1` |
| `docker load` | Load an image from a tar archive | `docker load -i app.tar` |

---

## 🔎 Troubleshooting & Inspection Commands

Commands used to look inside running containers and debug issues.

### 1. `docker logs`
Retrieve console output (stdout/stderr) from a container.
```bash
docker logs <container_name>          # View logs once
docker logs -f <container_name>       # Follow/stream logs in real-time
docker logs --tail 50 <container_id>  # View only the last 50 lines
```

### 2. `docker exec`
Execute a command inside a running container. Essential for opening terminal access.
```bash
# Open interactive shell (bash/sh) inside container
docker exec -it <container_name> bash
docker exec -it <container_name> sh
```

### 3. `docker inspect`
Get low-level system configuration info about containers, images, volumes, or networks in JSON format.
```bash
docker inspect web
# Filter specific property using Go templates
docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' web
```

### 4. `docker stats` & `docker top`
Monitor resources and process threads.
```bash
docker stats                         # Real-time resource stream (CPU, RAM, Net I/O)
docker top <container_name>          # List running processes inside container
```

---

## 🧼 Cleanup & Pruning Commands

Docker accumulates unused containers, images, networks, and volumes over time, taking up disk space.

```bash
docker system df                      # Show Docker disk usage details

docker container prune                # Remove all stopped containers
docker image prune                    # Remove dangling images (untagged)
docker image prune -a                 # Remove all unused images
docker volume prune                   # Remove all unused local volumes
docker network prune                  # Remove all unused networks

# THE ULTIMATE CLEANUP (Deletes everything unused/stopped)
docker system prune -a --volumes
```

---

## ⚡ Key Flags Cheat Sheet

* `-d` : Run container in **detached** mode (runs in background, returns container ID).
* `-it` : Run in **interactive** mode with a pseudo-TTY (`-i` keeps stdin open, `-t` allocates terminal).
* `-p <host_port>:<container_port>` : Publish container port to host (e.g., `-p 8080:80`).
* `-P` : Publish all exposed ports to random high ports on the host.
* `-v <host_path>:<container_path>` : Mount a volume or bind mount.
* `-e <KEY>=<VALUE>` : Inject environment variables.
* `--name <name>` : Assign custom name to the container.
* `--restart <policy>` : Container restart policy (`no`, `always`, `unless-stopped`, `on-failure`).
* `--rm` : Automatically remove the container when it exits.

---

## 🎯 Interview Questions & Answers

### Q1: What is the difference between `docker run` and `docker start`?
**A:** 
- `docker run` takes an **image** as an argument. It creates a brand-new container instance and starts it.
- `docker start` takes an existing, **stopped container (ID or Name)** as an argument and restarts it, retaining its previous state and logs.

### Q2: How do you access the shell of a running Docker container?
**A:** By using the `docker exec` command with interactive flags (`-i` keep stdin open, `-t` allocate TTY).
```bash
docker exec -it <container_name_or_id> bash
# If bash is not installed in the container (e.g. alpine images):
docker exec -it <container_name_or_id> sh
```

### Q3: What is the difference between `docker stop` and `docker kill`?
**A:**
- `docker stop` sends a **SIGTERM** signal, giving processes inside the container a grace period (default 10s) to clean up connections, save state, and exit gracefully. If it doesn't stop, a SIGKILL is sent.
- `docker kill` sends a **SIGKILL** signal immediately, stopping all processes abruptly without any cleanup time.

### Q4: How do you copy files between the host machine and a container?
**A:** Using the `docker cp` command. It works in both directions:
```bash
# Host to Container
docker cp /path/on/host.txt mycontainer:/app/destination.txt
# Container to Host
docker cp mycontainer:/app/logs.log /path/on/host/logs.log
```

### Q5: How do you resolve a "Port already allocated" error when starting a container?
**A:** This error occurs when the host port specified in your mapping is already in use by another service on the host. Solutions:
1. Stop the conflicting service on the host.
2. Stop and delete the other container using that port: `docker ps` to find it, then `docker stop <id>`.
3. Choose a different host port in the run command: e.g., run `docker run -d -p 8081:80 nginx`.

### Q6: What does the `--rm` flag do in `docker run`?
**A:** The `--rm` flag tells Docker to automatically remove the container's file system, metadata, and writeable layers as soon as it exits. This is useful for short-lived tasks, debugging commands, or testing, preventing stopped containers from piling up.

### Q7: Explain the difference between `docker rm` and `docker rmi`.
**A:**
- `docker rm` removes one or more **containers** (usually they must be stopped first).
- `docker rmi` removes one or more **images** from the host registry. You cannot delete an image if it is still being referenced by any container (even stopped ones).

### Q8: How can you check the logs of a container that crashed immediately upon starting?
**A:** Because the container was created, its logs still exist on the disk. Run `docker ps -a` to get the container ID of the exited container, then run:
```bash
docker logs <container_id>
```
Analyzing these logs will show the startup errors or missing dependencies that caused the crash.

### Q9: What does `docker system prune` do, and what are the risks?
**A:** `docker system prune` deletes stopped containers, unused networks, and dangling images (untagged images). 
- **Risk:** It does not delete volumes by default, but if you add `--volumes` (e.g., `docker system prune -a --volumes`), it will destroy all unused volumes, resulting in permanent data loss for databases or persistent apps that are not actively running.

### Q10: How do you build an image with a specific name and tag?
**A:** Use the `-t` (tag) option with `docker build`:
```bash
docker build -t myusername/my-app:v1.0.0 .
```
The `.` at the end tells Docker to search for the `Dockerfile` in the current working directory.

---

## 💡 Key Takeaways

```
✅ Detached mode (-d) runs containers in the background.
✅ Port publishing format is always -p <HostPort>:<ContainerPort>.
✅ Use 'docker exec' to inspect/interact with a container's internal shell.
✅ 'docker system prune' is your friend for reclaiming wasted disk space.
✅ Prefer container-centric CLI syntax: 'docker container <cmd>' and 'docker image <cmd>'.
```

---

> 🚀 *"Practice these commands until they become muscle memory. They are the keys to managing containerized infrastructure."*