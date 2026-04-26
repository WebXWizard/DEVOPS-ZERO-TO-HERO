# VPC Security

## 1. Security Groups (SG)
- **Scope:** Instance Level (EC2).
- **Type:** STATEFUL. (If you allow INBOUND port 80, the response is automatically allowed OUTBOUND).
- **Rules:** 
    - ALLOW rules only (You cannot say "Deny IP 1.2.3.4").
    - Implicit Deny involves blocking everything that is not explicitly allowed.
- **Reference:** Can reference other Security Groups (e.g., Allow access from "LoadBalancer-SG").

## 2. Network ACLs (NACL)
- **Scope:** Subnet Level.
- **Type:** STATELESS. (You must explicitly allow traffic IN and return traffic OUT).
- **Rules:**
    - ALLOW and DENY rules.
    - Processed in numbering order (Low to High).
    - Rule #100 ALLOW SSH. Rule #200 DENY ALL. (SSH works).
    - Rule #100 DENY SSH. Rule #200 ALLOW ALL. (SSH blocked).
- **Use Case:** "Block a specific malicious IP address."

## 3. VPC Flow Logs
- Captures information about the IP traffic going to and from network interfaces in your VPC.
- **Destinations:** S3 or CloudWatch Logs.
- **Use Case:** Troubleshooting connectivity issues, audit trails.
