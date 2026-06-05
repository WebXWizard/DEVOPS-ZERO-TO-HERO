# 🐳 Docker Compose — Complete Revision Guide

> **"Define once, run everywhere with a single command."** Master the declarative configuration of multi-container applications, network orchestration, and configuration management.

---

## 📖 What is Docker Compose?

**Docker Compose** is a tool for defining and running multi-container Docker applications. 
- With Compose, you use a YAML file (`docker-compose.yml`) to configure your application’s services, networks, and volumes.
- Instead of executing long, error-prone `docker run` commands for each container, you define the entire application stack declaratively and run:
  ```bash
  docker compose up -d
  ```

---

## 🏗️ Anatomy of `docker-compose.yml`

A typical `docker-compose.yml` file defines services, volumes, and networks. Here is an annotated example of a Node.js web service running with a MongoDB database:

```yaml
version: '3.8' # Declares Compose file format version

services: # Defines the list of containers (services) to run
  web:
    build: # Tells Docker to build an image from a local Dockerfile
      context: ./frontend
      dockerfile: Dockerfile
    image: my-react-app:v1 # Optional: Tag the built image
    ports:
      - "8080:80" # Maps host port 8080 to container port 80
    networks:
      - app-network # Connects container to the custom network
    depends_on:
      - api # Ensures the 'api' container starts before 'web'

  api:
    image: node:18-alpine # Uses an existing Docker Hub image
    working_dir: /usr/src/app
    command: npm start # Overrides default container CMD
    volumes:
      - .:/usr/src/app # Bind mount local code for live development
      - /usr/src/app/node_modules # Anonymous volume to protect node_modules
    ports:
      - "5000:5000"
    environment:
      - MONGO_URI=mongodb://db:27017/tasks # Environment variables
    networks:
      - app-network
    depends_on:
      - db

  db:
    image: mongo:6.0
    ports:
      - "27017:27017"
    volumes:
      - mongo-data:/data/db # Named volume for persistence
    networks:
      - app-network

volumes: # Define named volumes shared across services
  mongo-data:

networks: # Define custom bridge networks
  app-network:
    driver: bridge
```

---

## ⚙️ Core Configuration Options Explained

- **`build`**: Configures the build context and directory to construct a local container image instead of pulling one from Docker Hub.
- **`ports`**: Exposes container ports to the host machine.
- **`volumes`**: Sets up volume mounts (both bind mounts and named volumes).
- **`networks`**: Defines custom isolated networks. Containers on the same network can resolve each other by their service name (e.g. the API server connects to the database using the hostname `db`).
- **`environment`**: Defines system environment variables injected into the container processes.
- **`env_file`**: Reads environment variables from an external `.env` file to keep credentials out of Git.
- **`depends_on`**: Sequences service startup order (e.g. starts `db` before starting `api`).
- **`restart`**: Defines the restart policy (`always`, `unless-stopped`, `on-failure`).

---

## 🚀 Docker Compose CLI Commands

The Compose CLI has transitioned from `docker-compose` (legacy python script) to `docker compose` (integrated directly into the Docker CLI).

| Command | Purpose | Example |
|---|---|---|
| `docker compose up` | Build, create, and start all containers in the stack. | `docker compose up -d` |
| `docker compose down` | Stop and remove containers, networks, and images. | `docker compose down` |
| `docker compose down -v` | Stop containers and **delete associated volumes** (deletes databases!). | `docker compose down -v` |
| `docker compose ps` | List status of services inside the stack. | `docker compose ps` |
| `docker compose logs` | View aggregated logs from all services. | `docker compose logs -f` |
| `docker compose build` | Rebuild images defined with the `build` instruction. | `docker compose build` |
| `docker compose exec` | Execute a command inside a running service container. | `docker compose exec web sh` |
| `docker compose config` | Verify and validate compose file syntax and compile variables. | `docker compose config` |
| `docker compose restart` | Restart services. | `docker compose restart api` |

---

