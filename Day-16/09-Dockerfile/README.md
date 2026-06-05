# 🐳 Dockerfile — Complete Revision Guide

> **"A blueprint for your containerized application."** An in-depth guide to Dockerfile instructions, layer caching, multi-stage builds, and industry best practices.

---

## 📖 Anatomy of a Dockerfile

A **Dockerfile** is a text document containing all the commands a user could call on the command line to assemble a Docker image.

### Essential Instructions Reference

| Instruction | Purpose | Example |
|---|---|---|
| **`FROM`** | Sets the base image for subsequent instructions. Must be the first instruction. | `FROM node:18-alpine` |
| **`WORKDIR`** | Sets the working directory inside the container for any run, copy, cmd, entrypoint instructions. | `WORKDIR /usr/src/app` |
| **`COPY`** | Copies files/directories from the host build context into the container filesystem. | `COPY package*.json ./` |
| **`ADD`** | Similar to `COPY`, but can download from remote URLs and automatically extract tar archives. | `ADD source.tar.gz /app/` |
| **`RUN`** | Executes commands in a new layer and commits the results. Used for package installations. | `RUN npm install --production` |
| **`ENV`** | Sets environment variables that persist during build and execution runtime. | `ENV NODE_ENV=production` |
| **`ARG`** | Defines variables that users can pass at build-time (using `--build-arg`). Does not persist in running container. | `ARG VERSION=1.0.0` |
| **`EXPOSE`** | Documents the ports on which the container listens at runtime. Does not actually publish ports. | `EXPOSE 3000` |
| **`USER`** | Sets the username or UID to use when running the image (helps avoid running processes as root). | `USER node` |
| **`VOLUME`** | Creates a mount point with the specified name and marks it as holding externally mounted volumes. | `VOLUME ["/data"]` |
| **`CMD`** | Provides default arguments for an executing container. Can be overridden easily. | `CMD ["node", "app.js"]` |
| **`ENTRYPOINT`** | Configures a container that will run as an executable. Harder to override. | `ENTRYPOINT ["npm", "start"]` |

---

## 🆚 Critical Instruction Comparisons

### 1. `CMD` vs. `ENTRYPOINT`
- **`CMD`**: Defines default commands or arguments. If the user passes commands during `docker run`, they **completely override** the `CMD` instruction.
- **`ENTRYPOINT`**: Defines the executable. Arguments passed during `docker run` are **appended** to the `ENTRYPOINT` rather than overriding it.
- **Best Practice (Combined)**: Use `ENTRYPOINT` for the binary/service and `CMD` for the default parameters.
```dockerfile
ENTRYPOINT ["node"]
CMD ["server.js"]
```
*(If run as `docker run app debug.js`, it executes `node debug.js`).*

### 2. `COPY` vs. `ADD`
- **`COPY`**: Simple, transparent file copying. Recommended for 99% of use cases.
- **`ADD`**: Has magical behaviors (uncompressing local `.tar` files, fetching URLs). It increases image build complexity. Avoid using it unless you specifically need tar extraction.

---

## ⚡ Docker Layer Caching & Optimization

Docker builds images layer-by-layer. Each instruction in a Dockerfile creates a read-only layer. 

### Cache Invalidation Rule
If a layer's contents change, its cache is invalidated, and **all subsequent layers are rebuilt from scratch**.

### Optimized vs. Unoptimized Order
❌ **Unoptimized (Rebuilds everything on every code change):**
```dockerfile
FROM node:18
WORKDIR /app
COPY . .
RUN npm install     # This runs slowly on every tiny source code edit!
CMD ["node", "server.js"]
```

✅ **Optimized (Uses cache for `npm install` unless dependencies change):**
```dockerfile
FROM node:18
WORKDIR /app
COPY package*.json ./
RUN npm install     # Cached, runs only if package.json changes
COPY . .            # Re-runs only on code changes
CMD ["node", "server.js"]
```

---

## 🏗️ Multi-Stage Builds (Production Best Practice)

Multi-stage builds use multiple `FROM` statements in a single Dockerfile. They allow you to compile code in a heavy build environment, then copy only the compiled binaries/artifacts into a super-lightweight production runtime image.

### Example: Multi-Stage React App with Nginx
This reduces image size from ~1GB (Node build tools) to ~20MB (Nginx + static HTML).

```dockerfile
# Stage 1: Build/Compile
FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Production Server
FROM nginx:alpine
COPY --from=builder /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```

---

## 📝 The `.dockerignore` File

Similar to `.gitignore`. Prevents heavy or sensitive local files from being sent to the Docker daemon build context, speeding up builds and reducing image sizes.

