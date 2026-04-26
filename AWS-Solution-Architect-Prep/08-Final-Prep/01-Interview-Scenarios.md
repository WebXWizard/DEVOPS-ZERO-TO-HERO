# AWS Solution Architect Interview Scenarios

## Scenario 1: The "Hiring Manager" Technical Challenge
**Question:** *"Design a scalable, highly available 3-tier web application architecture for an e-commerce site affecting users globally. How would you handle a sudden traffic spike?"*

**Answer Framework:**
1. **Frontend (Tier 1):**
   - Use **CloudFront (CDN)** to cache content globally (low latency for users).
   - Store static assets (images, CSS) in **S3**.
   - **Route53** for DNS management.
2. **Application (Tier 2):**
   - **ALB (Application Load Balancer)** to distribute traffic.
   - **Auto Scaling Group** of EC2 instances across **Multiple AZs** (High Availability).
   - Put EC2s in **Private Subnets** (Security).
3. **Database (Tier 3):**
   - **Amazon RDS** (Multi-AZ) for the transactional DB.
   - **ElastiCache (Redis)** for caching frequent queries (User sessions, Cart items) to offload the DB.
4. **Handling the Spike:**
   - The **Auto Scaling Group** will detect high CPU/Traffic and launch new EC2 instances automatically.
   - **CloudFront** absorbs 90% of the static read traffic so it never hits the servers.

## Scenario 2: Legacy Migration (The 6 Rs)
**Question:** *"We have a monolithic application on a physical server in our office. We want to move to AWS quickly. What do you suggest?"*
**Answer:** 
- A **Rehost (Lift and Shift)** strategy using **AWS MGN (Application Migration Service)**.
- It minimizes downtime and changes. Once in the cloud, we can **Refactor** slowly (e.g., move DB to RDS) to optimize costs.

## General Technical Questions
**Q: What is the difference between S3 and EBS?**
- S3 is object storage (files, internet accessible). EBS is block storage (hard drive attached to one instance).

**Q: How do you secure data in S3?**
- Block Public Access, Bucket Policies (Least Privilege), Encryption (KMS).

**Q: Connecting On-Prem to AWS securely?**
- Site-to-Site VPN (Cheap/Quick) or Direct Connect (Fast/Consisent/Private).
