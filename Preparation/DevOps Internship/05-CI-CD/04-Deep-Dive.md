# CI/CD Deep Dive & Patterns

## 1. Advanced Pipeline Patterns

### Fan-Out / Fan-In
*   **Fan-Out**: Triggering multiple parallel jobs from a single stage (e.g., Run Unit Tests, Linting, and Security Scan simultaneously).
*   **Fan-In**: Waiting for all parallel jobs to complete before proceeding to the next stage (e.g., Deploy only if Tests AND Scan pass).

### Matrix Builds
Running the same test suite across multiple combinations of environments.
*   *Example*: Test App v1.0 on [Node 14, Node 16, Node 18] x [Ubuntu, Windows].
*   Generates 6 parallel jobs automatically.

### Caching Strategies
Speed up builds by reusing dependencies.
*   **Dependency Caching**: Cache `node_modules` or `.m2` based on lockfile hash. If lockfile hasn't changed, restore cache.
*   **Docker Layer Caching**: Reuse intermediate layers from previous builds.

## 2. Deployment Strategies

### Blue-Green Deployment
*   Two identical environments (Idle/Live).
*   Deploy to Idle (Green). Run Smoke Tests.
*   Switch Router/Load Balancer to point to Green.
*   *Pros*: Instant rollback (switch back).
*   *Cons*: Double infrastructure cost.

### Canary Releases
*   Deploy new version to a small % of traffic (e.g., Kubernetes Service with 1 Pod v2 and 9 Pods v1).
*   Analyze metrics (Error rate, Latency).
*   Gradually increase traffic (10% -> 50% -> 100%).

### Feature Flags
*   Deploy code to production but keep it hidden behind a configuration flag (`if (featureEnabled) ...`).
*   Decouples deployment (code move) from release (feature visibility).

## 3. GitOps (Infrastructure as Pipeline)

### The Concept
Git is the single source of truth. The cluster state *must* match the Git state.

### Push vs Pull GitOps
*   **Push (CI/CD Driven)**: Pipeline runs `kubectl apply`. Requires pipeline to have Cluster Admin credentials (Security Risk).
*   **Pull (Agent Driven)**: An agent (ArgoCD, Flux) runs *inside* the cluster. It polls Git. If it sees a change, it pulls and applies it. Stronger security (Cluster doesn't need to know about CI).

## 4. Scaling CI/CD

### Self-Hosted Runners
*   Use when you need specific hardware (GPU), access to private network resources (VPN), or to save costs on cloud minutes.
*   **Autoscaling**: Use Kubernetes to spin up runner pods on demand (Ephemeral runners) and kill them after the job.

### Security in Pipelines
*   **OIDC (OpenID Connect)**: Use instead of long-lived AWS Access Keys. GitHub Actions exchanges a token with AWS STS to get temporary credentials.
*   **Signed Commits**: Enforce GPG signing.
*   **Supply Chain Security**: Generate **SBOM** (Software Bill of Materials) and sign artifacts (Cosign).
