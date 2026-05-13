# Docker Volumes Beginner Guide

## 1. What Problem Do Volumes Solve?

Containers are temporary by default.

If you create a file inside a container and then remove that container, the file is also removed.

This is a problem for:

- Databases
- Uploaded files
- Logs
- Application data

Docker volumes solve this problem by storing data outside the container lifecycle.

## 2. What Is a Docker Volume?

A Docker volume is storage managed by Docker.

It can be attached to a container. Even if the container is deleted, the volume remains.

Simple idea:

```text
Container can be deleted
Volume keeps the data
```

## 3. Named Volume

A named volume has a clear name and is managed by Docker.

Create a volume:

```bash
docker volume create app-data
```

List volumes:

```bash
docker volume ls
```

Use a volume with a container:

```bash
docker run -d --name my-nginx -v app-data:/usr/share/nginx/html nginx
```

Here:

- `app-data` is the volume name
- `/usr/share/nginx/html` is the path inside the container

## 4. Bind Mount

A bind mount connects a folder from your computer to a folder inside the container.

Example:

```bash
docker run -d -v ${PWD}:/app nginx
```

Bind mounts are useful during development because changes on your laptop appear inside the container.

## 5. Volume vs Bind Mount

| Feature | Named Volume | Bind Mount |
|---|---|---|
| Managed by | Docker | You |
| Best for | Databases and persistent app data | Local development |
| Easy to move | Yes | Depends on host path |
| Beginner friendly | Yes | Yes, but path mistakes are common |

## 6. Important Volume Commands

Create volume:

```bash
docker volume create my-volume
```

List volumes:

```bash
docker volume ls
```

Inspect volume:

```bash
docker volume inspect my-volume
```

Remove volume:

```bash
docker volume rm my-volume
```

Remove unused volumes:

```bash
docker volume prune
```

Be careful with prune because it can delete data you may still need.

## 7. Beginner Example: Data Persistence

Create a volume:

```bash
docker volume create notes-data
```

Run an Ubuntu container and mount the volume:

```bash
docker run -it --name notes-container -v notes-data:/data ubuntu bash
```

Inside the container, create a file:

```bash
echo "My Docker volume note" > /data/note.txt
cat /data/note.txt
exit
```

Remove the container:

```bash
docker rm notes-container
```

Run a new container with the same volume:

```bash
docker run -it --name notes-container-2 -v notes-data:/data ubuntu bash
```

Check the file:

```bash
cat /data/note.txt
```

If the note is still there, the volume is working.

## 8. Volumes in Docker Compose

Docker Compose makes volumes easier:

```yaml
services:
  mongo:
    image: mongo
    volumes:
      - mongo-data:/data/db

volumes:
  mongo-data:
```

Here, MongoDB data is stored in the `mongo-data` named volume.

## 9. Common Beginner Mistakes

### Mistake 1: Thinking container data is permanent

Container files disappear when the container is removed unless you use a volume.

### Mistake 2: Mounting the wrong path

Every app stores data in a specific folder.

Examples:

- MongoDB stores data in `/data/db`
- MySQL stores data in `/var/lib/mysql`
- PostgreSQL stores data in `/var/lib/postgresql/data`

### Mistake 3: Deleting volumes accidentally

Commands like `docker volume rm` and `docker volume prune` can delete important data.

## 10. Quick Revision

- Containers are temporary.
- Volumes keep data safe outside containers.
- Named volumes are best for databases.
- Bind mounts are useful for local development.
- Docker Compose can define volumes in a simple way.

