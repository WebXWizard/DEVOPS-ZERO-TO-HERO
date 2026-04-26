# 01 Introduction to Kubernetes

## What is Kubernetes?
Kubernetes (often abbreviated as **K8s**) is an open-source platform for automating the deployment, scaling, and management of containerized applications.

### The Problem it Solves
In the world of Docker, running one container is easy (`docker run`). But what if you need to run **1,000 containers** across **50 servers**?
- How do you restart them if they crash?
- How do you scale them up if traffic spikes?
- How do they talk to each other?

This is **Container Orchestration**, and Kubernetes is the industry standard for this.

## Kubernetes Architecture
A K8s cluster consists of two main types of machines:

### 1. Control Plane (The Master)
The "Brain" of the cluster. It makes decisions (e.g., scheduling).
- **API Server**: The front door. All commands (`kubectl`) go here.
- **Scheduler**: Decides which node a new Pod should run on.
- **Controller Manager**: Ensures the state of the cluster (e.g., restarting crashed pods).
- **etcd**: Consistent and highly-available key value store used as Kubernetes' backing store for all cluster data.

### 2. Worker Nodes (The Workers)
The machines that actually run your applications.
- **Kubelet**: An agent that makes sure containers are running in a Pod.
- **Kube-Proxy**: Handles network rules.
- **Container Runtime**: The software that runs the containers (e.g., Docker, containerd).

---
*Next Step: [Setup Local Cluster](./02-Setup-Local-Cluster.md)*
