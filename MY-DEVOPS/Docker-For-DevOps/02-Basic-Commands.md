# 02 - Basic Docker Commands

Make sure Docker is running before executing these commands!

## 1. Image Management
Commands to handle the "recipes".

*   **`docker pull <image_name>`**: Download an image from Docker Hub.
    ```bash
    docker pull nginx
    ```
*   **`docker images`**: List all images downloaded locally.
    ```bash
    docker images
    ```
*   **`docker rmi <image_id>`**: Remove (delete) an image.
    ```bash
    docker rmi a1b2c3d4e5f6
    ```

## 2. Container Management
Commands to handle the "running instances".

*   **`docker run <image_name>`**: Create and start a container.
    *   `-d`: Run in "detached" mode (background).
    *   `-p <host_port>:<container_port>`: Map ports.
    *   `--name <name>`: Give the container a custom name.
    ```bash
    # Run Nginx in background, map port 8080 on host to 80 on container
    docker run -d -p 8080:80 --name my-web-server nginx
    ```
*   **`docker ps`**: List *running* containers.
    ```bash
    docker ps
    ```
*   **`docker ps -a`**: List *all* containers (including stopped ones).
    ```bash
    docker ps -a
    ```
*   **`docker stop <container_id/name>`**: Gracefully stop a running container.
    ```bash
    docker stop my-web-server
    ```
*   **`docker start <container_id/name>`**: Start a stopped container.
    ```bash
    docker start my-web-server
    ```
*   **`docker rm <container_id/name>`**: Delete a *stopped* container.
    ```bash
    docker rm my-web-server
    ```
    *   *Tip: Use `docker rm -f` to force remove a running container.*

## 3. Debugging & Inspection
*   **`docker logs <container_id>`**: View the logs (output) of a container. essential for debugging.
    ```bash
    docker logs my-web-server
    ```
*   **`docker exec -it <container_id> bash`**: Enter inside a running container (like SSH).
    *   `-it`: Interactive terminal.
    *   `bash` (or `sh`): The shell to run inside.
    ```bash
    docker exec -it my-web-server bash
    # You are now inside the container! Type 'exit' to leave.
    ```
