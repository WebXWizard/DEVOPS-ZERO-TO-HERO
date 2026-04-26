# Kubernetes Interview Questions

## Beginner
1.  **What is a Pod?**
    *The smallest execution unit in K8s. It represents a single instance of a running process in your cluster.*

2.  **What is a Node?**
    *A worker machine (VM or physical) where containers are launched by Kubernetes.*

3.  **What is `kubectl`?**
    *The command line tool for communicating with the Kubernetes API server.*

4.  **What is a Namespace?**
    *A way to divide cluster resources between multiple users/environments (e.g., Dev vs Prod).*

## Intermediate
5.  **Difference between Deployment and ReplicaSet?**
    *ReplicaSet ensures X copies of a pod are running. Deployment manages ReplicaSets and allows for declarative updates (Server-side rolling updates).*

6.  **What is a Service in K8s?**
    *An abstraction that defines a logical set of Pods and a policy to access them (stable IP/DNS name).*

7.  **Explain the Control Plane components.**
    *API Server (frontend), etcd (store), Scheduler (assigns pods), Controller Manager (reconciliation).*

8.  **What is Minikube?**
    *A tool that runs a single-node Kubernetes cluster locally for learning and development.*

## Advanced
9.  **How does Kubernetes handle self-healing?**
    *Controllers (like ReplicaSet) continuously monitor the current state vs desired state. If a Pod crashes, it schedules a new one to match the desired count.*

10. **What is an Operator?**
    *A method of packaging, deploying, and managing a Kubernetes application (custom controller + custom resource definition).*

11. **Difference between StatefulSet and Deployment?**
    *Deployments are for stateless apps (pods are interchangeable). StatefulSets are for stateful apps (databases) where order and stable network IDs matter.*

12. **What is Ingress?**
    *An API object that manages external access to the services in a cluster, typically HTTP/HTTPS (requires an Ingress Controller).*

13. **What is a sidecar container?**
    *A helper container running alongside the main container in the same Pod (e.g., a logging agent or proxy).*
