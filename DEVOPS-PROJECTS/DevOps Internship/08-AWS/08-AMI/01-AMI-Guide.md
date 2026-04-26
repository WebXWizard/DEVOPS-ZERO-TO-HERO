# Amazon Machine Image (AMI)

## What is an AMI?
An AMI is a template that provides the information required to launch an instance. You must specify an AMI when you launch an instance.

## AMI Components
1.  **Root Volume Template**: OS, Application Server, Applications.
2.  **Launch Permissions**: Which AWS accounts can use the AMI (Public vs Private).
3.  **Block Device Mapping**: Which volumes to attach to the instance at launch.

## Creating an AMI (Usage)
1.  **Golden Image**: Configure an EC2 instance with all software/patches installed. Create AMI. Launch new instances from this AMI to speed up boot time (Bakery pattern).
2.  **Backups**: Creating an AMI serves as a full backup of the instance.

## AMI Types
1.  **Public**: Provided by AWS or community (e.g., Ubuntu 20.04).
2.  **Private**: Created by you for your use.
3.  **Marketplace**: Paid AMIs with software pre-installed (e.g., CIS Hardened Linux, WordPress).

## DevOps Use Case via Packer
DevOps engineers often use **Packer** (by HashiCorp) to automate the creation of AMIs.
*   Code -> Packer -> AMI -> Terraform -> EC2.

## Interview Questions
1.  **Are AMIs Regional?**
    *   Yes. AMIs are unique to a region. To use an AMI in another region, you must **Copy** it to that region.

2.  **What is the difference between an AMI and a Snapshot?**
    *   **Snapshot**: Backup of a specific EBS volume (Disk).
    *   **AMI**: Backup of the entire instance (includes Snapshots of volumes + Metadata + Permissions).

3.  **How do you share an AMI with another AWS account?**
    *   Modify the AMI permissions (Modify Image Permissions) and add the 12-digit AWS Account ID of the target account.
