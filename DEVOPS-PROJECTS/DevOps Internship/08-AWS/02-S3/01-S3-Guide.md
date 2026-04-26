# Amazon S3 (Simple Storage Service)

## What is S3?
Object storage service offering industry-leading scalability, data availability, security, and performance. You store "Objects" (files) in "Buckets" (containers).

## Key Concepts
1.  **Object**: The file itself (data) + metadata + key (name).
2.  **Bucket**: Container for objects. Must have a **globally unique name**.
3.  **Versioning**: Keep multiple variants of an object in the same bucket. Helps recover from accidental deletes.
4.  **Static Website Hosting**: Host HTML/CSS/JS directly from S3 without a server.

## Storage Classes
1.  **S3 Standard**: 99.99% Availability. Frequently accessed data.
2.  **S3 Intelligent-Tiering**: Automatically moves data between tiers based on access patterns.
3.  **S3 Standard-IA (Infrequent Access)**: Long-lived, less frequently accessed data (Backups).
4.  **S3 One Zone-IA**: Stored in only one AZ (Cheaper, less resilient).
5.  **S3 Glacier**: Archival. Retrieval times minutes to hours.
6.  **S3 Glacier Deep Archive**: Lowest cost. Retrieval time ~12 hours.

## Consistency Model
*   **Strong Consistency**: After a successful write/overwrite of an object, any subsequent read receives the latest version.

## DevOps Use Cases
*   **Terraform Backend**: Storing `terraform.tfstate`.
*   **Artifact Store**: Storing build artifacts (JARs, Docker images in ECR - which uses S3 backend).
*   **Logs**: Storing CloudTrail, VPC Flow logs, ALB logs.

## Interview Questions
1.  **What is a Bucket Policy?**
    *   Resource-based policy (JSON) attached directly to the bucket to control access (e.g., Allow public read access for a website).

2.  **How do you encrypt data in S3?**
    *   **SSE-S3**: Keys managed by S3.
    *   **SSE-KMS**: Keys managed by AWS KMS (Key Management Service).
    *   **SSE-C**: Customer-provided keys.
    *   **Client-Side Encryption**: Encrypt before uploading.

3.  **What is a Presigned URL?**
    *   A way to grant temporary access to a private object via a URL. (e.g., allowing a user to upload a profile picture without AWS credentials).

4.  **How to automate moving files to Glacier after 30 days?**
    *   Use **S3 Lifecycle Policies**. Define a rule to transition objects to Glacier after 30 days.
