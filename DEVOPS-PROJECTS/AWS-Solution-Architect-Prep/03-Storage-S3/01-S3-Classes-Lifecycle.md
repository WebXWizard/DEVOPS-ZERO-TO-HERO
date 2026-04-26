# S3 Storage Classes & Lifecycle

## 1. Storage Classes
 Choosing the right class is the #1 way to optimize storage costs.

| Class | Availability | Durability | Access Pattern | Use Case |
| :--- | :--- | :--- | :--- | :--- |
| **S3 Standard** | 99.99% | 11 9s | High | Frequent access, Cloud Native apps, Mobile gaming. |
| **S3 Standard-IA** | 99.9% | 11 9s | Infrequent | Backups, Disaster Recovery. Retrieval fee applies. |
| **S3 One Zone-IA** | 99.5% | 11 9s | Infrequent | Re-creatable data. If AZ fails, data is lost. 20% cheaper than Standard-IA. |
| **S3 Intelligent Tiering** | 99.9% | 11 9s | Changing | Unknown/Changing patterns. Auto-moves data. No retrieval fees. |
| **S3 Glacier Instant Retrieval** | 99.9% | 11 9s | Rare | Archives needing ms access (Medical images). |
| **S3 Glacier Flexible Retrieval** | 99.99% | 11 9s | Rare | 1 min - 12 hours retrieval. Bulk data. |
| **S3 Glacier Deep Archive** | 99.99% | 11 9s | Rare | 12 hours - 48 hours. Cheapest. Compliance archives (Tax records). |

## 2. Lifecycle Policies
Automate the movement of data to save money.
- **Example Rule:**
  1. Days 0-30: Standard.
  2. Days 31-90: Standard-IA.
  3. Days 91+: Glacier Deep Archive.
  4. Days 365: Expire (Delete).

## 3. S3 Object Lock & Versioning
- **Versioning:** Keeps all variants of an object. Required for Replication. Protects against intended overwrites/deletes.
- **Object Lock (WORM):** Write Once Read Many. Regulatory compliance. Even root cannot delete the file until retention period expires.
