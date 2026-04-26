# Relational Databases (RDS & Aurora)

## 1. Amazon Aurora
The "AWS Native" relational database.
- **Storage:** Auto-scales in 10GB increments up to 128TB. Shared storage volume across 3 Availability Zones (AZs) with 6 copies of data.
- **Resilience:** Can lose 2 copies of data without affecting write availability. Can lose 3 copies without affecting read availability.
- **Endpoints:**
  - *Cluster Endpoint:* Points to the primary instance (Writer).
  - *Reader Endpoint:* Load balances across read replicas.

## 2. RDS Features
- **Multi-AZ Deployment:** SYNCHRONOUS replication.
  - *Purpose:* Disaster Recovery (High Availability). If main DB fails, CNAME points to standby.
- **Read Replicas:** ASYNCHRONOUS replication.
  - *Purpose:* Scalability. Offload read traffic (Reporting apps).
  - *Note:* Costs money (data transfer across AZs is free within same region for RDS, but instance cost applies).

## 3. RDS Proxy
- A fully managed proxy for RDS.
- **Problem:** Thousands of Lambda functions open thousands of connections to the DB, crashing it ("Connection storm").
- **Solution:** Use RDS Proxy to pool and share connections.

## 4. Authentication
- **IAM Authentication:** Use IAM roles to login to DB instead of password. Safer.
