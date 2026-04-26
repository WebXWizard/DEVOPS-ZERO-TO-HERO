# Kubernetes (K8s) Fundamentals

## What is Kubernetes?
Kubernetes is an open-source container orchestration platform that automates the deployment, scaling, and management of containerized applications.
*Originally developed by Google (Borg).*

## Why do we need it?
While Docker manages single containers, Kubernetes manages **clusters** of containers. It solves:
-   **Service Discovery**: How containers find each other
-   **Load Balancing**: Distributing traffic
-   **Self-healing**: Restarting failed containers
-   **Scaling**: Adding more replicas based on load
-   **Rolling Updates**: Updating apps with zero downtime

## Key Features
1.  **Automated Rollouts/Rollbacks**: Changes are progressively rolled out, and can be rolled back if something goes wrong.
2.  **Service Discovery**: No need to modify application to use an unfamiliar service discovery mechanism.
3.  **Storage Orchestration**: Automatically mount storage (local, cloud, NFS).
4.  **Secret/Config Management**: Deploy and update secrets/config without rebuilding images.

## Kubernetes vs Docker Swarm
| Feature | Kubernetes | Docker Swarm |
| :--- | :--- | :--- |
| **Complexity** | High (Steep learning curve) | Low (Easy to start) |
| **Scalability** | Very High | Medium |
| **Flexibility** | High (Pods, etc.) | Lower |
| **Industry Adoption** | Standard | Declining |

## Basic Workflow
1.  Write App Code
2.  Build Docker Image
3.  Push to Registry
4.  Write K8s Manifests (YAML)
5.  Apply to Cluster (`kubectl apply`)
