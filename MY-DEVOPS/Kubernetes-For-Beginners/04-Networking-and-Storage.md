# 04 Networking and Storage

How do you access your application? And how do you save data?

## Networking (Services)
Pods have IP addresses, but they change every time a Pod restarts. **Services** provide a stable IP address and DNS name for a set of Pods.

### Types of Services
1.  **ClusterIP** (Default):
    - Exposes the Service on an internal IP.
    - Only reachable from *within* the cluster.
    - Good for internal communication (e.g., Backend talking to Database).

2.  **NodePort**:
    - Exposes the Service on the same port of each selected Node.
    - You can access it via `<NodeIP>:<NodePort>`.
    - Good for development/testing.

3.  **LoadBalancer**:
    - Creates an external Load Balancer (from your cloud provider like AWS/GCP).
    - Good for production public-facing apps.

## Storage (Volumes)
By default, files inside a container are lost if the container crashes. To save data, you need **Volumes**.

### Persistent Volume (PV) & Claim (PVC)
- **Concept**:
  - **PV**: A piece of storage in the cluster (e.g., 10GB disk).
  - **PVC**: A request for storage by a user ("I need 5GB").
- Kubernetes binds a PVC to an available PV. This separates the "storage details" from the "application usage".

## Configuration
- **ConfigMap**: Store non-confidential data in key-value pairs (e.g., environment variables, config files).
- **Secret**: Similar to ConfigMap but for confidential data (passwords, tokens). Stored in base64.

---
*Next Step: [Beginner Projects](./05-Beginner-Projects.md)*
