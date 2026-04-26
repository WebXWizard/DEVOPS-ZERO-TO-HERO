# Architecture, Migration & Cost - Interview Prep

## 1. The 6 Pillars of the Well-Architected Framework
*Memorize these titles. They are the language of AWS Solutions Architects.*
1. **Operational Excellence:** Running and monitoring systems to deliver business value. (CI/CD, Infrastructure as Code).
2. **Security:** Protecting information and systems. (IAM, Encryption, Shield).
3. **Reliability:** Ability to recover from failures. (Auto Scaling, Multi-AZ, Backups).
4. **Performance Efficiency:** Using computing resources efficiently. (Right instance types, caching with ElastiCache/CloudFront).
5. **Cost Optimization:** Avoiding unnecessary costs. (Spot instances, Savings Plans, destroying unused resources).
6. **Sustainability:** Minimizing environmental impact. (Using ARM-based Graviton processors).

## 2. Migration Strategies (The "6 Rs")
When moving an app to the cloud:
1. **Rehost ("Lift and Shift"):** Move as-is to EC2. Quickest, least optimized.
2. **Replatform ("Lift, Tweak, and Shift"):** Move to managed services (e.g., Self-hosted MySQL -> Amazon RDS). same core code.
3. **Refactor / Re-architect:** Rewrite code to be Cloud Native (e.g., Monolith -> Microservices/Lambda). Most expensive initially, cheapest long-term.
4. **Repurchase:** Drop custom app, buy SaaS (e.g., Move to Salesforce or Workday).
5. **Retain:** Keep it on-premise (for compliance/latency).
6. **Retire:** Turn it off (it's no longer needed).

## 3. Cost Optimization Techniques
- **Right Sizing:** Don't use a `c5.4xlarge` if `t3.medium` is enough. Review CloudWatch metrics.
- **Storage Lifecycle:** Move old S3 data to Glacier.
- **Compute Savings:** Buy Reserved Instances or Savings Plans for steady workloads.
- **Data Transfer:** Avoid data transfer OUT to internet. Keep traffic within the AWS network (VPC Endpoints).

## 4. Disaster Recovery (DR) Patterns
- **Backup & Restore:** Cheapest, slowest RTO (Recovery Time Objective).
- **Pilot Light:** Data is live, services are off/idle. Turn them on when needed.
- **Warm Standby:** Scaled-down version running always. Scale up in disaster.
- **Multi-Site Active/Active:** Most expensive, zero downtime. Traffic goes to both regions.
