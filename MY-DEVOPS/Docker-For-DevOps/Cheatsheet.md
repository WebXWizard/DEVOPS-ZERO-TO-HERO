# Docker Cheatsheet

## Basics
*   `docker version`: Version info.
*   `docker info`: System wide info.

## Images
*   `docker build -t <name> .`: Build from Dockerfile.
*   `docker pull <image>`: Pull from Hub.
*   `docker images`: List images.
*   `docker rmi <id>`: Delete image.

## Containers
*   `docker run -d -p <host>:<cont> --name <name> <image>`: Start container.
*   `docker ps`: Running containers.
*   `docker ps -a`: All containers.
*   `docker stop <id>`: Stop.
*   `docker start <id>`: Start.
*   `docker rm <id>`: Delete.
*   `docker logs <id>`: Show logs.
*   `docker exec -it <id> bash`: Enter container.

## System Clean up (Prune)
*   `docker system prune`: Remove unused data (stopped containers, unused networks, dangling images). **Use with caution!**

## Compose
*   `docker-compose up -d`: Start services.
*   `docker-compose down`: Stop and remove services.
*   `docker-compose logs -f`: View logs.
