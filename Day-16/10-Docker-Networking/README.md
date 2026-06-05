# 🌐 Docker Networking — Complete Revision Guide

> **"Connecting isolates."** A complete breakdown of Docker networking drivers, user-defined networks, automatic DNS resolution, and security configurations.

---

## 📖 How Docker Networking Works

By default, when you install Docker, a virtual interface named **`docker0`** is created on the host machine. 
- Each container is assigned its own isolated **network namespace**.
- Containers are connected to the host via a virtual Ethernet pair (`veth` interfaces), acting like a physical wire connecting the container's network stack to the `docker0` bridge.

---

## 🏎️ Docker Network Drivers

Docker uses drivers to manage networking. You can select different drivers depending on your topology requirements.

| Driver | Description | Common Use Case |
|---|---|---|
| **`bridge`** | Default driver. Creates a private internal network on the host. Containers can talk to each other but are isolated from external traffic unless ports are published. | Standalone containers running on a single host. |
| **`host`** | Removes network isolation between the container and the host. The container shares the host's IP and ports directly. | High-performance apps (bypasses NAT overhead); no port mapping needed. |
| **`none`** | Disables all networking for the container. The container only has a loopback interface (`127.0.0.1`). | Secure batch processing, parsing jobs, or database seeding. |
| **`overlay`** | Connects multiple Docker daemons across different hosts (multi-host networking). | Docker Swarm clusters or distributed microservices. |
| **`macvlan`** | Assigns a unique physical MAC address to a container, making it look like a physical device on your local router's network. | Legacy applications that must connect directly to physical subnets. |

---

## 🆚 Default Bridge vs. User-Defined Bridge

While Docker creates a default `bridge` network out of the box, building a **User-Defined Bridge Network** is standard practice for production.

| Feature | Default Bridge Network | User-Defined Bridge Network |
|---|---|---|
| **DNS Resolution** | ❌ None. Containers must use IP addresses or `--link` (legacy). | ✅ **Automatic**. Containers resolve each other by container name or alias. |
| **Isolation** | ❌ None. All containers without a network specified share it, reducing security. | ✅ **Strict**. Only containers explicitly attached to this network can communicate. |
| **Hot Plug/Unplug** | ❌ Cannot connect/disconnect running containers. | ✅ Can connect or disconnect running containers dynamically. |
| **Configuration** | ❌ Fixed configuration. | ✅ Highly customizable (MTU, subnet, gateway, IPAM). |

---

## ⚙️ Core Network Commands

Use these commands to build and manage network topologies.

### 1. Listing Networks
List all active networks on your host daemon:
```bash
docker network ls
```

### 2. Creating a Custom Network
Create a custom bridge network (default driver is bridge):
```bash
docker network create --driver bridge my-app-net
# Create with custom subnet
docker network create --subnet=192.168.10.0/24 my-custom-net
```

### 3. Inspecting a Network
Examine network details (subnet, gateway, attached containers and their IPs):
```bash
docker network inspect my-app-net
```

### 4. Running a Container in a Network
Attach containers to your custom network during startup:
```bash
docker run -d --name db --network my-app-net mongo
docker run -d --name app --network my-app-net -p 3000:3000 my-node-app
```
*Because they are on `my-app-net`, the node app can connect to mongo using the hostname `db` directly (e.g., `mongodb://db:27017`).*

### 5. Connecting & Disconnecting Dynamic Containers
Attach or detach a running container to/from networks on the fly:
```bash
docker network connect my-app-net running-container-name
docker network disconnect my-app-net running-container-name
```

### 6. Cleanup
```bash
docker network rm my-app-net       # Delete a network
docker network prune                # Remove all unused networks
```

---

## 🎯 Interview Questions & Answers

