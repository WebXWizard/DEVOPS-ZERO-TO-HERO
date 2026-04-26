# 03 - Dockerfile Guide

A **Dockerfile** is a text file containing a list of commands (instructions) that the Docker client calls while building an Image. It automates image creation.

## Common Instructions

| Instruction | Description | Example |
| :--- | :--- | :--- |
| **`FROM`** | The base image to start from. Must be the first line. | `FROM node:14` |
| **`WORKDIR`** | Sets the working directory inside the container for subsequent commands. | `WORKDIR /app` |
| **`COPY`** | Copies files from your host machine to the container. | `COPY . .` (Copy all files) |
| **`RUN`** | Executes a command *during the build process* (e.g., installing dependencies). | `RUN npm install` |
| **`ENV`** | Sets environment variables. | `ENV PORT=3000` |
| **`EXPOSE`** | Informs Docker that the container listens on specific ports at runtime. Docs only. | `EXPOSE 3000` |
| **`CMD`** | The default command to run when the *container starts*. Only one CMD allowed. | `CMD ["node", "app.js"]` |

## Example: Python Flask App

Imagine you have a file `app.py` and `requirements.txt`.

**1. Create a file named `Dockerfile` (no extension):**

```dockerfile
# Step 1: Base Image
FROM python:3.9-slim

# Step 2: Set working directory
WORKDIR /app

# Step 3: Copy requirements file
COPY requirements.txt .

# Step 4: Install dependencies
RUN pip install -r requirements.txt

# Step 5: Copy application code
COPY . .

# Step 6: Expose port (Optional, good for documentation)
EXPOSE 5000

# Step 7: Define startup command
CMD ["python", "app.py"]
```

## Building the Image
Run this command in the same directory as your Dockerfile:

```bash
# Syntax: docker build -t <name>:<tag> <path>
docker build -t my-python-app:v1 .
```
*   `-t`: Tag (name) your image.
*   `.`: Look for Dockerfile in the current directory.
