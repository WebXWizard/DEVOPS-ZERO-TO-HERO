# Containerization (Docker) Study Guide

**Estimated Time**: 3-4 weeks

Docker revolutionized how applications are built, packaged, and shipped. It ensures that an application runs the same way in every environment, from a developer's laptop to a production server.

## Essential Concepts

### 1. Docker Installation and Setup
Installing the Docker Engine on various operating systems (Linux, Mac, Windows) and understanding the architecture (Daemon vs CLI).

### 2. Creating and Managing Images
Blueprints for containers:
- `docker pull`: Download an image from Docker Hub.
- `docker build`: Create an image from a Dockerfile.
- `docker images`: List all local images.
- `docker rmi`: Remove an image.
- **Tagging**: Versioning your images (e.g., `myapp:1.0`).

### 3. Running Containers
Instances of images:
- `docker run`: Create and start a container.
- `docker ps`: List running containers.
- `docker stop`: Gracefully stop a container.
- `docker rm`: Delete a container.
- `docker exec`: Run a command inside a running container (e.g., `docker exec -it mycontainer bash`).
- `docker logs`: View the output of a container.

### 4. Dockerfile Basics
Automating image creation:
- `FROM`: The base image (e.g., `node:14`, `ubuntu:latest`).
- `WORKDIR`: Set the starting directory inside the container.
- `COPY` & `ADD`: Transfer files from the host to the container.
- `RUN`: Execute commands during the build phase.
- `CMD` & `ENTRYPOINT`: Commands to run when the container starts.
- `EXPOSE`: Indicate which ports the container listens on.

### 5. Docker Compose
Managing multi-container applications:
- `docker-compose.yml`: A YAML file defining services, networks, and volumes.
- `docker-compose up`: Start all services defined in the file.
- `docker-compose down`: Stop and remove all services.
- Useful for local development environments (e.g., App + Database + Cache).

### 6. Container Networking
How containers communicate:
- **Bridge Network**: Default network for single containers.
- **Host Network**: Shares the host's networking stack.
- **Overlay Network**: For communication across multiple Docker hosts (Swarm/K8s).

### 7. Data Persistence
Saving data outside the container:
- **Volumes**: Managed by Docker, independent of the container's lifecycle.
- **Bind Mounts**: Maps a specific host directory to a container directory.

---
**Practical Challenge**: Write a Dockerfile for a simple web application, build the image, and run it as a container. Map port 8080 on your host to port 80 in the container and access it in your browser.
