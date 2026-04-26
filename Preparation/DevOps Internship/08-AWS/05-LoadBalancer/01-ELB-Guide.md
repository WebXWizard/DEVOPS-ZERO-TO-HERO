# Elastic Load Balancing (ELB)

## What is ELB?
ELB automatically distributes incoming application traffic across multiple targets, such as EC2 instances, containers, and IP addresses, across multiple Availability Zones.

## Types of Load Balancers

### 1. Application Load Balancer (ALB)
*   **Layer**: Layer 7 (HTTP/HTTPS).
*   **Features**: Path-based routing (`/api` vs `/web`), Host-based routing (`one.example.com`), Container support (dynamic ports).
*   **Use Case**: Web applications, Microservices, Containers.

### 2. Network Load Balancer (NLB)
*   **Layer**: Layer 4 (TCP/UDP).
*   **Features**: Ultra-high performance, Static IP addresses, Low latency.
*   **Use Case**: Real-time gaming, financial transactions.

### 3. Gateway Load Balancer (GWLB)
*   **Layer**: Layer 3 (Gateway).
*   **Features**: Deploy, scale, and manage virtual appliances (Firewalls, IDS/IPS).

### 4. Classic Load Balancer (CLB)
*   **Layer**: Layer 4 & 7 (Old Generation).
*   **Status**: Legacy. Avoid using.

## Key Concepts
*   **Listener**: Process that checks for connection requests (Protocol + Port).
*   **Target Group**: Logical grouping of targets (EC2, IPs, Lambda). Health checks are defined here.
*   **Health Checks**: Pings targets to see if they are healthy. ELB only routes to healthy targets.

## Interview Questions
1.  **What is Sticky Sessions (Session Affinity)?**
    *   A mechanism to route requests from the same client to the same target instance for the duration of the session (using cookies).

2.  **Difference between ALB and NLB?**
    *   ALB understands HTTP (Headers, Paths) and works at Layer 7. NLB works at connection level (TCP/UDP) at Layer 4 and is faster but "dumber" about content.

3.  **What is Connection Draining (Deregistration Delay)?**
    *   Time to allow existing in-flight requests to complete before deregistering an instance (e.g., during scale-in). Default is 300s.

4.  **X-Forwarded-For Header?**
    *   Since ELB terminates the connection, the EC2 instance sees the ELB's IP. The `X-Forwarded-For` header contains the *original* client IP address.
