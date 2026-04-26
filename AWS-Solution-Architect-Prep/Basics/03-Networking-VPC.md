# AWS Networking (VPC) - Interview Prep

## 1. VPC (Virtual Private Cloud)
Your logical data center in the cloud.

### Components Checklist
- **CIDR Block:** IP range (e.g., `10.0.0.0/16` gives 65,536 IPs).
- **Subnets:**
  - *Public Subnet:* Has a route to Internet Gateway. Servers here can be reached from internet (Web servers).
  - *Private Subnet:* No direct route to/from internet. Safer. (Databases, App logic).
- **Internet Gateway (IGW):** Allows Public Subnets to talk to the internet.
- **NAT Gateway:** Allows **Private Subnets** to talk to the internet (outbound only, e.g., for downloading updates) but prevents internet from initiating connection.
  - *Note:* Costs money per hour + data. Highly available (managed).
- **Route Tables:** The map. Tells traffic where to go (e.g., `0.0.0.0/0` -> IGW).

### Security (Layered Defense)
1. **Security Groups (SG):** Instance-level firewall.
   - *Stateful:* If you allow request IN, response OUT is automatically allowed.
   - Rules: Allow only (cannot explicitly deny).
2. **NACL (Network Access Control List):** Subnet-level firewall.
   - *Stateless:* Must explicitly allow both IN and OUT.
   - Rules: Allow and Deny. Good for blocking specific bad IPs.

---

## 2. Advanced Connectivity

### VPC Peering
Connect two VPCs privately. Works across regions/accounts. Not transitive (A<->B and B<->C does not mean A<->C).

### Transit Gateway
Hub-and-spoke web for connecting hundreds of VPCs and on-premise networks. Solves the complex mesh of peering.

### VPN vs Direct Connect
- **VPN:** Site-to-Site connection over public internet. Quick, cheap, encrypted. Unpredictable speed.
- **Direct Connect (DX):** Dedicated fiber cable from your office to AWS. High speed (1Gbps+), reliable, expensive.

### VPC Endpoints (PrivateLink)
Connect your VPC to AWS services (S3, Dynamo, etc.) privately WITHOUT going over the public internet. Secure and faster.
- *Interface Endpoint:* Uses ENI (Elastic Network Interface).
- *Gateway Endpoint:* Used for S3 and DynamoDB only.
