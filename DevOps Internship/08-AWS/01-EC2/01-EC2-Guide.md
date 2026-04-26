# Amazon EC2 (Elastic Compute Cloud)

## What is EC2?
Amazon EC2 provides scalable computing capacity in the AWS cloud. It allows you to launch virtual servers (instances) to run applications.

## Key Concepts
1.  **Instances**: Virtual servers.
2.  **AMI (Amazon Machine Image)**: Template for creating an instance (OS + App Server + Applications).
3.  **Instance Types**:
    *   **General Purpose (T2, T3, M5)**: Balanced resources (Web servers).
    *   **Compute Optimized (C5)**: High performance processors (Batch processing).
    *   **Memory Optimized (R5)**: Large RAM (Databases, Caching).
4.  **EBS (Elastic Block Store)**: Persistent block storage volume attached to instances (Virtual Hard Drive).
5.  **Key Pairs**: Secure login information (Public/Private keys).
6.  **Security Groups**: Virtual firewall controlling traffic.

## DevOps Configurations
*   **User Data**: Script to run on instance first launch (e.g., `yum update -y`, `systemctl start httpd`).
*   **Tags**: Metadata for organization and cost allocation.
*   **Termination Protection**: Prevents accidental deletion.

## Metadata vs User Data
*   **Instance Metadata**: Data *about* your instance (IP, Instance ID). stored at `http://169.254.169.254/latest/meta-data/`
*   **User Data**: Scripts *passed to* the instance at launch.

## Interview Questions
1.  **Differentiate between Stop, Terminate, and Hibernate?**
    *   **Stop**: Shuts down OS. Data on EBS kept. IP changes (unless Elastic IP). Billing stops for compute.
    *   **Terminate**: Deletes instance. EBS Root volume deleted (by default).
    *   **Hibernate**: Freezes contents of RAM to disk. Faster startup.

2.  **What is an Elastic IP?**
    *   A static IPv4 address designed for dynamic cloud computing. If you restart an instance without EIP, its public IP changes.

3.  **What happens to data on the root volume when you terminate an instance?**
    *   By default, the root EBS volume is DELETED. You can change this behavior by disabling "Delete on Termination" attribute.

4.  **Spot Instances vs On-Demand?**
    *   **On-Demand**: Fixed price, no commitment.
    *   **Spot**: Bidding for unused capacity (Up to 90% discount). Can be interrupted with 2-minute warning.
    *   **Reserved**: 1-3 year commitment for discount.
