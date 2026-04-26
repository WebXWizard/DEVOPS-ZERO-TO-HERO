# EC2 (Elastic Compute Cloud) Mastery

EC2 is basically a "Virtual Computer" rented from Amazon.

## 1. Instance Types (The Menu)
Amazon names instances like `t2.micro` or `m5.large`.
- **First Letter (Family)**: `t` (General/Burstable), `m` (General), `c` (Compute), `r` (Memory/RAM).
- **Number (Generation)**: `5` is newer than `2`.
- **Size**: `nano`, `micro`, `large`, `xlarge`.
- **Beginner Choice**: `t2.micro` or `t3.micro` (Free Tier Eligible).

## 2. Security Groups (The Firewall)
A Security Group acts as a virtual firewall for your instance.
- **Inbound Rules**: Traffic coming IN (e.g., SSH, HTTP).
- **Outbound Rules**: Traffic going OUT (usually "All Traffic" allowed by default).
- **Stateful**: If you allow a request IN, the response is automatically allowed OUT.

**Common Ports**:
- `22`: SSH (Linux Access) - **Restrict this to "My IP" only!**
- `80`: HTTP (Web traffic).
- `443`: HTTPS (Secure Web traffic).
- `3389`: RDP (Windows Access).

## 3. Storage (EBS)
- **EBS (Elastic Block Store)**: The hard drive for your EC2.
- It persists even if the instance stops.
- It is locked to an Availability Zone (AZ). You cannot attach an EBS volume in `us-east-1a` to an instance in `us-east-1b`.

## 4. Hands-On: Launch an Instance
1.  Go to EC2 Dashboard -> **Launch Instance**.
2.  **Name**: `My-First-Server`.
3.  **AMI (OS)**: Select `Ubuntu` or `Amazon Linux 2023`.
4.  **Instance Type**: `t2.micro`.
5.  **Key Pair**: Create new -> Download `.pem` file. **Keep this safe!**
6.  **Network**: Allow SSH traffic from "My IP".
7.  **Launch**.

## 5. Connect (SSH)
Open your terminal (PowerShell/Git Bash) where the `.pem` key is.
```bash
chmod 400 my-key.pem  # (If on Linux/Mac/Git Bash)
ssh -i "my-key.pem" ubuntu@<Public-IP-Address>
```
You are now inside the cloud server!
