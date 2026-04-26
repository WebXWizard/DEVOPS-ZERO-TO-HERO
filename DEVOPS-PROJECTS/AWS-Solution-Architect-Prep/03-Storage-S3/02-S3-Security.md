# S3 Security & Advanced Features

## 1. Security
By default, all buckets and objects are PRIVATE.

### Access Control
1. **IAM Policies:** User-based. "What can this user do?" (e.g., Allow User A to read Bucket X).
2. **Bucket Policies:** Resource-based. "Who can access this bucket?" (e.g., Allow specific IPs, Allow only SSL connections, Deny everyone else).
3. **ACLs (Access Control Lists):** Legacy. Avoid using. Use Policies instead.

### Encryption
1. **SSE-S3:** Keys handled & managed by AWS S3. (AES-256).
2. **SSE-KMS:** Keys managed by KMS. Control rotation, auditing.
3. **SSE-C:** Client-side keys. You manage the keys manually.

## 2. Presigned URLs
- **Scenario:** You want a user to upload/download a file directly to S3 without them having AWS credentials.
- **Solution:** Generate a Presigned URL with a short expiration time (e.g., 5 mins).
- **Use Case:** Video upload portal.

## 3. Cross-Region Replication (CRR)
- Automatically copy objects to another region.
- **Requirements:** Versioning enabled on both buckets.
- **Use Case:** Compliance (Store data > 500 miles away), Lower latency for global users.

## 4. S3 Select
- Retrieve only a subset of data from an object (using SQL expressions) instead of the whole file.
- **Benefit:** Less data transfer = Cheaper & Faster.
