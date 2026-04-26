# GitOps Crash Course

**The Future of CD.**
Forget running `kubectl apply -f ...` manually.

## What is GitOps?
GitOps uses a Git repository as the **Single Source of Truth** for infrastructure and application deployment.
- **Principles**:
  1.  Entire system described declaratively (YAML).
  2.  State stored in Git.
  3.  Changes applied via Pull Requests.
  4.  Software agents (ArgoCD) ensure Live State = Git State.

## The Workflow (Push vs Pull)

### Old Way (Push - Jenkins)
1.  Dev pushes code.
2.  Jenkins builds Docker image.
3.  Jenkins runs `kubectl apply`.
- **Risk**: You need to give Jenkins "God Mode" access to your cluster.

### New Way (Pull - ArgoCD)
1.  Dev pushes code.
2.  Jenkins builds Docker image & updates `deployment.yaml` in Git.
3.  **ArgoCD** (running inside K8s) sees the change in Git.
4.  ArgoCD pulls the new config and applies it to the cluster.
- **Benefit**: Cluster credentials never leave the cluster.

## Tools to Know
1.  **ArgoCD**: Visual, user-friendly, industry standard.
2.  **Flux**: More "CLI" focused, very powerful.

## How to Start?
1.  Install ArgoCD in Minikube.
2.  Connect it to a public Git repo containing YAML files.
3.  Change a replica count in Git.
4.  Watch ArgoCD auto-sync and scale the pods in Minikube.
