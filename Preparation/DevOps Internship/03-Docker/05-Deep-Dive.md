# Docker Deep Dive & Internals

## 1. The Technology Behind Containers

Containers are not "real" objects. They are a combination of Linux Kernel primitives:

### Namespaces (Isolation)
Provides the "view" of the system.
*   **PID**: Process isolation.
*   **NET**: Network stack (IPs, Ports).
*   **MNT**: Filesystem mount points.
*   **UTS**: Hostname.
*   **IPC**: Inter-Process Communication.
*   **USER**: User ID mapping.

### Cgroups (Control Groups - Resource Limiting)
Controls **how much** of a resource a container can use.
*   **CPU**: Limit % or cores (`--cpus=0.5`).
*   **Memory**: Limit RAM (`--memory=512m`). If exceeded -> OOM Killed.
*   **Blkio**: Disk I/O limits.

### Union File Systems (UFS)
How Docker images are built.
*   **CoW (Copy on Write)**: Images are read-only layers. When a container writes a file, it copies it up to the writable top layer.
*   **Storage Drivers**: Overlay2 (standard), AUFS (legacy), Btrfs, DeviceMapper.

## 2. Advanced Networking

### Network Drivers
1.  **Bridge (Default)**: Creates a virtual bridge (`docker0`). Containers get internal IPs. NAT is used for outbound access. Port mapping required for inbound.
2.  **Host**: Removes network isolation. Container shares host's IP/Ports. Fast performance but port conflicts possible.
3.  **None**: No network access.
4.  **Overlay**: Distributed network spanning multiple Docker hosts (Swarm/K8s). Uses VXLAN tunneling.
5.  **Macvlan**: Assigns a MAC address to the container, making it appear as a physical device on the network.

### Docker DNS
Docker has an embedded DNS server (127.0.0.11). It resolves container names to IPs within user-defined networks.

## 3. Docker Security

### Attack Surface
*   **Kernel Exploits**: Shared kernel means a kernel bug affects all containers.
*   **DoS**: Resource exhaustion (mitigated by Cgroups).
*   **Container Breakout**: escaping isolation.

### Security Best Practices
1.  **Non-Root User**: Always run `USER nonroot` in Dockerfile.
2.  **Read-Only Filesystem**: `docker run --read-only`.
3.  **Drop Capabilities**: The root inside a container has reduced privileges. Drop more if needed (`--cap-drop ALL`).
4.  **Content Trust**: Sign images to verify origin.
5.  **Distroless Images**: Use minimal images (like `gcr.io/distroless/static`) containing only the app and runtime, no shell/package manager.
