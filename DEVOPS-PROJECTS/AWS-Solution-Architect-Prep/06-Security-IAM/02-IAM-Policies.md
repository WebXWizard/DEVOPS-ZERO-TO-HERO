# IAM Policies

## 1. JSON Structure
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:ListBucket",
      "Resource": "arn:aws:s3:::my-bucket"
    }
  ]
}
```
- **Effect:** Allow or Deny.
- **Action:** API call (e.g., `s3:GetObject`).
- **Resource:** The specific object (ARN).
- **Condition:** "Only if request comes from IP 1.2.3.4".

## 2. Evaluation Logic
1. Start with **Implicit Deny**.
2. If there is an **Explicit Deny** anywhere? -> BLOCKED.
3. If there is an **Explicit Allow**? -> ALLOWED.
4. Else -> BLOCKED.

## 3. Managed vs Inline
- **AWS Managed:** Created and maintained by AWS (e.g., `AdministratorAccess`). Status: Updates automatically.
- **Customer Managed:** Created by you. Reusable across users.
- **Inline:** Embedded directly into a single user/role. (Hard to manage. One-to-one).
