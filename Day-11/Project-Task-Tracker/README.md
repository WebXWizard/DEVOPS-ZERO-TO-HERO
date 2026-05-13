# Project: Docker Network and Volume Task Tracker

## Objective

Build and run a small Task Tracker app using:

- A Node.js Express container
- A MongoDB container
- A custom Docker network
- A named Docker volume for database persistence

This project teaches the real-world reason for Docker networking and Docker volumes.

## Architecture

```text
Browser
  |
  | http://localhost:3000
  |
Node.js app container
  |
  | mongodb://mongo:27017/tasktracker
  |
MongoDB container
  |
Docker volume: mongo-data
```

## Project Structure

```text
Project-Task-Tracker/
|-- app.js
|-- package.json
|-- Dockerfile
|-- docker-compose.yml
|-- .dockerignore
`-- README.md
```

## How Networking Is Used

The app connects to MongoDB using this URL:

```text
mongodb://mongo:27017/tasktracker
```

`mongo` is the Docker Compose service name. Docker Compose creates a network automatically and allows the app container to reach the database container by this name.

## How Volumes Are Used

MongoDB stores database files inside:

```text
/data/db
```

The Compose file maps this path to a named volume:

```yaml
volumes:
  - mongo-data:/data/db
```

This means your tasks remain saved even if the MongoDB container is removed.

## Run the Project

Open terminal in this folder:

```bash
cd Day-11/Project-Task-Tracker
```

Start the app:

```bash
docker compose up -d --build
```

Open in browser:

```text
http://localhost:3000
```

## Test the App

Add a task:

```bash
curl -X POST http://localhost:3000/tasks -H "Content-Type: application/json" -d "{\"title\":\"Learn Docker Networking\"}"
```

List tasks:

```bash
curl http://localhost:3000/tasks
```

## Prove the Volume Works

Stop and remove the containers:

```bash
docker compose down
```

Start again:

```bash
docker compose up -d
```

Open the app again or run:

```bash
curl http://localhost:3000/tasks
```

Your old task should still be there because MongoDB data is stored in the `mongo-data` volume.

## Useful Commands

View running containers:

```bash
docker compose ps
```

View logs:

```bash
docker compose logs -f
```

Inspect project network:

```bash
docker network ls
docker network inspect project-task-tracker_task-network
```

List volumes:

```bash
docker volume ls
```

Stop containers:

```bash
docker compose down
```

Stop containers and delete database volume:

```bash
docker compose down -v
```

Use `docker compose down -v` only when you want to delete all saved tasks.

## Mini Challenges

1. Add three tasks and confirm they appear in the browser.
2. Run `docker compose down`, then start again and confirm tasks are still saved.
3. Run `docker compose down -v`, start again, and notice the tasks are gone.
4. Change the host port from `3000:3000` to `8080:3000` and open `http://localhost:8080`.
5. Use `docker compose logs -f app` to watch app logs.

