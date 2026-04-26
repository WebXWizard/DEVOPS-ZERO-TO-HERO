# 04 - Storage and Networking

## Docker Storage
By default, data in a container is ephemeral (temporary). If you delete the container, the data is gone. To persist data (like databases), we use **Volumes**.

### 1. Docker Volumes (Recommended)
Managed by Docker. Stored in a part of the host filesystem owned by Docker (`/var/lib/docker/volumes/` on Linux).

*   **Create a volume:**
    ```bash
    docker volume create my-data
    ```
*   **Use a volume:**
    ```bash
    docker run -d -v my-data:/app/data --name db redis
    ```
    *   `-v my-data:/app/data`: Mount volume `my-data` to `/app/data` inside the container.

### 2. Bind Mounts
Maps a specific file or folder on your Host machine to the container. Great for development (live code updates).

*   **Usage:**
    ```bash
    docker run -d -v /path/on/host:/path/in/container nginx
    # Example (Windows path):
    docker run -d -v c:/Users/Project:/app nginx
    ```

## Docker Networking
How containers talk to each other and the outside world.

### 1. Bridge Network (Default)
Containers on the same bridge network can communicate. Isolated from the host.
*   **Create network:** `docker network create my-net`
*   **Run on network:** `docker run --network my-net ...`

### 2. Host Network
Removes network isolation between container and host. The container shares the host's networking namespace.
*   **Usage:** `docker run --network host ...` (Port mapping `-p` is ignored/not needed).

### 3. None
No networking. The container is completely isolated.
