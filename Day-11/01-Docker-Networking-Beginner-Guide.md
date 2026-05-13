# Docker Networking Beginner Guide

## 1. What Is Docker Networking?

Docker networking allows containers to communicate with:

- Other containers
- Your local machine
- The internet

Think of a container like a small computer. If you run two containers, they need a network to talk to each other, just like two real computers.

## 2. Why Do We Need Docker Networking?

Example:

- One container runs a web app
- Another container runs a database

The web app must connect to the database. Docker networking makes this possible.

Without networking, containers would be isolated and could not communicate easily.

## 3. Basic Network Types

### Bridge Network

This is the default network type for containers.

When you run a container normally, Docker places it on the default bridge network.

```bash
docker run -d --name web nginx
```

Bridge network is useful, but a custom bridge network is better for beginner projects because containers can talk to each other by container name.

### Custom Bridge Network

Create your own network:

```bash
docker network create app-network
```

Run a container inside this network:

```bash
docker run -d --name nginx-app --network app-network nginx
```

Now containers inside `app-network` can communicate with each other by name.

### Host Network

The container uses the host machine network directly.

```bash
docker run --network host nginx
```

This is less common for beginners and behaves differently on Docker Desktop.

### None Network

The container has no network access.

```bash
docker run --network none alpine
```

Use this when you want complete network isolation.

## 4. Important Networking Commands

List Docker networks:

```bash
docker network ls
```

Create a custom network:

```bash
docker network create my-network
```

Inspect a network:

```bash
docker network inspect my-network
```

Connect a running container to a network:

```bash
docker network connect my-network container-name
```

Disconnect a container from a network:

```bash
docker network disconnect my-network container-name
```

Remove a network:

```bash
docker network rm my-network
```

## 5. Beginner Example: Two Containers Talking

Create a network:

```bash
docker network create demo-network
```

Run an nginx container:

```bash
docker run -d --name web --network demo-network nginx
```

Run an alpine container on the same network:

```bash
docker run -it --name client --network demo-network alpine sh
```

Inside the alpine container, install curl:

```bash
apk add curl
```

Now call the nginx container by name:

```bash
curl http://web
```

If you see HTML output, networking is working.

## 6. Port Mapping vs Container Networking

These two things are different:

### Port Mapping

Port mapping exposes a container to your laptop/browser.

```bash
docker run -p 8080:80 nginx
```

Now you can open:

```text
http://localhost:8080
```

### Container-to-Container Networking

Containers talk to each other using names on the same Docker network.

Example:

```text
web-app connects to database using hostname: mongo
```

In Docker Compose, service names become hostnames automatically.

## 7. Common Beginner Mistakes

### Mistake 1: Using localhost inside a container

Inside a container, `localhost` means the container itself, not your laptop and not another container.

Wrong:

```text
mongodb://localhost:27017
```

Correct when using Docker Compose:

```text
mongodb://mongo:27017
```

Here `mongo` is the service name.

### Mistake 2: Forgetting to put containers on the same network

Containers must be on the same Docker network to communicate by name.

### Mistake 3: Confusing image name and container name

Container name is used for communication, not image name.

## 8. Quick Revision

- Docker networks allow containers to communicate.
- Custom bridge networks are best for beginner practice.
- Containers on the same custom network can talk by container name.
- Port mapping is for accessing a container from your machine.
- Docker Compose creates a network automatically.