## 🎯 Interview Questions & Answers

### Q1: What is the primary purpose of Docker Compose?
**A:** Docker Compose is a tool for defining, running, and managing multi-container applications. It uses a single YAML file to describe all the services, networks, volumes, environment variables, and ports of an application stack, allowing developers to spin up the entire environment with a single command (`docker compose up`) instead of running multiple individual `docker run` commands.

### Q2: Explain how service names act as hostnames in Docker Compose.
**A:** When you start a stack with Docker Compose, it automatically creates a default user-defined bridge network. All services in the compose file join this network. The built-in Docker DNS server resolves the service names (e.g. `db`, `api`) directly to their respective container IP addresses. This allows a node backend container to connect to MongoDB using `mongodb://db:27017` instead of hardcoding IP addresses.

### Q3: What is the difference between `depends_on` and a container health check in Docker Compose?
**A:** 
- `depends_on` controls the **startup order** of containers (e.g., Docker starts the database container before the API server). However, it only waits until the database container is *running* as a process. It does not wait for the database to be *healthy* or ready to accept connections.
- To wait for a service to be fully ready, you must define a **healthcheck** in the database service and configure the depending service to wait for that health state:
```yaml
web:
  depends_on:
    db:
      condition: service_healthy
```

### Q4: How do you configure Docker Compose to read variables from a `.env` file?
**A:** By default, Docker Compose automatically searches for a file named `.env` in the directory where the `docker-compose.yml` file is located. Any variables defined in that `.env` file (e.g., `PORT=8080`) are automatically interpolated into the compose configuration using the `${PORT}` syntax.

### Q5: What is the difference between `docker compose down` and `docker compose stop`?
**A:**
- `docker compose stop` only halts the running containers. It preserves the container instances, networks, and data in memory/disk.
- `docker compose down` halts the running containers **and deletes** the containers, default network interfaces, and volume attachments created by `up`.

### Q6: How do you delete the databases and persistent volumes when shutting down a Compose stack?
**A:** You must pass the `-v` or `--volumes` flag to the `down` command:
```bash
docker compose down -v
```
This forces Docker to delete all named and anonymous volumes defined in the `docker-compose.yml` file, wiping out database states.

### Q7: How can you build and run containers with Docker Compose when you have modified your local Dockerfile?
**A:** By default, `docker compose up` will not rebuild images if they already exist. To force a rebuild and start the stack, run:
```bash
docker compose up -d --build
```
Or run `docker compose build` followed by `docker compose up -d`.

### Q8: What is the purpose of `docker-compose.override.yml`?
**A:** The `docker-compose.override.yml` is a special file that Docker Compose automatically merges with the base `docker-compose.yml` file. It is used to apply environment-specific configurations. For example, you can use the base file for production configurations, and use the override file to mount local source files and enable debug ports for local development.

### Q9: Can you scale a specific service in Docker Compose? How?
**A:** Yes, you can scale services (run multiple replica containers of a service) using the `--scale` flag:
```bash
docker compose up -d --scale worker=3
```
*Note: This will fail if the scaled service has a hardcoded host port collision. To scale, you must let host ports be mapped randomly (e.g. `-p 80`) or use a load balancer.*

### Q10: How do you validate the syntax of your `docker-compose.yml` file without running it?
**A:** You can validate the syntax and view the parsed configuration by running:
```bash
docker compose config
```
This parses the file, checks for indentation/syntax errors, expands environment variables, and prints the resolved configuration.

---

## 💡 Key Takeaways

```
✅ Docker Compose coordinates multi-container stacks declaratively.
✅ DNS name resolution is automatically mapped to service names.
✅ Use '.env' files to keep credentials secure and separate from code.
✅ 'depends_on' only waits for process startup, not service readiness.
✅ Always use 'docker compose down -v' when you want to wipe local databases and rebuild clean.
```

---

> 🚀 *"Compose is the bridge between containerizing single apps and orchestrating distributed production architectures."*