# Advanced Networking

## 1. VPC Peering
- Connects two VPCs as if they are ONE network.
- **Rules:**
  - Non-overlapping CIDR blocks.
  - No Transitive Peering (Edge to Edge is not allowed; A-B and B-C does not mean A-C).
  - Works cross-account and cross-region.

## 2. Transit Gateway (TGW)
- **Scenario:** You have 100 VPCs. Peering them all (Mesh) is complex.
- **Solution:** Hub-and-spoke model. All VPCs connect to TGW.
- Supports Multicast.

## 3. VPC Endpoints (PrivateLink)
- **Scenario:** Your application in a Private Subnet needs to access S3.
- **Bad Way:** Go through NAT Gateway -> Public Internet -> S3 Public Endpoint. (Costly, less secure).
- **Good Way:** Use VPC Endpoint. Stays entirely within AWS network.
  - *Interface Endpoint:* ENI with private IP. (Most services).
  - *Gateway Endpoint:* Route table entry. (S3 and DynamoDB ONLY).

## 4. Hybrid Cloud (On-Prem to AWS)
- **VPN:** Uses public internet. Quick setup. Setup Customer Gateway (On-prem) and Virtual Private Gateway (AWS).
- **Direct Connect (DX):** Private fiber.
  - *Direct Connect Gateway:* Communicate with VPCs in any region.
