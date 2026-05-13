# Docker Networking and Volumes Commands Cheat Sheet

## Networking Commands

```bash
docker network ls
docker network create app-network
docker network inspect app-network
docker network connect app-network container-name
docker network disconnect app-network container-name
docker network rm app-network
```

## Run Container on a Network

```bash
docker run -d --name web --network app-network nginx
```

## Test Container-to-Container Communication

```bash
docker run -it --name client --network app-network alpine sh
apk add curl
curl http://web
```

## Port Mapping

```bash
docker run -d -p 8080:80 --name web nginx
```

Open:

```text
http://localhost:8080
```

## Volume Commands

```bash
docker volume ls
docker volume create app-data
docker volume inspect app-data
docker volume rm app-data
docker volume prune
```

## Run Container with Named Volume

```bash
docker run -d --name mongo-db -v mongo-data:/data/db mongo
```

## Run Container with Bind Mount

PowerShell:

```powershell
docker run -d -v ${PWD}:/app --name dev-container nginx
```

Bash:

```bash
docker run -d -v "$(pwd)":/app --name dev-container nginx
```

## Docker Compose Basics

Start services:

```bash
docker compose up -d
```

View logs:

```bash
docker compose logs -f
```

Stop services:

```bash
docker compose down
```

Stop services and delete named volumes:

```bash
docker compose down -v
```

Use `down -v` carefully because it deletes project data.

