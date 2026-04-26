# Common AWS Solution Architect Interview Questions

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

## General Technical Questions

**Q: What is the difference between a Security Group and a NACL?**
- **A:** Security Groups are stateful (return traffic allowed automatically) and instance-level. NACLs are stateless (must allow return traffic explicitly) and subnet-level.

**Q: How do you secure data in S3?**
- **A:** 
  1. Block Public Access (Bucket setting).
  2. Use Bucket Policies to restrict access to specific IAM roles/users.
  3. Enable Encryption at Rest (SSE-S3 or KMS) and in Transit (HTTPS only policy).

**Q: An EC2 instance keeps terminating immediately after launch. Why?**
- **A:** Likely an EBS volume limit issue, corrupted AMI, or insufficient permissions. Check the "State Transition Reason" in the console.

**Q: We need to connect our on-premise data center to AWS securely. What are the options?**
- **A:** 
  1. **Site-to-Site VPN:** Quick, cheap, encrypted over internet.
  2. **Direct Connect:** Dedicated physical line. High throughput, consistent latency, expensive.

**Q: How do you prevent a developer from launching a super expensive `p3.16xlarge` instance?**
- **A:** Create an IAM Policy with a "Deny" rule for specific instance types or use **AWS Organizations Service Control Policies (SCPs)** to block those types across the entire developer account.
