# Container Orchestration (Kubernetes) Study Guide

**Estimated Time**: 4-6 weeks

Kubernetes (K8s) is the industry standard for container orchestration. It automates the deployment, scaling, and management of containerized applications across a cluster of machines.

## Essential Concepts

### 1. Kubernetes Architecture
The internal components:
- **Control Plane**: Master nodes (API Server, Scheduler, Controller Manager, etcd).
- **Nodes**: Worker nodes (Kubelet, Kube-proxy, Container Runtime).
- **Cluster**: A set of nodes running containerized applications.

### 2. Kubernetes Components (Pods, etc.)
Basic objects and abstractions:
- **Pods**: The smallest deployable unit (typically one container).
- **Deployments**: Declarative updates for Pods and ReplicaSets.
- **ReplicaSets**: Ensuring a specified number of Pod replicas are running.
- **Services**: Stable network endpoint (ClusterIP, NodePort, LoadBalancer).
- **Namespaces**: Logical isolation within a cluster.

### 3. Managing Resources in Kubernetes
Configuration and data management:
- **ConfigMaps**: Storing non-sensitive configuration data.
- **Secrets**: Storing sensitive data (e.g., passwords, keys) securely.
- **PersistentVolumes (PV) & PersistentVolumeClaims (PVC)**: Managing storage.

### 4. Scaling Applications
Efficiently handling traffic:
- **Horizontal Pod Autoscaler (HPA)**: Scaling Pods based on CPU/memory usage.
- **Node Autoscaling**: Scaling the number of nodes in the cluster.

### 5. Helm Basics
Package manager for Kubernetes:
- **Charts**: Reusable templates for deploying K8s resources.
- **Repositories**: Hosting and sharing Helm charts.
- **Releases**: Instances of deployed Helm charts.

### 6. Kubernetes Networking
Communication patterns:
- **Service Networking**: In-cluster service discovery and load balancing.
- **Ingress**: Managing external access to services (HTTP/HTTPS routes).
- **Network Policies**: Controlling traffic flow between Pods.

### 7. Security in Kubernetes
Protecting the cluster:
- **RBAC (Role-Based Access Control)**: Granular permissions for users and services.
- **Pod Security Admission**: Enforcing security standards for Pods.
- **Secrets Management**: Best practices for handling sensitive data.

---
**Practical Challenge**: Use `minikube` or `kind` to set up a local Kubernetes cluster, deploy a simple web application using a Deployment, and expose it via a Service. Access it via the NodePort or LoadBalancer.
