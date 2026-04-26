# VPC (Virtual Private Cloud) Mastery

**The hardest but most important topic.**
A VPC is your own isolated network in the cloud.

## 1. Anatomy of a VPC
Think of a VPC like your home network.

### A. CIDR Block (The Address Space)
Defines the range of IPs allowed in your network.
- Example: `10.0.0.0/16` (Allows ~65,000 IPs).

### B. Subnets (The Rooms)
You divide your VPC into smaller networks called Subnets.
- **Public Subnet**: Has access to the Internet.
- **Private Subnet**: No direct Internet access (secure).

### C. Internet Gateway (IGW) (The Modem)
Connects your VPC to the outside world. Without this, you are cut off.

### D. Route Tables (The GPS)
Rules that tell traffic where to go.
- Rule: `0.0.0.0/0` -> Target: `InternetGateway` (This makes a subnet Public).

## 2. The Traffic Flow (Interview Q)
"How does traffic reach my EC2 instance?"

1.  User request comes to the **Internet Gateway**.
2.  IGW checks the **Route Table**.
3.  Route Table sends packet to the correct **Subnet**.
4.  **NACL (Network ACL)** checks if the IP is banned (Stateless firewall).
5.  **Security Group** checks if the Port is open (Stateful firewall).
6.  Request reaches the **EC2 Instance**.

## 3. Hands-On: Create a Custom VPC
1.  **Create VPC**: `My-VPC` with CIDR `10.0.0.0/16`.
2.  **Create Subnet**: `My-Public-Subnet` inside `My-VPC` with CIDR `10.0.1.0/24`.
3.  **Create IGW**: `My-IGW` and **Attach** it to your VPC.
4.  **Route Table**:
    - Create a Route Table.
    - Edit Routes: Add `0.0.0.0/0` -> Target `My-IGW`.
    - Subnet Associations: Associate it with `My-Public-Subnet`.
5.  **Test**: Launch an EC2 instance into `My-Public-Subnet`. It should have internet access!
