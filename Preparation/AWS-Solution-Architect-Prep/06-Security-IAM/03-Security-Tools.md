# AWS Security Tools

## 1. AWS WAF (Web Application Firewall)
- Protects your web applications from common web exploits.
- **Layer:** Layer 7 (Application).
- **Targets:** Application Load Balancer, API Gateway, CloudFront.
- **Blocks:** SQL Injection, Cross-Site Scripting (XSS), Geo-blocking.

## 2. AWS Shield
- **Purpose:** DDoS Protection.
- **Standard:** Free. Always on.
- **Advanced:** $3,000/month. 24/7 Response Team (DRT). Reimbursement of costs incurred via attack.

## 3. AWS GuardDuty
- **Purpose:** Intelligent Threat Detection.
- **How:** Analyzes logs (CloudTrail, VPC Flow Logs, DNS Logs) using Machine Learning.
- **Finds:** "Bitcoin mining on EC2", "Login from unusual IP".

## 4. AWS Inspector
- **Purpose:** Vulnerability Scanner.
- **How:** Agent installed on EC2.
- **Finds:** Common Vulnerabilities (CVEs), Network exposure.

## 5. AWS KMS (Key Management Service)
- **Purpose:** Managing encryption keys.
- **Features:** Regional. Multi-tenant hardware security module (HSM).
- **Usage:** EBS Volumes, S3 Buckets, RDS Databases.
