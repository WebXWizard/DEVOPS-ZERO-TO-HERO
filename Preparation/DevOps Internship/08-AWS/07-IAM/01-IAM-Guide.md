# AWS IAM (Identity and Access Management)

## What is IAM?
A service that helps you securely control access to AWS resources. You use IAM to determine who is authenticated (signed in) and authorized (has permissions) to use resources.

## Core Components
1.  **Users**: Represents a person or service (has login/password or access keys).
2.  **Groups**: Collection of users (e.g., "Developers"). Permissions attached to a group apply to all users in it.
3.  **Roles**: An identity that you can assume to gain temporary access to permissions. Not associated with a specific person. Used by EC2 instances, Lambda functions, or cross-account access.
4.  **Policies**: JSON document that defines permissions.

## Policy Structure (JSON)
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:ListBucket",
      "Resource": "arn:aws:s3:::my_bucket"
    }
  ]
}
```

## Security Best Practices
1.  **Least Privilege**: Grant only permissions necessary to perform a task.
2.  **MFA**: Enable Multi-Factor Authentication for Root and privileged users.
3.  **No Root Access**: Don't use root account for daily tasks.
4.  **Rotate Keys**: Regularly rotate access keys.

## Interview Questions
1.  **IAM Role vs IAM User?**
    *   **User**: Long-term credentials (password/keys). For humans or external apps.
    *   **Role**: Temporary credentials. For AWS services (EC2 accessing S3) or federated users.

2.  **What is an Inline Policy vs Managed Policy?**
    *   **Managed**: Standalone policy that can be attached to multiple users/groups/roles. (Re-usable).
    *   **Inline**: Embedded directly into a single user/group/role. (Not re-usable). Managed is preferred.

3.  **How do you give an EC2 instance access to S3?**
    *   Create an **IAM Role** with S3 permissions. Attach the Role to the EC2 instance. (Never store Access Keys on the EC2 instance!).
