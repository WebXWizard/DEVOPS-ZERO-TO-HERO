# IAM Principals

## 1. Users
- **Root User:** Created when you open the account. Has ALL permissions. CANNOT be restricted. *Secure this immediately.*
- **IAM User:** Represents a person or service.
  - *Console Password:* For web access.
  - *Access Keys:* For CLI/API access.

## 2. Roles
- An identity with permission policies that does not have credentials (password/keys).
- Instead, it has **Temporary Security Credentials** (Tokens).
- **Use Cases:**
  - *EC2 Instance Profile:* Server needs to talk to S3.
  - *Cross-Account Access:* User in Account A needs to access Account B.
  - *Federation:* User logs in via Active Directory or Google.

## 3. Groups
- A collection of users.
- **Best Practice:** Attach policies to Groups, not Users. (e.g., "Admins", "Devs", "Auditors").
