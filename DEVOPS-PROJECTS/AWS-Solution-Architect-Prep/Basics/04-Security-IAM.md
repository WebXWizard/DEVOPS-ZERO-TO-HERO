# AWS Security (IAM) - Interview Prep

## 1. Identity and Access Management (IAM)
**Global Service:** Users created in IAM are global, not region-specific.

### Core Components
1. **Users:** Real people or applications. Have long-term credentials (password or Access Keys).
2. **Groups:** Collection of users. Apply permission policies to the group, not individual users (Best Practice).
3. **Roles:** Temporary identities. **Startups/Enterprises love this.**
   - *Assumable by:* AWS Services (EC2 accessing S3), Users from other AWS accounts, Federated users (Google/Facebook login).
   - *No long-term keys:* Uses temporary security tokens (STS).
4. **Policies:** JSON documents defining permissions.
   - *Managed Policies:* Created by AWS (Start here).
   - *Inline Policies:* Specific to a user/role (Avoid unless necessary).

### Best Practices checklist
- **S.O.P:** Principle of Least Privilege (Give only permission needed).
- **Root User:** Lock it away. Use it ONLY for billing or account closing. Enable MFA.
- **MFA:** Enforce on all users.
- **Access Keys:** Rotate regularly. Never commit them to Git!!

---

## 2. Key Security Services

### AWS WAF (Web Application Firewall)
Protects web apps from common exploits (SQL injection, XSS). Attaches to ALB, API Gateway, CloudFront.

### AWS Shield
DDoS protection.
- *Standard:* Free. Protects against common attacks.
- *Advanced:* Paid ($3k/mo). 24/7 access to DDoS response team.

### KMS (Key Management Service)
Managed encryption keys.
- FIPS 140-2 Level 2 validated.
- Integrated with almost all AWS services (EBS, S3, RDS).

### Inspector vs GuardDuty
- **Inspector:** Scans **EC2 instances** for vulnerabilities (missing patches). "Internal Audit".
- **GuardDuty:** Intelligent threat detection. Analyzes Logs (VPC Flow Logs, DNS logs) to find bad actors. "Security Camera".
