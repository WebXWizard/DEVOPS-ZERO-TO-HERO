# Day 15 — Task Tracker (Node + MongoDB + Docker Compose)

This folder contains a minimal Task Tracker API and a Docker Compose setup to run it with MongoDB.

Quick start

1. Copy `.env.example` to `.env` and adjust if needed.

2. Build and run with Docker Compose:

```bash
docker compose up -d --build
```

3. Check services:

```bash
docker compose ps
```

4. API endpoints:

- `GET /` — health
- `GET /tasks` — list tasks
- `POST /tasks` — create { "title": "..." }

Notes

- Use `MONGO_URI` value `mongodb://mongo:27017/tasktracker` (service name `mongo` is resolvable inside the compose network).
- Mongo data is persisted in the `mongo-data` Docker volume.
