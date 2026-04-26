# Networking and Infrastructure Services Study Guide

**Estimated Time**: 3-4 weeks

Infrastructure services like reverse proxies, load balancers, and caching are critical for the performance, scalability, and security of modern web applications. Nginx is the most popular tool for these tasks.

## Essential Concepts

### 1. Nginx as a Reverse Proxy
- **Reverse Proxy**: A proxy server that sits in front of a web server and forwards requests to it.
- **Upstream Servers**: The backend servers that the reverse proxy forwards requests to.
- **Proxy Pass**: Directing traffic from one URL to another backend service (e.g., `proxy_pass http://localhost:8080`).

### 2. Forward Proxies
- **Forward Proxy**: A proxy server that sits in front of one or more client machines and forwards requests to the internet.
- Useful for caching and access control in internal environments.

### 3. Caching with Redis or Varnish
- **Caching**: Storing frequently accessed data in memory to reduce server load and latency.
- **Redis**: In-memory data store for caching and session management.
- **Varnish**: High-performance caching server for HTTP traffic.

### 4. Load Balancing
- **Load Balancer**: A device that distributes incoming network traffic across multiple servers.
- **HAProxy**: High-performance TCP/HTTP load balancer.
- **AWS ELB (Elastic Load Balancer)**: Managed load balancing service for AWS resources.
- **Load Balancing Algorithms**: Round Robin, Least Connections, IP Hash.

### 5. Firewalls and Security Groups
- **iptables** & **UFW**: Linux-based firewalls for managing incoming/outgoing traffic.
- **Cloud Security Groups**: AWS/Azure-specific firewalls for controlling access to instances.

### 6. SSL/TLS Configuration
- **HTTPS**: Encrypted communication using SSL/TLS certificates.
- **Certificate Termination**: Decrypting HTTPS traffic at the load balancer or reverse proxy level.
- **Let's Encrypt**: Free and automated SSL/TLS certificates with `certbot`.

### 7. Troubleshooting Network Issues
- Diagnostic tools like `tcpdump`, `wireshark`, `curl`, and `netstat`.
- Analyzing log files (e.g., `access.log`, `error.log`) for errors and anomalies.

---
**Practical Challenge**: Set up a basic Nginx configuration that acts as a reverse proxy for a simple web server running on a non-standard port (e.g., Port 3000). Enable caching for static assets like images and CSS.
