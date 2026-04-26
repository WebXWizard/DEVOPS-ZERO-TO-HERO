# IAM (Identity and Access Management) Mastery

**"Security is job zero."**
IAM is the gatekeeper of AWS. It controls *who* can access *what*.

## 1. Core Concepts

### A. Users (The "Who")
- Represents a person or service.
- **Root User**: The email you signed up with. Has unlimited power. **NEVER USE THIS FOR DAILY WORK.**
- **IAM User**: A user you create for day-to-day access.

### B. Groups
- A collection of users.
- Best Practice: Assign permissions to *Groups*, not Users.
- Example: `DevOps-Group` (Admin access), `Interns-Group` (Read-Only).

### C. Policies (The "Rules")
- JSON documents that define permissions.
- **Effect**: `Allow` or `Deny`.
- **Action**: What can they do? (e.g., `s3:ListBucket`).
- **Resource**: On what? (e.g., `arn:aws:s3:::my-bucket`).

### D. Roles (The "Helmet")
- An identity with permission policies that **does not** have a password or keys.
- It is *assumed* by anyone who needs it temporarily.
- **Use Case**: An EC2 instance needs to save files to S3. You give the EC2 instance a *Role*, not a password.

## 2. Hands-on: Secure Your Account

1.  **Create an Admin User**:
    - Go to IAM Dashboard -> Users -> Create User.
    - Name: `Admin-User`.
    - Attach Policy: `AdministratorAccess` (Only for you!).
    - Create access keys or console password.

2.  **Enable MFA (Multi-Factor Authentication)**:
    - **Crucial Step**: Activate MFA for your Root User and Admin User instantly.
    - Use Google Authenticator or Authy app.

3.  **Create a Password Policy**:
    - Go to Account Settings in IAM.
    - Require: Minimum 12 chars, Numbers, Symbols.

## 3. Interview Question: IAM Role vs User?
- **User**: Has permanent long-term credentials (password/keys). Represents a person.
- **Role**: Has temporary short-term credentials. Represents a "hat" you put on. Used by machines (EC2/Lambda) or for Cross-Account access.
