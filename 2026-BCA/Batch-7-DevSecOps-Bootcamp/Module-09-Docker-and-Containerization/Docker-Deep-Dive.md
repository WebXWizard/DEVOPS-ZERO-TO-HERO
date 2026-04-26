# Module 9 | Docker & Containerization

Docker is a tool for creating, deploying, and running applications in containers. It defines how applications are packaged and shipped.

## 🐳 Virtualization vs Containerization

| Feature | Virtualization (VMs) | Containerization (Docker) |
| :--- | :--- | :--- |
| **Model** | Hardware Virtualization | OS Virtualization |
| **OS** | Independent Guest OS per VM | Shared Host OS Kernel |
| **Startup** | Minutes (Full OS boot) | seconds (Process startup) |
| **Size** | GBs (Full OS) | MBs (App + Libs) |
| **Efficiency**| High overhead | Low overhead |

## 📦 Understanding Docker Images and Containers

```mermaid
graph LR
    Code[Source Code: Python/Java] -- "docker build" --> Image[Docker Image: Snapshot]
    Image -- "docker run" --> Container[Docker Container: Running Instance]
    Container -- "docker stop" --> Image
```

## 📜 Dockerfile Best Practices

A **Dockerfile** is a text file with instructions for building a Docker image.

| Instruction | Use Case |
| :--- | :--- |
| **FROM** | Base image (e.g., `python:3.9-slim`). |
| **WORKDIR** | Setup working directory inside the container. |
| **COPY** | Copy local files into the container. |
| **RUN** | Command to execute during build (e.g., `pip install`). |
| **EXPOSE** | Document the port the app listens on. |
| **CMD** | Command to run when the container starts. |

## 🛠️ Docker Compose

Docker Compose is used to manage multi-container applications (e.g., App + MySQL + Redis).

```yaml
version: '3.8'
services:
  web:
    build: .
    ports: ["5000:5000"]
  db:
    image: postgres
    environment:
      POSTGRES_PASSWORD: mysecretpassword
```

| Command | Action |
| :--- | :--- |
| `docker-compose up` | Start all services defined in `docker-compose.yml`. |
| `docker-compose down` | Stop and remove all containers, networks, and images. |
| `docker-compose ps` | List running containers managed by Compose. |

## 🔗 Docker Networking

| mode | Description | Purpose |
| :--- | :--- | :--- |
| **Bridge** | Default network for single containers. | Isolate containers on a host. |
| **Host** | Shared network stack with the host. | High performance (avoid NAT). |
| **Overlay**| Multi-host communication. | Docker Swarm/K8s clusters. |
| **None** | No external networking. | Highly isolated processing. |

---
**Preparation Tip**: Be ready to explain why we use **".dockerignore"**.
- It prevents sensitive files (like `.env`) and bulky files (like `node_modules`) from being copied into the image.
- Reduces image size and improves security.
