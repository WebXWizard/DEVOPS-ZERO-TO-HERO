# AWS Cloud Fundamentals

## Core Services (The "Legos")

### 1. Compute
-   **EC2 (Elastic Compute Cloud)**: Virtual servers. You manage the OS.
-   **Lambda**: Serverless compute. Run code without provisioning servers.
-   **ECS/EKS**: Container orchestration (Docker/Kubernetes).

### 2. Storage
-   **S3 (Simple Storage Service)**: Object storage (files, images, backups). Unlimited scaling.
-   **EBS (Elastic Block Store)**: Hard drives for EC2 instances.
-   **EFS (Elastic File System)**: Shared file system for Linux instances.

### 3. Networking
-   **VPC (Virtual Private Cloud)**: Your isolated network in the cloud.
-   **Subnet**: Segmentation of VPC (Public/Private).
-   **Security Group**: Stateful firewall (for EC2).
-   **Route 53**: DNS service.
-   **ELB (Elastic Load Balancer)**: Distributes traffic across instances.

### 4. Database
-   **RDS (Relational Database Service)**: Managed MySQL, PostgreSQL, etc.
-   **DynamoDB**: Managed NoSQL key-value database.

### 5. Security
-   **IAM (Identity and Access Management)**: Manage access rights (Users, Groups, Roles).

## Essential Concepts
-   **Region**: Physical location (e.g., us-east-1, ap-south-1).
-   **Availability Zone (AZ)**: Isolated data center within a region.
-   **Auto Scaling**: Automatically add/remove instances based on demand.

## Interview Questions
1.  **Difference between Region and AZ?**
    *Region is a geographic area. AZ is a data center within a region. Regions have multiple AZs.*

2.  **Security Group vs Network ACL?**
    *Security Group: Instance level, Stateful (return traffic allowed automatically).*
    *NACL: Subnet level, Stateless (must explicitly allow return traffic).*

3.  **What is an IAM Role?**
    *An identity with specific permissions, not associated with a specific person. Used by AWS services (e.g., EC2 accessing S3).*

4.  **S3 Storage Classes?**
    *Standard (frequent), Intelligent-Tiering, Standard-IA (infrequent), Glacier (archive).*

5.  **Vertical vs Horizontal Scaling?**
    *Vertical: Bigger instance (more RAM/CPU). Horizontal: More instances.*
