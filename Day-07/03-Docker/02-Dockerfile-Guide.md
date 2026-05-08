# Dockerfile Guide

## Structure
A `Dockerfile` has no extension. Instructions are executed in order.

## Common Instructions

| Instruction | Description | Example |
| :--- | :--- | :--- |
| `FROM` | Base image (Start here) | `FROM ubuntu:latest` |
| `WORKDIR` | Set working directory | `WORKDIR /app` |
| `COPY` | Copy files from host to image | `COPY . .` |
| `ADD` | Copy + Extract/URL support | `ADD source dest` |
| `RUN` | Execute command during build | `RUN apt update` |
| `CMD` | Default command to run | `CMD ["python", "app.py"]` |
| `ENTRYPOINT` | Main executable of container | `ENTRYPOINT ["/bin/app"]` |
| `EXPOSE` | Document listening port | `EXPOSE 8080` |
| `ENV` | Set environment variables | `ENV APP_ENV=prod` |

## Example: Python Flask App

```dockerfile
# 1. Base Image
FROM python:3.9-slim

# 2. Set working dir
WORKDIR /app

# 3. Copy dependencies first (Caching layer)
COPY requirements.txt .

# 4. Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copy source code
COPY . .

# 6. Expose port
EXPOSE 5000

# 7. Run application
CMD ["python", "app.py"]
```

## Best Practices
1.  **Use specific tags**: Avoid `latest` in production (e.g., use `node:14-alpine`).
2.  **Minimize layers**: Combine `RUN` commands using `&&`.
3.  **Use .dockerignore**: Exclude unnecessary files (node_modules, git).
4.  **Run as non-root**: For security.
5.  **Multi-stage builds**: Reduce final image size.

## Multi-Stage Build Example
```dockerfile
# Stage 1: Build
FROM golang:1.16 AS builder
WORKDIR /app
COPY . .
RUN go build -o myapp

# Stage 2: Run (Small image)
FROM alpine:latest
WORKDIR /root/
COPY --from=builder /app/myapp .
CMD ["./myapp"]
```
