# Day 3: EC2 for DevOps 💻📡

Amazon Elastic Compute Cloud (EC2) provides scalable computing capacity in the AWS cloud. It is the fundamental building block for most non-serverless applications.

## 🖥️ Understanding EC2 Instances, AMIs, and Types

An EC2 Instance is a virtual server. To launch one, you need a blueprint (AMI) and a hardware specification (Instance Type).

```mermaid
graph LR
    AMI[AMI: Amazon Machine Image<br>(OS + Base Software)] --> Launch
    Type[Instance Type<br>(CPU, RAM, Networking)] --> Launch
    Launch(Launch Configuration) --> EC2[Running EC2 Instance]
    Storage[EBS Volume<br>(Persistent Drive)] -.-> EC2
    Security[Security Group<br>(Firewall Rules)] -.-> EC2
```

### Instance Type Categories

| Category | Typical Prefix | Use Cases | Description |
| :--- | :--- | :--- | :--- |
| **General Purpose** | `t`, `m` | Web servers, code repositories | Balanced compute, memory, and networking. |
| **Compute Optimized**| `c` | High-performance computing, gaming | High performance processors. |
| **Memory Optimized** | `r`, `x` | In-memory databases (Redis/Memcached) | Fast performance for workloads that process large data sets in memory. |
| **Storage Optimized**| `i`, `d` | NoSQL DBs, Data warehousing | High, sequential read and write access to very large data sets. |

## 🛠️ Setting up Environments (Dev, Test, Prod)

When using EC2 for DevOps, you rarely run just one instance. You set up distinct environments.

| Environment | Purpose | EC2 Strategy |
| :--- | :--- | :--- |
| **Development** | Where engineers write and test new code. | Use smaller `t3.micro` instances during business hours to save costs. |
| **Testing/Staging**| Mirror image of production for final QA tests. | Use similar instance types to production, automated via Infrastructure as Code. |
| **Production** | Where real users interact with the app. | Use robust instances (e.g., `m5.large`) distributed across multiple Availability Zones for high availability. |

## 🔑 Securing EC2 Instances

Security on EC2 is handled primarily at two levels: Access Authentication (Key Pairs) and Network Traffic (Security Groups).

### 1. SSH Key Pairs
When you create an instance, AWS lets you create or associate a Key Pair (Public Key + Private Key).
- The **Public Key** is stored on the EC2 instance.
- The **Private Key** (often a `.pem` file) is kept by you. You use this to SSH into the Linux box. *Never share this file.*

### 2. Security Groups (Virtual Firewalls)

Security groups act as a firewall for associated EC2 instances, controlling both inbound and outbound traffic at the instance level.

| Rule Type | Default Behavior | How you manage it |
| :--- | :--- | :--- |
| **Inbound (Ingress)** | **ALL DENIED** implicitly. | You must explicitly open ports (e.g., Allow Port 22 from your Home IP, Allow Port 80 from Anywhere `0.0.0.0/0`). |
| **Outbound (Egress)**| **ALL ALLOWED** implicitly. | Usually left open so the instance can download updates, but can be restricted if needed. |
| **Statefulness** | Security Groups are **Stateful**. | If you send a request from your instance, the response traffic for that request is allowed to flow in regardless of inbound security group rules. |
