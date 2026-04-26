# Architecture, Migration & Cost Optimization

## 1. The Well-Architected Framework (6 Pillars)
1. **Operational Excellence:** Automate changes, respond to events, define standards.
2. **Security:** Protect data & systems. Privilege management, encryption.
3. **Reliability:** Recover from failure. Self-healing, scaling, distributed systems.
4. **Performance Efficiency:** Selection of right resource types. Serverless.
5. **Cost Optimization:** Analyze attribution, avoid waste, scale down.
6. **Sustainability:** Minimizing environmental impact.

## 2. Migration Strategies (The 6 Rs)
1. **Rehost:** "Lift and Shift". Move servers to EC2. Fast.
2. **Replatform:** "Lift, Tweak, Shift". Move DB to RDS. Optimizes overhead.
3. **Refactor:** "Re-architect". Rewrite as Cloud Native (Lambda). Long-term gain.
4. **Repurchase:** Drop legacy app for SaaS (Salesforce).
5. **Retain:** Keep on-premise.
6. **Retire:** Turn off.

## 3. Cost Optimization
- **Right Sizing:** Monitoring CloudWatch to downgrade unused capacity.
- **Spot Instances:** For fault-tolerant workloads (90% savings).
- **Reserved Instances/Savings Plans:** For steady-state workloads (72% savings).
- **Storage Lifecycle:** Automate moving S3 data to Glacier.

## 4. Disaster Recovery (DR)
- **Backup & Restore:** RTO: Hours/Days. Cost: Low.
- **Pilot Light:** Data live, App servers off. RTO: Tens of minutes. Cost: Low-Mid.
- **Warm Standby:** Scaled down version running always. RTO: Minutes. Cost: Mid.
- **Multi-Site Active/Active:** Zero downtime. Traffic routed to both regions. Cost: High.
