# 03 Core Concepts

Kubernetes has a lot of "Resources", but you only need to master a few to get started.

## 1. Pod (The Atom)
- The **smallest unit** in Kubernetes.
- Encapsulates a container (or multiple tightly-coupled containers).
- **Rule**: Don't manage proper Pods directly! They are ephemeral (if they die, they stay dead).

## 2. ReplicaSet
- Ensures that a specified number of Pod replicas are running at any given time.
- If a Pod dies, ReplicaSet starts a new one to replace it.

## 3. Deployment (The King)
- This is what you will use 90% of the time.
- A **Deployment** manages a ReplicaSet, which manages Pods.
- **Why use it?**
  - **Self-healing**: auto-restarts failed pods.
  - **Scaling**: easily change from 2 to 20 replicas.
  - **Rolling Updates**: upgrade your app version with zero downtime.

#### Example Deployment YAML
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.14.2
        ports:
        - containerPort: 80
```

## 4. Namespace
- A way to divide cluster resources between multiple users or teams.
- Defaults: `default`, `kube-system` (do not touch this!).
- Useful for separating environment (e.g., `dev`, `staging`, `prod`).

---
*Next Step: [Networking and Storage](./04-Networking-and-Storage.md)*
