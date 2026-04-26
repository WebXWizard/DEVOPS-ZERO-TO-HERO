# AWS Compute & Serverless - Interview Prep

## 1. Amazon EC2 (Elastic Compute Cloud)

**Core Concept:** Resizable compute capacity in the cloud. Think "Virtual Servers".

### Key Instance Types (Know the families!)
- **General Purpose (T, M):** Balanced resources. Web servers, dev/test.
- **Compute Optimized (C):** High CPU. Batch processing, gaming servers.
- **Memory Optimized (R, X):** High RAM. Databases (RDS is built on these), in-memory caches.
- **Storage Optimized (I, D):** High I/O. NoSQL DBs, heavy data warehousing.
- **GPU (P, G):** Machine Learning, Video rendering.

### Purchasing Options (Crucial for "Cost Optimization")
1. **On-Demand:** Pay by second/hour. No convenient. Good for short-term, spiky workloads.
2. **Reserved Instances (RI):** Commit to 1 or 3 years. Up to 72% discount. Steady-state usage.
   - *Standard RI:* Cannot change instance family/OS.
   - *Convertible RI:* Can change family/OS. Lower discount.
3. **Savings Plans:** Commit to $X/hour for 1/3 years. More flexible than RIs (applies to EC2 + Lambda + Fargate).
4. **Spot Instances:** Bid on unused capacity. Up to 90% discount. **WARNING:** Can be terminated with 2-minute warning. Use for stateless, fault-tolerant work (batch jobs, CI/CD).
5. **Dedicated Hosts:** Physical server for you (Licensing compliance).

### Auto Scaling & Load Balancing (The "Scalability" part)
- **Auto Scaling Group (ASG):** Define Min, Max, Desired capacity.
  - *Dynamic Scaling:* Scale based on CPU > 80%.
  - *Predictive Scaling:* AI predicts traffic based on history.
- **Elastic Load Balancer (ELB):** Distributes traffic.
  - *ALB (Application Load Balancer):* Layer 7 (HTTP/HTTPS). Content-based routing (/api -> Group A).
  - *NLB (Network Load Balancer):* Layer 4 (TCP/UDP). Ultra-low latency, millions of requests/sec. Static IP support.
  - *GWLB (Gateway Load Balancer):* For 3rd party firewalls/intrusion detection.

---

## 2. AWS Lambda (Serverless)

**Core Concept:** Run code without provisioning servers. "Event-driven".

### Key Features
- **Triggers:** S3 uploads, DynamoDB updates, API Gateway requests, CloudWatch events.
- **Billing:** Pay purely for compute duration (ms) + # of requests.
- **Ephemeral Storage:** `/tmp` directory (up to 10GB now).

### Solution Architect Knowledge Checks
1. **Cold Starts:** Latency when a function runs for the first time. Fix: *Provisioned Concurrency*.
2. **Timeouts:** Max execution time is **15 minutes**. If a job takes longer, use EC2 or AWS Fargate (ECS).
3. **VPC Access:** Lambda running inside a VPC needs a NAT Gateway to access the internet (e.g., to call a public API).

### Lambda vs EC2
- Use **Lambda** for: Real-time transformations, cron jobs, API backends (with API Gateway), sporadic traffic.
- Use **EC2** for: Long-running processes, custom OS requirements, unpredictable high-throughput (sometimes cheaper than massive Lambda scale).
