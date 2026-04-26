# Amazon RDS (Relational Database Service)

## What is RDS?
A managed service that makes it easy to set up, operate, and scale a relational database in the cloud. It manages administrative tasks like backups, software patching, automatic failure detection, and recovery.

## Supported Engines
*   Amazon Aurora (AWS proprietary - High Performance)
*   PostgreSQL
*   MySQL
*   MariaDB
*   Oracle
*   SQL Server

## Key Features
1.  **Multi-AZ Deployments**: Synchronous replication to a standby instance in a different Availability Zone (AZ). providing **High Availability** and Failover support.
2.  **Read Replicas**: Asynchronous replication to serve read-only traffic. Improves **Performance**/Scalability.
3.  **Automated Backups**: Continuous backup to S3 offering point-in-time recovery.
4.  **Snapshots**: User-initiated backups.

## RDS vs EC2 Database
*   **RDS**: Managed. You don't have shell access to underlying OS. Patching is automated.
*   **Database on EC2**: You manage OS, patching, backups, replication. Full control but high maintenance.

## Interview Questions
1.  **Multi-AZ vs Read Replica?**
    *   **Multi-AZ**: Synchronous. For Disaster Recovery (DR). Standby cannot serve traffic.
    *   **Read Replica**: Asynchronous. For Scaling reads. Can serve traffic. Can be promoted to Primary.

2.  **What is Amazon Aurora?**
    *   MySQL/PostgreSQL compatible. Up to 5x faster than MySQL. Auto-scales storage up to 128TB. Replicates data 6 times across 3 AZs.

3.  **How do you encrypt data in RDS?**
    *   Enable encryption at creation time using KMS. Can also force SSL connections from clients.

4.  **What happens during a failover?**
    *   RDS automatically flips the CNAME record (DNS) to point to the standby DB instance. Application usually experiences a short downtime (60-120 seconds).
