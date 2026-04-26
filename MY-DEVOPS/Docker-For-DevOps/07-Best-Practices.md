# 07. Docker Best Practices

To avoid common pitfalls and security issues, follow these best practices when working with Docker.

## 1. Use Official and Small Base Images
- **Why**: Official images (like `node:16` or `python:3.9`) are maintained by experts and scanned for vulnerabilities.
- **Tip**: Use `alpine` versions if possible (e.g., `python:3.9-alpine`). They are tiny (often <50MB) compared to standard images (>500MB), which makes builds faster and reduces the attack surface.

## 2. One Process Per Container
- **Why**: A container should do *one* thing well.
- **Bad**: Putting your Database, Web Server, and Background Worker all in one container.
- **Good**: Run them as separate containers and connect them using Docker Compose.

## 3. Don't Run as Root
- **Why**: By default, Docker containers run as the `root` user. If an attacker hacks your container, they might get root access to your host machine.
- **Fix**: Create a non-root user in your Dockerfile and switch to it using the `USER` instruction.

## 4. Use `.dockerignore`
- **Why**: Just like `.gitignore`, this file tells Docker what *not* to copy into the image.
- **Common exclusions**: `node_modules`, `.git`, `.env` (don't leak secrets!), temporary files.
- **Benefit**: Faster builds and smaller images.

## 5. Layer Caching
- **Why**: Docker caches each step. If you change your code, you don't want to re-install all dependencies every time.
- **Tip**: Copy your dependency files (like `package.json` or `requirements.txt`) *first*, install dependencies, and *then* copy your source code.
```dockerfile
# correct order
COPY package.json .
RUN npm install
COPY . .
```

## 6. Minimize Layers
- **Why**: Every `RUN`, `COPY`, and `ADD` instruction creates a new layer.
- **Tip**: Chain commands together to save space.
```dockerfile
# Bad
RUN apt-get update
RUN apt-get install -y git

# Good
RUN apt-get update && apt-get install -y git
```
