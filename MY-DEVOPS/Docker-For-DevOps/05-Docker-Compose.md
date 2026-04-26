# 05 - Docker Compose

**Docker Compose** is a tool for defining and running multi-container Docker applications. You use a YAML file to configure your application's services.

## The `docker-compose.yml` File

Example: running a Node.js web app connected to a Redis database.

```yaml
version: "3.8"  # Compose file version

services:
  web:
    build: .             # Build image from Dockerfile in current dir
    ports:
      - "5000:5000"      # Map ports
    volumes:
      - .:/code          # Bind mount for code
    depends_on:
      - redis            # Start redis before web

  redis:
    image: "redis:alpine" # Use image from Docker Hub
```

## Common Commands

Run these from the directory containing `docker-compose.yml`.

| Command | Description |
| :--- | :--- |
| **`docker-compose up`** | Builds, (re)creates, starts, and attaches to containers for a service. |
| **`docker-compose up -d`** | Starts containers in **detached** mode (background). |
| **`docker-compose down`** | Stops and **removes** containers, networks, images, and volumes created by `up`. |
| **`docker-compose ps`** | Lists containers related to this compose file. |
| **`docker-compose build`** | Rebuilds the services (useful if you changed the Dockerfile). |
| **`docker-compose logs -f`** | Follows log output from services. |

*Note: In newer Docker versions, `docker-compose` is replaced by `docker compose` (with a space).*
