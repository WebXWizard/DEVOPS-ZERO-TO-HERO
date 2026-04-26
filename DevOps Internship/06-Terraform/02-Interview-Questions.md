# Terraform Interview Questions

## Beginner
1.  **What is Terraform?**
    *Infrastructure as Code tool to build, change, and version infrastructure safely and efficiently.*

2.  **What is `terraform init`?**
    *Initializes the working directory containing Terraform configuration files (downloads plugins/providers).*

3.  **What is the State File?**
    *`terraform.tfstate` stores the state of your managed infrastructure and configuration. It maps real resources to your configuration.*

## Intermediate
4.  **Difference between `terraform plan` and `terraform apply`?**
    *`plan` shows what actions Terraform will take (dry run). `apply` executes those changes.*

5.  **How do you handle sensitive data?**
    *Do not commit `.tfstate` to git (contains plain text secrets). Use remote backends (S3 + DynamoDB) with encryption. Use environment variables/secret managers.*

6.  **What is a generic "Provider" in Terraform?**
    *A plugin that handles the interaction with an API (e.g., AWS, Azure, Google, Kubernetes, Docker provider).*

7.  **What is a Module?**
    *A container for multiple resources that are used together. Used to organize code and make it reusable (like functions).*

## Advanced
8.  **How does Terraform manage state locking?**
    *When using a backend like S3 with DynamoDB, Terraform locks the state file during operations to prevent concurrent modifications (two people applying at once).*

9.  **What is `terraform taint`?**
    *Marks a resource for recreation during the next apply. (Deprecated in v0.15+, use `terraform apply -replace` instead).*

10. **Describe the Terraform Lifecycle.**
    *Init -> Plan -> Apply -> Destroy.*

11. **How to import existing infrastructure into Terraform?**
    *Use `terraform import <resource_name> <id>`. You also need to write the corresponding configuration block manually (or use tools like `terraformer`).*
