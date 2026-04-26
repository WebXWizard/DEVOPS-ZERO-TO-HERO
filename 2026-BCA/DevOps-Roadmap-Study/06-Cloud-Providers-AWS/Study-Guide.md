# Cloud Providers (AWS) Study Guide

**Estimated Time**: 4-6 weeks

AWS is the market leader in cloud computing. DevOps engineers use AWS to provision and manage servers, storage, databases, and networking at scale.

## Essential Concepts

### 1. EC2 (Elastic Compute Cloud)
Virtual servers:
- **Instance types**: Optimization for compute, memory, and storage.
- **AMI (Amazon Machine Image)**: Blueprints for instances.
- **EBS (Elastic Block Store)**: Persistent block storage for instances.
- **Key Pairs**: Secure access to instances via SSH.
- **User Data**: Scripts to run bootstrap commands on instance launch.

### 2. S3 (Simple Storage Service)
Object storage:
- **Buckets**: Logical containers for data.
- **Objects**: Data files (at any size).
- **Versioning**: Maintain multiple versions of an object.
- **Lifecycle Policies**: Automatically move objects to cheaper storage classes (e.g., Glacier).
- **Static Website Hosting**: Serve HTML/CSS/JS directly from S3.

### 3. IAM (Identity and Access Management)
Security and permissions:
- **Users**: Individuals or applications needing access.
- **Groups**: Collections of users.
- **Roles**: AWS services or identities needing specific permissions.
- **Policies**: JSON documents defining allowed/denied actions.
- **MFA (Multi-Factor Authentication)**: Enhancing security for root and IAM users.

### 4. VPC (Virtual Private Cloud)
Private, isolated networks:
- **Subnets**: Public (internet-facing) and Private.
- **Route Tables**: Controlling traffic flow.
- **Internet Gateways (IGW)**: Connecting your VPC to the internet.
- **NAT Gateways**: Allowing private instances to reach the internet.
- **Security Groups & ACLs**: Controlling inbound/outbound traffic.

### 5. RDS (Relational Database Service)
Managed databases:
- **Engine options**: MySQL, PostgreSQL, Oracle, SQL Server, etc.
- **Multi-AZ Deployment**: High availability and automatic failover.
- **Read Replicas**: Scaling database reads.
- **Automated Backups**: Simplified disaster recovery.

### 6. Lambda (Serverless Compute)
Funtion as a Service (FaaS):
- **Triggers**: S3 events, API Gateway, DynamoDB streams, etc.
- **Statelessness**: Runs only when triggered; stores no state.
- **Cost-efficiency**: Pay only for execution time.

### 7. CloudWatch (Monitoring and Logging)
Tracking metrics and logs:
- **Metrics**: CPU usage, network I/O, disk R/W.
- **Alarms**: Notify or trigger actions based on thresholds.
- **Logs**: Centralize and analyze application and system logs.
- **Events (EventBridge)**: Schedule tasks or respond to system changes.

---
**Practical Challenge**: Launch a free-tier EC2 instance, install a web server (e.g., Nginx), and host a simple "Hello World" page. Ensure your security group allows HTTP traffic on Port 80.