### Q1: What is the default network driver in Docker, and how does it work?
**A:** The default driver is the **Bridge driver**. When Docker starts, it creates a virtual bridge interface named `docker0` on the host. Each container launched without an explicit network is assigned an IP from the bridge's subnet (typically `172.17.0.0/16`) and is connected to `docker0` via virtual ethernet (`veth`) pairs, allowing container-to-container and container-to-external communication.

### Q2: Why should we use user-defined bridge networks instead of the default bridge network?
**A:** User-defined bridge networks provide:
1. **Automatic DNS resolution:** Containers can resolve each other by name (e.g., `web` can ping `db` without knowing its IP).
2. **Better security isolation:** Only containers explicitly added to the network can communicate, isolating them from other containers on the host.
3. **Hot plugging:** You can dynamically connect/disconnect running containers to/from user-defined networks.

### Q3: How do two containers on different user-defined networks communicate?
**A:** By default, containers on separate networks cannot communicate. To allow communication:
1. You can attach one of the containers to the other's network using:
   `docker network connect <network_name> <container_name>`. The container will then have two network interfaces and can communicate on both networks.
2. Alternatively, run them on a shared network or route traffic through host port publishing.

### Q4: Explain the `host` network driver. When would you use it?
**A:** The `host` network driver removes network isolation between the container and the Docker host. The container shares the host's networking namespace directly. For example, if a container runs an app on port 80 using the host driver, the app is instantly available on the host's IP port 80. You would use it for high-throughput applications where network performance is critical, as it bypasses the network address translation (NAT) overhead of Docker's bridge.

### Q5: What is the difference between `-p` (lowercase) and `-P` (uppercase) flags in Docker?
**A:**
- `-p` (publish) maps a **specific port** on the host to a specific port in the container (e.g., `-p 8080:80`).
- `-P` (publish-all) publishes **all exposed ports** of the container to **random high-range ports** (typically 32768–60999) on the host machine.

### Q6: How does automatic DNS work inside custom Docker networks?
**A:** Docker runs an embedded DNS server at address `127.0.0.11` inside every container. When a container on a user-defined network makes a request to a hostname (e.g., `ping database`), the embedded DNS server resolves the hostname to the corresponding container's internal IP address using Docker's internal service discovery. If it cannot resolve it locally, it forwards the query to the host's configured DNS servers.

### Q7: What is the overlay network driver, and when is it used?
**A:** The overlay driver creates a distributed network across multiple host daemons running Docker. It allows containers running on different physical or virtual hosts to communicate securely (with optional IPsec encryption) without requiring OS-level routing. It is standard for container orchestrators like Docker Swarm and Kubernetes (via CNI plugins).

### Q8: What does the `none` network driver do? What is a common use case?
**A:** The `none` network driver runs the container with absolute network isolation. It has no external network interfaces, only a loopback interface (`127.0.0.1`). Use cases include running highly secure offline jobs, executing CPU-heavy calculations, running tests, or performing file operations where external access is a security risk.

### Q9: Can you modify the network of a running container without restarting it?
**A:** Yes. You can dynamically attach and detach a running container to/from networks using `docker network connect <network> <container>` and `docker network disconnect <network> <container>`.

### Q10: How does Docker allow external traffic to reach a container on a bridge network?
**A:** Docker uses Linux **iptables** rules on the host to perform Network Address Translation (NAT). When you publish a port using `-p 8080:80`, Docker creates port forwarding rules (DNAT) in the host's firewall, routing incoming traffic on host port 8080 to the container's private IP address on port 80.

---

## 💡 Key Takeaways

```
✅ By default, containers are connected to the 'docker0' bridge.
✅ User-defined networks enable built-in DNS name resolution.
✅ The embedded DNS resolver in Docker is located at '127.0.0.11'.
✅ The 'host' driver offers maximum network performance but removes isolation.
✅ Docker uses host iptables rules to route traffic (NAT) when you publish ports.
```

---

> 🚀 *"Isolate by default, expose with intent. That is the philosophy of secure container networking."*