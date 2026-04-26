# 02 Setup Local Cluster

To learn Kubernetes, you don't need a massive cloud server. You can run a cluster on your laptop!

## 1. Install kubectl
`kubectl` is the command-line tool you use to talk to your cluster.
- **Windows**: `winget install -e --id Kubernetes.kubectl`
- **MacOS**: `brew install kubectl`
- **Linux**: Check official docs.

Verify installation:
```bash
kubectl version --client
```

## 2. Choose a Local Cluster Tool
There are two popular options for beginners:

### Option A: Minikube (Classic)
Creates a single-node cluster inside a Virtual Machine or Docker container.
1.  **Install**: `winget install minikube` (or download installer).
2.  **Start**: `minikube start`
3.  **Check**: `kubectl get nodes`

### Option B: Kind (Kubernetes in Docker)
Run K8s nodes *as* Docker containers. Faster and lightweight.
1.  **Prerequisite**: Docker Desktop must be running.
2.  **Install**: `winget install Kubernetes.kind` (or via Go/Brew).
3.  **Start**: `kind create cluster`
4.  **Check**: `kubectl get nodes`

## 3. Your First Command
Once your cluster is running (Minikube or Kind), try this:

```bash
kubectl get nodes
```
**Output should look like:**
```
NAME       STATUS   ROLES           AGE   VERSION
minikube   Ready    control-plane   2m    v1.26.1
```

If you see a node with status **Ready**, congratulations! You have a running Kubernetes cluster.

---
*Next Step: [Core Concepts](./03-Core-Concepts.md)*