**Example `.dockerignore`:**
```text
node_modules
npm-debug.log
.git
.github
Dockerfile
README.md
.env
dist
```

---

## 🎯 Interview Questions & Answers

### Q1: What is the purpose of the `.dockerignore` file?
**A:** The `.dockerignore` file prevents local files and directories (like `node_modules`, `.git`, log files, and build assets) from being sent as part of the build context to the Docker daemon. This reduces image build time, avoids caching issues, and prevents private credentials (like `.env` files) from accidentally leaking into image layers.

### Q2: What is a multi-stage build and why is it useful?
**A:** A multi-stage build uses multiple `FROM` statements in a single Dockerfile. It allows developers to compile/build their code in an initial stage containing compiler tools, and then copy only the finalized executable or production static assets into a subsequent, minimal runtime stage (e.g. `alpine` or `distroless`). This drastically reduces the size of the final production image and decreases its security vulnerability footprint.

### Q3: Explain the difference between CMD and ENTRYPOINT instructions.
**A:**
- `CMD` provides default commands or arguments for a container. If you run the container and specify commands (`docker run image <command>`), the `CMD` is completely overridden.
- `ENTRYPOINT` defines the permanent command that will run when the container starts. Any commands specified during `docker run` are appended as arguments to the `ENTRYPOINT` instead of overriding it.

### Q4: How does Docker caching work during image build?
**A:** Docker builds images layer-by-layer. For each instruction, Docker checks if a cached version of that layer already exists on the system. If the instruction and the input files are unchanged, it uses the cache. If a change is detected (cache invalidation), that layer and all subsequent layers are rebuilt from scratch.

### Q5: Why is it bad practice to run containers as the `root` user, and how do you fix it?
**A:** Running as `root` inside a container pose a security risk: if an attacker breaks out of the container, they could gain root privileges on the host system. This is resolved by using the `USER` instruction in the Dockerfile to run processes as a non-privileged user (e.g. `USER node` or creating a custom user).

### Q6: What is the difference between `COPY` and `ADD`?
**A:** Both copy files into the container. However:
- `COPY` is straightforward and only copies local files.
- `ADD` has advanced features: it can fetch files from remote URLs, and if the source is a recognized local tar archive, it automatically extracts/decompresses it into the target directory. `COPY` is preferred for safety and simplicity.

### Q7: How do you pass variables during the Docker build process?
**A:** Use the `ARG` instruction in the Dockerfile, and pass the value at build time using the `--build-arg` flag:
```dockerfile
# Dockerfile
ARG BUILD_ENV
ENV ENV_NAME=$BUILD_ENV
```
Build command:
```bash
docker build --build-arg BUILD_ENV=production -t app .
```

### Q8: What does the `EXPOSE` instruction actually do?
**A:** The `EXPOSE` instruction does **not** actually map or publish ports to the host machine. It functions purely as documentation between the image builder and the container runner, indicating which ports the application is configured to listen on inside the container. To actually publish the port, you must still use `-p` or `-P` during `docker run`.

### Q9: How can you minimize the size of a Docker image?
**A:**
1. Use minimal base images (e.g., `alpine`, `slim`, or `distroless`).
2. Utilize multi-stage builds.
3. Minimize the number of layers by chaining commands together (e.g., combining multiple `RUN apt-get` commands using `&&` and clearing cache in the same layer).
4. Use a `.dockerignore` file to omit unnecessary files from the build context.

### Q10: What is the difference between the shell form and exec form in Dockerfile instructions?
**A:**
- **Shell Form** (e.g. `CMD node app.js`): Executes the command inside a shell (`/bin/sh -c`). The shell runs as PID 1, and your process runs as a child. This means OS signals (like SIGTERM on `docker stop`) are not forwarded to your app.
- **Exec Form** (e.g. `CMD ["node", "app.js"]`): Executes the command directly as a JSON array without shell wrapping. Your application runs as PID 1, meaning it correctly receives OS termination signals and can shut down gracefully. **Exec form is the recommended best practice.**

---

## 💡 Key Takeaways

```
✅ Order instructions from least-frequently-changed to most-frequently-changed to leverage caching.
✅ Use Exec Form ["like", "this"] for CMD and ENTRYPOINT.
✅ Use Multi-stage builds to keep production images tiny and secure.
✅ Always run containers with non-root users in production.
✅ Prefer COPY over ADD unless tar extraction is required.
```

---

> 🚀 *"Write Dockerfiles as if your disk space and security compliance audit depend on it — because they do."*