# Day 4: Networking Essentials with VPC 🌐🔌

Amazon Virtual Private Cloud (Amazon VPC) enables you to launch AWS resources into a virtual network that you've defined. This virtual network closely resembles a traditional network that you'd operate in your own data center, with the benefits of using the scalable infrastructure of AWS.

## 🌍 VPC Architecture & Components

A secure VPC design isolates backend systems (like databases) from the public internet while allowing necessary external access via specific entry points.

```mermaid
graph TD
    subgraph VPC [VPC (Virtual Private Cloud)]
        
        IGW((Internet<br>Gateway))
        
        subgraph PublicSubnet [Public Subnet]
            Web[Web Server / Load Balancer]
            NAT((NAT<br>Gateway))
        end
        
        subgraph PrivateSubnet [Private Subnet]
            App[Application Server]
            DB[(Database Server)]
        end
        
        IGW --- PublicSubnet
        PublicSubnet --- PrivateSubnet
        
    end
    
    Internet((Internet)) <--> IGW
    App -->|Outbound request| NAT
    NAT -->|Routing to Internet| IGW
```

### Core Definitions

| Component | Definition | Analogy |
| :--- | :--- | :--- |
| **VPC** | A logically isolated section of the AWS Cloud. | The walls of your data center building. |
| **Subnet** | A range of IP addresses in your VPC. | Specific rooms in the building. |
| **Route Table**| A set of rules, called routes, that are used to determine where network traffic is directed. | Hallway signs directing traffic. |
| **Internet Gateway (IGW)** | A VPC component that allows communication between instances in your VPC and the internet. | The front door of the building. |
| **NAT Gateway** | Allows instances in a private subnet to connect to the internet, but prevents the internet from initiating connections with those instances. | A mailroom that sends packages out but doesn't let delivery drivers inside. |

## 🔒 Security Groups vs. Network ACLs

AWS uses two layers of security to control traffic into and out of your VPC.

| Feature | Security Group (SG) | Network Access Control List (NACL) |
| :--- | :--- | :--- |
| **Level** | Operates at the **Instance** level. | Operates at the **Subnet** level. |
| **Rule Type** | Supports **Allow** rules only. | Supports both **Allow** and **Deny** rules. |
| **Statefulness**| **Stateful**: Return traffic is automatically allowed, regardless of any rules. | **Stateless**: Return traffic must be explicitly allowed by rules. |
| **Evaluation** | Evaluates all rules before deciding to allow traffic. | Evaluates rules in number order (lowest to highest) when deciding whether to allow traffic. |

## 🏗️ Best Practices for Isolated Environments

1. **Use Multiple Availability Zones**: Always span your VPC across at least 2 AZs for high availability.
2. **Never Put Databases in Public Subnets**: Store RDS instances in private subnets and access them via EC2 instances in a public subnet (Bastion Hosts / Jump Boxes).
3. **Least Privilege Routing**: Ensure route tables only have paths to the internet if absolutely required.
