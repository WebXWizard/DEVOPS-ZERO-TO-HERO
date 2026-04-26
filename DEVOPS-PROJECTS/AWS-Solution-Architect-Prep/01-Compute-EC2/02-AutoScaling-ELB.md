# Auto Scaling & Load Balancing

## 1. Elastic Load Balancing (ELB)
Distributes incoming application traffic across multiple targets, such as EC2 instances, containers, and IP addresses.

### Types of ELB
1. **Application Load Balancer (ALB):**
   - Layer 7 (HTTP/HTTPS).
   - **Routing:** Content-based.
     - `/api` -> Target Group A
     - `/images` -> Target Group B
   - **Features:** WAF integration, redirects, fixed response, sticky sessions (cookies).
   - **Best for:** Microservices, Container-based apps.

2. **Network Load Balancer (NLB):**
   - Layer 4 (TCP/UDP/TLS).
   - **Performance:** Extreme differences. Millions of requests/sec. Ultra-low latency (ms).
   - **Features:** Static IP addresses (ALB does not have this), Preserves source IP.
   - **Best for:** Gaming, High-frequency trading.

3. **Gateway Load Balancer (GWLB):**
   - Layer 3 (IP).
   - **Use Case:** Deploying 3rd party virtual appliances (firewalls, deep packet inspection) transparently.

## 2. Auto Scaling Groups (ASG)
Ensures you have the correct number of EC2 instances available to handle the load.

### Key Components
- **Launch Template:** "What to launch" (AMI, Instance Type, Key Pair, Security Group). *Note: Launch Configurations are deprecated.*
- **Scaling Policies:** "When to launch".
  - *Target Tracking:* "Keep CPU at 50%". (Easiest & Recommended).
  - *Step Scaling:* "If Alarm > 80%, add 2 units. If alarm > 90%, add 4 units."
  - *Simple Scaling:* "If Alarm > 80%, add 1 unit." (Cooldown periods apply).
  - *Scheduled Scaling:* "Every Friday at 5PM, scale up to 10." (Good for predictable spikes).

### Health Checks
ASG uses health checks to determine if an instance is unhealthy and needs replacement.
- **EC2 Health Check:** Checks if the hardware is responding.
- **ELB Health Check:** Checks if the application is returning 200 OK. (Enable this if using an ELB!).
