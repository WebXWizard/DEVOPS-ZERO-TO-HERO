# Day 14: Security Best Practices in AWS 🔐🛡️

Security is the highest priority in AWS. In a DevSecOps model, security checks are automated and baked into the pipeline. This module covers the key native tools used to secure AWS environments.

## 🛡️ Core AWS Security Tools Matrix

| Tool | Purpose | How it works |
| :--- | :--- | :--- |
| **KMS (Key Management Service)** | Data Encryption | Create and control the cryptographic keys used to encrypt your data (S3, EBS, RDS). |
| **AWS Shield** | DDoS Protection | Automatically defends against Distributed Denial of Service attacks on network layers (Standard is free to all). |
| **AWS WAF (Web Application Firewall)** | Layer 7 Web Security | Protects web applications from common exploits (like SQL injection or Cross-Site Scripting). |
| **AWS Config** | Compliance auditing | Records resource configurations and alerts you if resources drift from desired secure configurations. |
| **Security Hub** | Centralized view | A single pane of glass showing security alerts and compliance status across all AWS accounts. |

## 🔒 Implementing Encryption (In Transit vs. At Rest)

Data must be protected both when it is moving and when it is stored.

| Type of Encryption | What it is | How to configure in AWS |
| :--- | :--- | :--- |
| **In Transit** | Protecting data while it travels over the network (e.g., from the browser to your server). | Use SSL/TLS Certificates generated via **AWS Certificate Manager (ACM)** on your Load Balancers or CloudFront distributions. |
| **At Rest** | Protecting data while it is stored on physical disks. | Enable KMS encryption on **S3 Buckets**, **EBS Volumes**, and **RDS Databases** via a simple checkbox in the console/templates. |

## 🔑 Managing Secrets and Credentials

Hardcoding passwords or API keys in your application code or GitHub repositories is a critical security failure.

1. **AWS Secrets Manager**:
   - Use this to store database credentials, API keys, and other secrets.
   - You can configure Secrets Manager to automatically rotate credentials (e.g., change the RDS password every 30 days) securely.
   - Applications retrieve secrets via API calls at runtime.

2. **AWS Systems Manager (SSM) Parameter Store**:
   - A cheaper alternative for storing configuration data and secrets. Secure parameters are encrypted via KMS.

## 📋 Security Audits: IAM Access Analyzer

The **IAM Access Analyzer** continuously monitors your accounts to proactively identify resources that are shared with external entities.

*   **Example**: If someone accidentally attaches a policy to an S3 bucket making it public, the Access Analyzer immediately flags this as a critical finding, allowing the DevOps team to remediate the vulnerability instantly.
