# VPC Basics

## 1. VPC Structure
- **Region:** A VPC lives in a Region.
- **CIDR:** Defines the IP range. `10.0.0.0/16` is standard (65,536 IPs).
- **AZ:** Subnets live in an AZ.

## 2. Subnets
- **Public:** Has an entry in Route Table to Internet Gateway (IGW).
- **Private:** No Internet access locally.

## 3. NAT Devices (Outbound Internet for Private Subnets)
- **NAT Gateway (Managed):**
  - High availability handled by AWS.
  - Scale up to 45Gbps per AZ.
  - Requires an Elastic IP.
  - Must be placed in a **Public Subnet**.
- **NAT Instance (Legacy):**
  - Just an EC2 script.
  - You manage security patches and specific AMIs.
  - Must disable "Source/Destination Checks".

## 4. DHCP Options Sets
- Use this if you need to pass your own DNS server domain name to instances instead of AWS defaults.
