# Kubernetes Architecture & Objects

## Cluster Architecture

### 1. Control Plane (Master Node)
The brain of the cluster.
-   **API Server**: The frontend for the K8s control plane. All components talk to it.
-   **etcd**: Key-value store for all cluster data (the database).
-   **Scheduler**: Assigns newly created Pods to Nodes.
-   **Controller Manager**: Runs controller processes (Node controller, ReplicaSet controller).
-   **Cloud Controller Manager**: Links to cloud provider APIs.

### 2. Worker Nodes
Machines where containers run.
-   **Kubelet**: An agent that ensures containers are running in a Pod.
-   **Kube-proxy**: Maintains network rules (allows communication).
-   **Container Runtime**: Software that runs containers (e.g., Docker, containerd).

## Core Objects (The "Nouns")

### 1. Pod
The smallest deployable unit.
-   Can contain one or more containers (usually one).
-   Containers in a Pod share IP and storage.
-   *Analogy: A pea in a pod.*

### 2. Service
An abstraction to expose an application running on a set of Pods.
-   **ClusterIP**: Internal IP (default).
-   **NodePort**: Exposes on each Node's IP at a static port.
-   **LoadBalancer**: Exposes via Cloud Provider's LB.

### 3. ReplicaSet
Ensures a specified number of Pod replicas are running at any given time.

### 4. Deployment
Wraps ReplicaSets to manage updates (rolling updates, rollbacks).
*You mostly work with Deployments, not Pods directly.*

### 5. ConfigMap & Secret
-   **ConfigMap**: Stores non-sensitive configuration.
-   **Secret**: Stores sensitive data (passwords, keys).

### 6. Volume / PersistentVolume (PV) / PVC
Manages storage that persists beyond the Pod lifecycle.

### 7. Namespace
Virtual clusters backed by the same physical cluster. Used for isolation (e.g., dev, prod).

## Common `kubectl` Commands
```bash
kubectl get pods               # List pods
kubectl get nodes              # List nodes
kubectl get services           # List services
kubectl get deploy             # List deployments
kubectl apply -f file.yaml     # Create/Update resources
kubectl delete -f file.yaml    # Delete resources
kubectl describe pod <name>    # Detailed info (debugging)
kubectl logs <name>            # View logs
kubectl exec -it <name> -- sh  # Enter pod shell
```
