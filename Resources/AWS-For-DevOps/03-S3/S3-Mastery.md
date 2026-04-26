# S3 (Simple Storage Service) Mastery

S3 is object storage (files), not block storage (hard drives).

## 1. Core Concepts
- **Bucket**: Like a root folder. Must have a **globally unique name** (across all of AWS).
- **Object**: A file inside the bucket.
- **Region**: Buckets are created in a specific region (e.g., `us-east-1`), but names are global.

## 2. Storage Classes (Cost Optimization)
Interviewers love this. Move data to cheaper tiers to save money.
1.  **Standard**: Frequent access. Best for general use.
2.  **Standard-IA (Infrequent Access)**: Cheaper, but retrieval fee applies. Good for backups.
3.  **Glacier**: For long-term archiving. Very cheap, but data retrieval takes hours.

## 3. Features
- **Versioning**: Keep multiple variants of an object. If you overwrite `file.txt`, S3 keeps the old version too (Protects against accidental deletes).
- **Lifecycle Policies**: Automate moving files to Glacier after 30 days.

## 4. Hands-On: Host a Static Website
Did you know you can host a simplified HTML/CSS website on S3 for pennies?

1.  **Create Bucket**: Name it `my-awesome-site-2025`.
2.  **Upload**: Upload an `index.html` file.
3.  **Permissions**:
    - Uncheck "Block all public access".
    - Add a Bucket Policy to allow `GetObject` for everyone.
4.  **Properties**:
    - Scroll to bottom -> **Static website hosting**.
    - Enable it. Type `index.html` as the index document.
5.  **Test**: Click the provided Endpoint URL. Your site is live!
