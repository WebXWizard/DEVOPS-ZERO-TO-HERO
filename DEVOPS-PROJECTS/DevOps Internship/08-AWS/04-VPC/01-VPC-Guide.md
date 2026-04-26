# Amazon VPC (Virtual Private Cloud)

## What is VPC?
A logically isolated virtual network in the AWS cloud where you launch your AWS resources (like EC2 instances). You have full control over your networking environment (IP range, subnets, route tables, network gateways).

## Architecture Components

### 1. CIDR Block
Classless Inter-Domain Routing. Defines the IP address range for the VPC (e.g., `10.0.0.0/16`).

### 2. Subnet
A range of IP addresses in your VPC.
*   **Public Subnet**: Has a route to the Internet Gateway. Instances have Public IPs.
*   **Private Subnet**: No direct route to the Internet. Instances have only Private IPs.

### 3. Internet Gateway (IGW)
A horizontally scaled, redundant, and highly available VPC component that allows communication between your VPC and the internet.

### 4. NAT Gateway / NAT Instance
Allows instances in a private subnet to connect to the internet (e.g., for software updates) but prevents the internet from initiating connections to them. NAT Gateway is managed; NAT Instance is manual (EC2).

### 5. Route Table
Contains a set of rules (routes) that determine where network traffic from your subnet or gateway is directed.

### 6. Security Group vs NACL (Network Access Control List)
| Feature | Security Group (SG) | Network ACL (NACL) |
| :--- | :--- | :--- |
| **Level** | Instance Level | Subnet Level |
| **State** | Stateful (Return traffic allowed) | Stateless (Must allow return traffic) |
| **Rules** | Allow only | Allow and Deny |
| **Order** | All rules evaluated | Numbered order |

## VPC Peering
Connecting two VPCs so they can route traffic between them using private IPv4 addresses.

## Interview Questions
1.  **What components are needed to make a subnet "Public"?**
    *   An Internet Gateway (IGW) attached to the VPC.
    *   A Route Table attached to the Subnet.
    *   A Route in that table pointing `0.0.0.0/0` (internet) to the IGW.

2.  **How do you connect to a private instance without a Public IP?**
    *   **Bastion Host (Jump Box)**: A public instance used to SSH into private instances.
    *   **VPN**: Site-to-Site VPN.
    *   **Direct Connect**: Dedicated physical connection.
    *   **SSM Session Manager**: (Preferred) Use Systems Manager to connect without opening SSH ports.

3.  **Can a VPC span multiple regions?**
    *   No. VPCs are Region-bound. They can span multiple Availability Zones (AZs) within that region.
