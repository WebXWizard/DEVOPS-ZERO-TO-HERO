# Comprehensive Docker Guide - Day 09

## Table of Contents
1. [Introduction to Docker](#introduction-to-docker)
2. [What is a Dockerfile?](#what-is-a-dockerfile)
3. [Dockerfile Syntax & Instructions](#dockerfile-syntax--instructions)
4. [Best Practices](#best-practices)
5. [Multi-Stage Builds](#multi-stage-builds)
6. [Examples](#examples)
7. [Performance Optimization](#performance-optimization)
8. [Security Considerations](#security-considerations)
9. [Troubleshooting](#troubleshooting)
10. [Interview Questions](#interview-questions)

---

## Introduction to Docker

Docker is a containerization platform that packages your application and all its dependencies into a standardized unit called a container. A **Dockerfile** is a text file containing instructions to build a Docker image.

### Key Concepts:
- **Image**: A lightweight, standalone, executable package
- **Container**: A running instance of an image
- **Registry**: A repository where images are stored (Docker Hub, etc.)
- **Dockerfile**: Blueprint for creating images

---

## What is a Dockerfile?

A Dockerfile is a script containing a series of commands that Docker executes to build an image layer by layer. Each instruction creates a new layer, which improves caching and reduces build time.

### Example:
```dockerfile
FROM ubuntu:22.04
RUN apt-get update
COPY . /app
WORKDIR /app
CMD ["python", "app.py"]
```

---

## Dockerfile Syntax & Instructions

### 1. **FROM** - Base Image
Specifies the base image to build upon.

```dockerfile
FROM ubuntu:22.04
FROM alpine:3.17
FROM node:18-alpine
FROM python:3.11-slim
```

**Key Points:**
- Every Dockerfile must start with FROM (except when using ARG)
- Choose lightweight base images (alpine, slim, distroless)
- Specify version tags (avoid `latest`)

---

### 2. **RUN** - Execute Commands
Executes commands during the image build process.

```dockerfile
# Shell form (runs in /bin/sh -c)
RUN apt-get update && apt-get install -y curl

# Exec form (preferred)
RUN ["apt-get", "update"]

# Multi-line with backslash
RUN apt-get update && \
    apt-get install -y curl && \
    apt-get clean
```

**Best Practices:**
- Combine multiple commands with `&&` to reduce layers
- Clean up package manager cache
- Use `set -e` to fail on errors

---

### 3. **WORKDIR** - Set Working Directory
Sets the working directory for subsequent commands.

```dockerfile
WORKDIR /app
COPY . .
RUN npm install
```

**Key Points:**
- Automatically creates the directory if it doesn't exist
- All relative paths are relative to WORKDIR
- Use absolute paths

---

### 4. **COPY** - Copy Files/Directories
Copies files from the host to the image.

```dockerfile
# Copy single file
COPY package.json .

# Copy directory
COPY . /app

# Copy with ownership
COPY --chown=user:group . /app

# Copy from previous build stage
COPY --from=builder /app/dist ./dist
```

**vs. ADD:**
- COPY is preferred for most use cases
- ADD can handle URLs and auto-extract tar files (less predictable)

---

### 5. **ADD** - Advanced Copy
Similar to COPY but with additional features.

```dockerfile
# Download and add file
ADD https://example.com/file.tar.gz /app

# Auto-extract tar/tar.gz
ADD app.tar.gz /app
```

**Caution:** Use COPY unless you need URL download or tar extraction.

---

### 6. **ENV** - Environment Variables
Sets environment variables.

```dockerfile
ENV NODE_ENV=production
ENV DB_HOST=localhost \
    DB_PORT=5432
```

**Usage:**
```dockerfile
ENV DJANGO_SECRET_KEY=${SECRET_KEY}
RUN echo $NODE_ENV
```

---

### 7. **ARG** - Build Arguments
Defines variables available only during build.

```dockerfile
ARG PYTHON_VERSION=3.11
FROM python:${PYTHON_VERSION}

ARG BUILD_DATE
LABEL build.date=${BUILD_DATE}
```

**Usage:**
```bash
docker build --build-arg PYTHON_VERSION=3.10 .
```

**Difference from ENV:**
- ARG: Only available during build
- ENV: Available in running container

---

### 8. **EXPOSE** - Port Declaration
Documents which ports the container listens on.

```dockerfile
EXPOSE 8080
EXPOSE 3000 5000
```

**Note:** Does NOT publish ports (use `-p` flag when running).

---

### 9. **CMD** - Default Command
Sets the default command when container starts.

```dockerfile
# Shell form
CMD python app.py

# Exec form (preferred)
CMD ["python", "app.py"]

# Default parameters for ENTRYPOINT
CMD ["--port", "8080"]
```

**Key Points:**
- Only last CMD instruction is executed
- Can be overridden at runtime
- Use exec form to avoid shell overhead

---

### 10. **ENTRYPOINT** - Container Entry Point
Configures container as executable.

```dockerfile
ENTRYPOINT ["python"]
CMD ["app.py"]
```

**When running:**
```bash
docker run myapp --verbose  # Passes --verbose to python
```

---

### 11. **VOLUME** - Mount Point
Defines volumes for persistent data.

```dockerfile
VOLUME ["/data", "/logs"]
```

**Usage:**
```bash
docker run -v /my/data:/data myimage
```

---

### 12. **USER** - Execute as User
Runs subsequent commands as specified user.

```dockerfile
RUN useradd -m -u 1000 appuser
USER appuser

# Or directly reference
USER nobody
```

**Security:** Always avoid running as root.

---

### 13. **LABEL** - Metadata
Adds metadata to the image.

```dockerfile
LABEL maintainer="devops@example.com"
LABEL version="1.0"
LABEL description="My application"
LABEL org.opencontainers.image.source="https://github.com/..."
```

---

### 14. **HEALTHCHECK** - Container Health
Defines how Docker checks container health.

```dockerfile
HEALTHCHECK --interval=30s --timeout=10s --start-period=40s \
    CMD curl -f http://localhost:8080/health || exit 1
```

**Options:**
- `--interval`: Check interval (default 30s)
- `--timeout`: Health check timeout
- `--start-period`: Grace period before first check
- `--retries`: Failures before unhealthy

---

### 15. **SHELL** - Default Shell
Changes the default shell for RUN commands.

```dockerfile
SHELL ["/bin/bash", "-c"]
RUN echo "Running in bash"
```

---

## Best Practices

### 1. **Use Specific Base Image Tags**
```dockerfile
# ❌ Bad
FROM ubuntu
FROM node:latest

# ✅ Good
FROM ubuntu:22.04
FROM node:18.16.0-alpine
```

### 2. **Minimize Layers**
```dockerfile
# ❌ Bad - 4 layers
RUN apt-get update
RUN apt-get install -y curl
RUN apt-get install -y git
RUN apt-get clean

# ✅ Good - 1 layer
RUN apt-get update && \
    apt-get install -y curl git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
```

### 3. **Use .dockerignore**
```
# .dockerignore file
node_modules/
.git/
.gitignore
.env
*.log
.DS_Store
test/
coverage/
```

### 4. **Order Instructions Effectively**
```dockerfile
# Less frequently changed instructions first
FROM node:18-alpine

# Install dependencies
RUN apk add --no-cache python3 make g++

# Copy package files
COPY package*.json ./

# Install npm packages
RUN npm ci --only=production

# Copy application code
COPY . .

# Expose port
EXPOSE 3000

# Health check
HEALTHCHECK CMD npm run healthcheck

# Run application
CMD ["npm", "start"]
```

### 5. **Avoid Running as Root**
```dockerfile
FROM node:18-alpine

# Create user
RUN addgroup -g 1001 -S nodejs && \
    adduser -S nodejs -u 1001

# Switch to user
USER nodejs

COPY --chown=nodejs:nodejs . .
RUN npm install

CMD ["npm", "start"]
```

### 6. **Use Alpine for Smaller Images**
```dockerfile
# ❌ Larger image (~900MB)
FROM ubuntu:22.04
RUN apt-get update && apt-get install -y node

# ✅ Smaller image (~170MB)
FROM node:18-alpine
```

### 7. **Remove Unnecessary Files**
```dockerfile
RUN apt-get update && \
    apt-get install -y curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
```

### 8. **Use COPY Instead of ADD**
```dockerfile
# Preferred
COPY . /app

# Only use ADD if needed for URL download or tar extraction
ADD https://example.com/app.tar.gz /tmp/
```

---

## Multi-Stage Builds

Multi-stage builds reduce final image size by using intermediate stages.

### Use Case: Node.js Application

```dockerfile
# Stage 1: Build
FROM node:18-alpine AS builder

WORKDIR /app

COPY package*.json ./

RUN npm ci && \
    npm run build

# Stage 2: Runtime
FROM node:18-alpine

WORKDIR /app

# Copy only necessary files from builder
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package.json .

EXPOSE 3000

CMD ["node", "dist/index.js"]
```

### Use Case: Java Application

```dockerfile
# Stage 1: Build
FROM maven:3.8-openjdk-17 AS builder

WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Stage 2: Runtime
FROM openjdk:17-jdk-slim

WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar

EXPOSE 8080
HEALTHCHECK CMD curl -f http://localhost:8080/health

CMD ["java", "-jar", "app.jar"]
```

### Use Case: Python Application

```dockerfile
# Stage 1: Builder
FROM python:3.11-slim AS builder

WORKDIR /app
COPY requirements.txt .
RUN pip install --user --no-cache-dir -r requirements.txt

# Stage 2: Runtime
FROM python:3.11-slim

WORKDIR /app

# Copy Python packages from builder
COPY --from=builder /root/.local /root/.local
COPY . .

ENV PATH=/root/.local/bin:$PATH

CMD ["python", "app.py"]
```

---

## Examples

### 1. Simple Python Application

```dockerfile
FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000

HEALTHCHECK --interval=30s CMD curl -f http://localhost:5000/ || exit 1

CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
```

### 2. Node.js Express App

```dockerfile
FROM node:18-alpine

WORKDIR /app

COPY package*.json ./

RUN npm ci --only=production

COPY . .

EXPOSE 3000

HEALTHCHECK --interval=30s --timeout=3s CMD node healthcheck.js || exit 1

CMD ["node", "index.js"]
```

### 3. Go Application

```dockerfile
FROM golang:1.20-alpine AS builder

WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

FROM alpine:3.17
RUN apk --no-cache add ca-certificates
WORKDIR /root/

COPY --from=builder /app/main .

EXPOSE 8080

CMD ["./main"]
```

### 4. .NET Application

```dockerfile
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS builder

WORKDIR /app
COPY . .
RUN dotnet build -c Release

RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/runtime:7.0

WORKDIR /app
COPY --from=builder /app/out .

EXPOSE 8080

CMD ["dotnet", "MyApp.dll"]
```

---

## Performance Optimization

### 1. **Layer Caching**
Docker caches layers. Order instructions from least to most frequently changed:

```dockerfile
FROM node:18-alpine

# Rarely changed
RUN apk add --no-cache curl

# Sometimes changed
COPY package*.json ./
RUN npm ci

# Frequently changed
COPY . .

CMD ["npm", "start"]
```

### 2. **Reduce Image Size**
```dockerfile
# Check image size
docker images

# Use alpine variants
FROM node:18-alpine    # ~170MB
FROM node:18           # ~900MB+

# Remove unnecessary files
RUN rm -rf /var/lib/apt/lists/*
```

### 3. **Use BuildKit**
```bash
# Enable BuildKit
export DOCKER_BUILDKIT=1
docker build .

# Or in docker-compose
export COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1
docker-compose build
```

### 4. **Parallel Build Steps (with BuildKit)**
```dockerfile
# Syntax needed for advanced features
# syntax=docker/dockerfile:1.4

FROM node:18-alpine

# These can run in parallel with BuildKit
RUN --mount=type=cache,target=/var/cache/apk apk add --no-cache curl
RUN --mount=type=cache,target=/root/.npm npm cache clean --force
```

---

## Security Considerations

### 1. **Don't Run as Root**
```dockerfile
RUN useradd -m -s /sbin/nologin appuser
USER appuser
```

### 2. **Use Secrets Management**
```dockerfile
# ❌ Bad - secrets visible in history
ENV PASSWORD=secret123

# ✅ Good - use build secrets
RUN --mount=type=secret,id=github_token \
    git clone https://$(cat /run/secrets/github_token)@github.com/...
```

### 3. **Scan Images for Vulnerabilities**
```bash
# Install Trivy
sudo apt-get install -y trivy

# Scan image
trivy image myapp:latest
```

### 4. **Use Read-Only Root Filesystem**
```bash
docker run --read-only --tmpfs /tmp myimage
```

### 5. **Limit Resource Usage**
```bash
docker run --memory=512m --cpus=0.5 myimage
```

### 6. **Keep Base Images Updated**
```bash
# Check for updates
docker pull ubuntu:22.04

# Rebuild with latest base
docker build --no-cache .
```

### 7. **Use Security Scanning Tools**
- **Trivy**: Vulnerability scanner
- **Grype**: Vulnerability scanner
- **Snyk**: Dependency scanning
- **Docker Scout**: Supply chain security

---

## Troubleshooting

### 1. **Build Fails with "No such file or directory"**
```dockerfile
# Make sure file exists
COPY config.json .  # ✅ File must exist

# Use wildcards carefully
COPY src/ .         # ✅ Directory must exist
```

### 2. **Layer Caching Not Working**
```dockerfile
# Build without cache
docker build --no-cache .

# Or check history
docker image history myimage
```

### 3. **Port Not Accessible**
```dockerfile
EXPOSE 8080         # Only documents the port

# Run with port mapping
docker run -p 8080:8080 myimage
```

### 4. **Large Image Size**
```bash
# Analyze layers
docker history myimage --no-trunc

# Use multi-stage builds
# Remove unnecessary packages
# Use alpine base images
```

### 5. **Permission Denied Errors**
```dockerfile
RUN useradd -m appuser
USER appuser

# Or use chown
COPY --chown=appuser:appuser . /app
```

### 6. **Application Crashes in Container**
```bash
# Check logs
docker logs container_id

# Run interactively
docker run -it myimage /bin/sh

# Check entrypoint
docker inspect myimage | grep -A 5 Entrypoint
```

---

## Interview Questions

### Basic Questions

1. **What is a Dockerfile?**
   - A text file containing instructions to build a Docker image
   - Each instruction creates a layer
   - Layers are cached for faster builds

2. **What's the difference between ADD and COPY?**
   - COPY: Copies files from host to image (preferred)
   - ADD: Can also download URLs and extract archives

3. **Why use WORKDIR?**
   - Sets working directory for commands
   - Makes paths relative
   - Improves readability and maintainability

4. **What does EXPOSE do?**
   - Documents ports the container listens on
   - Does NOT actually publish ports
   - Use `-p` flag to publish

5. **Why avoid root user?**
   - Security vulnerability
   - Container compromises compromise host
   - Always use regular user with USER instruction

### Intermediate Questions

6. **What are multi-stage builds?**
   - Uses multiple FROM statements
   - Reduces final image size
   - Copy artifacts between stages
   - Useful for compiled languages

7. **What's the difference between CMD and ENTRYPOINT?**
   - CMD: Default command (can be overridden)
   - ENTRYPOINT: Fixed command (arguments passed to it)

8. **How does layer caching work?**
   - Each instruction creates a layer
   - Docker caches unchanged layers
   - Build from least to most frequently changed instructions

9. **What is .dockerignore?**
   - Excludes files from COPY/ADD
   - Reduces build context size
   - Improves build performance

10. **Why use Alpine base images?**
    - Much smaller size (5-30MB vs 100+MB)
    - Faster builds and pulls
    - Lower attack surface
    - Less dependencies

### Advanced Questions

11. **What are ARG and ENV differences?**
    - ARG: Build-time only, accessible via --build-arg
    - ENV: Runtime also, set in Dockerfile

12. **How to optimize Docker builds?**
    - Use alpine/slim variants
    - Multi-stage builds
    - Order instructions effectively
    - Remove unnecessary files
    - Use .dockerignore

13. **What is BuildKit?**
    - Modern build backend
    - Parallel build steps
    - Better caching
    - Secret management
    - Enable: `DOCKER_BUILDKIT=1`

14. **How to secure Dockerfiles?**
    - Don't run as root
    - Use secrets for sensitive data
    - Scan images for vulnerabilities
    - Keep base images updated
    - Use read-only filesystem

15. **How to troubleshoot Dockerfile issues?**
    - Check error messages carefully
    - Use `docker build --progress=plain` for detailed output
    - Run container interactively
    - Use `docker logs` for runtime issues
    - Review image history with `docker history`

---

## Quick Reference

### Dockerfile Template
```dockerfile
# syntax=docker/dockerfile:1.4

# Arguments
ARG BASE_IMAGE=node:18-alpine
ARG NODE_ENV=production

# Base image
FROM ${BASE_IMAGE}

# Metadata
LABEL maintainer="devops@example.com"
LABEL version="1.0"

# Set environment
ENV NODE_ENV=${NODE_ENV}
ENV PATH=/app/node_modules/.bin:$PATH

# Set working directory
WORKDIR /app

# Create non-root user
RUN addgroup -g 1001 -S nodejs && \
    adduser -S nodejs -u 1001

# Install dependencies
COPY package*.json ./
RUN npm ci --only=production && \
    npm cache clean --force

# Copy application
COPY --chown=nodejs:nodejs . .

# Switch to non-root user
USER nodejs

# Expose port
EXPOSE 3000

# Health check
HEALTHCHECK --interval=30s --timeout=3s \
    CMD node healthcheck.js || exit 1

# Run application
CMD ["node", "index.js"]
```

### Common Commands
```bash
# Build image
docker build -t myapp:1.0 .
docker build -t myapp:latest --build-arg NODE_ENV=production .

# Build without cache
docker build --no-cache .

# Build from stdin
docker build - < Dockerfile

# List images
docker images

# Remove image
docker rmi myapp:latest

# View image history
docker history myapp:latest

# Inspect image
docker inspect myapp:latest

# Push to registry
docker tag myapp:latest username/myapp:latest
docker push username/myapp:latest
```

---

## Summary

A Dockerfile is the foundation of containerization. Key points to remember:

✅ **DO:**
- Use specific base image tags
- Minimize layers
- Order instructions effectively
- Run as non-root user
- Use multi-stage builds
- Add health checks
- Add labels and metadata

❌ **DON'T:**
- Use latest tag in production
- Run as root
- Have large image sizes
- Ignore security
- Hardcode secrets
- Use unoptimized base images

Master Dockerfiles for efficient, secure, and production-ready containerization!
