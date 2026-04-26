# AWS Storage & Databases - Interview Prep

## 1. Storage Services

### Amazon S3 (Simple Storage Service)
Object storage. Not a file system (flat structure with keys).
- **Storage Classes (Critical for Cost Optimization):**
  - *Standard:* Frequent access. 11 9s durability. High cost.
  - *Standard-IA (Infrequent Access):* Cheaper storage, retrieval fee.
  - *One Zone-IA:* Data in only 1 Availability Zone (risk of data loss if AZ fails).
  - *Intelligent Tiering:* AI moves data between tiers. Great if access patterns is unknown.
  - *Glacier:* Archival. Retrieval times minutes to hours. Very cheap.
- **Security:**
  - *Bucket Policies:* JSON document, applies to entire bucket (e.g., "Allow public read").
  - *Encryption:* SSE-S3 (AWS keys), SSE-KMS (Customer keys), SSE-C (Customer provides keys).
- **Versioning:** Protects against accidental deletes/overwrites.

### Amazon EBS (Elastic Block Store)
Virtual hard drives for EC2.
- **Types:**
  - *GP3/GP2 (General Purpose SSD):* Boot volumes, standard apps.
  - *IO1/IO2 (Provisioned IOPS):* Mission-critical databases.
  - *HDD (ST1, SC1):* Big data, logs (sequential I/O).
- **EBS vs S3:** EBS is block storage (can install OS/DB), S3 is object storage (files only).

---

## 2. Databases

### Amazon RDS (Relational Database Service)
Managed SQL (PostgreSQL, MySQL, MariaDB, Oracle, SQL Server).
- **Features:** Auto-patching, backups.
- **Multi-AZ:** Synchronous replication to another AZ for **Disaster Recovery**. (If Primary dies, Standby takes over automatically).
- **Read Replicas:** Asynchronous copies for **Scaling Read Performance**.

### Amazon Aurora
AWS specific relational DB. MySQL/PostgreSQL compatible.
- **Why use it?** 5x faster than MySQL. Auto-scales storage up to 128TB. 6 copies of data across 3 AZs.
- **Serverless v2:** Scales compute up/down instantly.

### DynamoDB (NoSQL)
Key-value store.
- **Use case:** Massive scale, consistent single-digit ms latency (Shopify cart, gaming leaderboards).
- **Cons:** Complex querying (needs careful schema design).

---

## 3. Database Migration Service (DMS)
Moves databases to AWS with minimal downtime.
- Supports homogeneous (MySQL -> MySQL) and heterogeneous (Oracle -> Aurora) migrations.
- Uses **SCT (Schema Conversion Tool)** for code conversion.
