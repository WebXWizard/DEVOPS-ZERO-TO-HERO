# 01 - Introduction to Docker

## What is Docker?
Docker is an open-source platform that automates the deployment, scaling, and management of applications inside lightweight, portable **containers**.

Think of Docker like a shipping container for software. Just as a physical shipping container allows any cargo to be transported on any ship, truck, or train without worrying about the contents, a Docker container allows any application to run on any infrastructure (laptop, cloud, server) without worrying about dependencies.

## Containers vs Virtual Machines (VMs)

| Feature | Containers (Docker) | Virtual Machines (VMs) |
| :--- | :--- | :--- |
| **Architecture** | Shares the host OS kernel. | Has its own full Guest OS on top of a Hypervisor. |
| **Size** | Lightweight (Megabytes). | Heavyweight (Gigabytes). |
| **Startup Time** | Seconds (or milliseconds). | Minutes. |
| **Isolation** | Process-level isolation. | OS-level strong isolation. |
| **Efficiency** | High (Uses less RAM/CPU). | Lower (Overhead of running full OS). |

**Analogy:**
- **VMs** are like separate houses. Each has its own plumbing, heating, and structure.
- **Containers** are like apartments in a complex. They share common infrastructure (plumbing/structure) but occupy their own private space.

## Docker Architecture

Docker uses a Client-Server architecture.

1.  **Docker Client (`docker` CLI):** The way you interact with Docker. You type commands like `docker build`, `docker run`. It sends these commands to the Docker Daemon.
2.  **Docker Daemon (`dockerd`):** The "brain" that runs on the host machine. It listens for API requests and manages Docker objects (images, containers, networks, volumes).
3.  **Docker Registry:** Stores Docker images.
    *   **Docker Hub:** The default public registry (like GitHub for images).
4.  **Docker Objects:**
    *   **Image:** A read-only template with instructions for creating a Docker container. (The "Recipe").
    *   **Container:** A runnable instance of an image. (The "Cake").

## Key Terminology
- **Host:** The machine where Docker is installed.
- **Image:** Frozen, immutable file (snapshot).
- **Container:** Running process of an image.
