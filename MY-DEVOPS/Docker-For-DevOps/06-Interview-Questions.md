# 06 - Docker Interview Questions (Beginner/Intern)

## Conceptual
1.  **What is the difference between a Container and a VM?**
    *   *Ans:* VM virtualizes hardware (has full OS). Container virtualizes the OS (shares kernel, lightweight).
2.  **What is a Docker Image?**
    *   *Ans:* A read-only template with instructions to create a container. It's built from a Dockerfile.
3.  **What is a Docker Container?**
    *   *Ans:* A runnable instance of an image. It is an isolated environment for the application.
4.  **Why use Docker?**
    *   *Ans:* Consistency (works on my machine = works on production), Isolation, Portability, Speed.

## Commands
5.  **How do you check running containers?**
    *   `docker ps`
6.  **How do you stop a specific container?**
    *   `docker stop <id>`
7.  **How do you remove a stopped container?**
    *   `docker rm <id>`
8.  **How do you view container logs?**
    *   `docker logs <id>`
9.  **How do you enter a running container?**
    *   `docker exec -it <id> bash`

## Dockerfile
10. **What is a Dockerfile?**
    *   *Ans:* Text document with commands to assembly an image.
11. **Explain `FROM`, `RUN`, `CMD`.**
    *   `FROM`: Base image.
    *   `RUN`: Execute cmd during build (e.g., install lib).
    *   `CMD`: Default cmd to run when container starts.
12. **What is the difference between `COPY` and `ADD`?**
    *   *Ans:* `COPY` copies local files. `ADD` can do that PLUS download from URLs and extract tar/zip files automatically. `COPY` is preferred unless you need `ADD`'s features.

## Storage & Networking
13. **Do containers persist data by default?**
    *   *Ans:* No. Use Volumes or Bind Mounts to save data.
14. **What is a Docker Volume?**
    *   *Ans:* Managed storage for persisting data outside the container lifecycle.
15. **What is Docker Compose?**
    *   *Ans:* Tool for running multi-container apps using a YAML config file.
