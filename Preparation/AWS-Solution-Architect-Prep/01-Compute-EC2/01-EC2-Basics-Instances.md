# EC2 Basics & Instances

## 1. Introduction
Amazon Elastic Compute Cloud (EC2) provides scalable computing capacity in the AWS Cloud. You don't need to invest in hardware up front, so you can develop and deploy applications faster.

## 2. Instance Families (The "Right Sizing" Choice)
Memorize the acronyms. It shows deep knowledge.

| Family | Use Case | Mnemonic |
| :--- | :--- | :--- |
| **General Purpose (T, M)** | Web servers, code repositories, microservices. Balanced CPU/RAM. | **T**iny / **M**ain |
| **Compute Optimized (C)** | Batch processing, scientific modeling, gaming servers. High CPU. | **C**ompute |
| **Memory Optimized (R, X)** | Relational DBs, NoSQL DBs (Cassandra), In-memory caches (Redis). High RAM. | **R**AM |
| **Storage Optimized (I, D)** | Data warehousing, distributed filesystems, transactional DBs. High I/O. | **I**O / **D**isk |
| **GPU/Accelerated (P, G, F)** | Machine learning, 3D rendering, video encoding. | **P**ictures / **G**raphics |

## 3. Purchasing Options (Cost Optimization)
This is a HUGE topic for Solution Architects.

### On-Demand
- **Pay:** By the second (linux) or hour (windows).
- **Commitment:** None.
- **Use Case:** Short term, spiky, or unpredictable workloads. First time apps.

### Reserved Instances (RI)
- **Pay:** Up front, partial up front, or no up front.
- **Commitment:** 1 or 3 years.
- **Discount:** Up to 72% off On-Demand.
- **Types:**
    - *Standard:* Can't change instance family. Higher discount.
    - *Convertible:* Can change instance family (e.g., C5 to R5) later. Lower discount.
- **Use Case:** Steady-state usage (e.g., your reliable database).

### Savings Plans
- **Pay:** $/hour commitment.
- **Commitment:** 1 or 3 years.
- **Flexibility:** Applies to EC2 + Fargate + Lambda.
- **Use Case:** Modern standard for long-term savings. Easier to manage than RIs.

### Spot Instances
- **Pay:** Market price (up to 90% off).
- **Risk:** Can be interrupted with 2 minutes notice.
- **Use Case:** Stateless apps, batch jobs, CI/CD, unexpected loads.
- **Strategy:** "Spot Fleet" - diversify across instance types to minimize interruption risk.

### Dedicated Hosts
- **Pay:** For the physical server.
- **Use Case:** Compliance (HIPAA), or using existing BYO server licenses (Windows/Oracle).
