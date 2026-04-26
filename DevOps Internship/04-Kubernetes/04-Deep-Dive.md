# Kubernetes Deep Dive

## 1. Control Plane Internals

### The Life of a Record
1.  `kubectl apply` sends JSON to **API Server**.
2.  **API Server** validates authN/authZ and writes to **etcd**.
3.  **Etcd** acknowledges write. API Server confirms to user.
4.  **Controllers** (e.g., ReplicaSet Controller) watch API server. They see "Desired: 3, Current: 0".
5.  Controller creates 3 Pod objects in API server.
6.  **Scheduler** watches for *unassigned* pods. It scores nodes (Cpu, Mem, Taints) and assigns Pod to a Node.
7.  **Kubelet** (on Node) sees assignment. Talks to Runtime (Docker/CRI) to start containers.
8.  Kubelet reports status back to API Server.

### Etcd
*   Distributed Key-Value store.
*   Uses **Raft Consensus Algorithm** for consistency.
*   Requires quorum (N/2 + 1) to operate. 3 nodes can tolerate 1 failure. 5 nodes tolerate 2.

## 2. Container Interfaces

To avoid vendor lock-in, K8s uses standard interfaces:
1.  **CRI (Container Runtime Interface)**: Defines how K8s talks to runtime. Allows switching from Docker (shim) to containerd or CRI-O.
2.  **CNI (Container Network Interface)**: Defines networking. Plugins (Calico, Flannel, Weave) implement this (IP assignment, Routing).
3.  **CSI (Container Storage Interface)**: Defines storage. Vendors (AWS EBS, NetApp) write plugins.

## 3. Advanced Networking

### The Pod Network Model
*   Every Pod gets its own IP.
*   Pods on the same node can talk (localhost or bridge).
*   Pods on different nodes can talk without NAT.

### Service Networking (Kube-Proxy)
*   **ClusterIP** is virtual (iptables/IPVS rule), not a real interface.
*   **Kube-proxy** watches Services/Endpoints and updates iptables on every node to trap traffic destined for the Service IP and DNAT it to a backing Pod IP.

## 4. Scheduling Advanced
*   **Taints & Tolerations**: Node says "No pods unless you tolerate my taint" (e.g., GPU nodes).
*   **Node Affinity**: Pod says "I prefer/require to run on a node with Label X".
*   **Pod Affinity/Anti-Affinity**: "Run close to App B" or "Don't run on same node as App A".

## 5. Security Context & Policies
*   **Network Policies**: Firewall for Pods (Default: Allow All). Use to restrict traffic between namespaces.
*   **RBAC (Role Based Access Control)**: Who (Subject) can do what (Verb) on which (Resource).
*   **Pod Security Standards**: Restricted, Baseline, Privileged profiles.
