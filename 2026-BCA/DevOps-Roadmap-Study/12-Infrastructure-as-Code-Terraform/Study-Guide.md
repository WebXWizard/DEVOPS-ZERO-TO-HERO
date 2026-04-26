# Infrastructure as Code (IaC) (Terraform) Study Guide

**Estimated Time**: 3-4 weeks

Infrastructure as Code (IaC) is the practice of managing and provisioning infrastructure through machine-readable configuration files. Terraform is the industry-standard tool for this, known for its cloud-neutral approach and robust state management.

## Essential Concepts

### 1. Terraform (Recommended)
Basic components:
- **Providers**: Plugins that interact with cloud platforms (e.g., `aws`, `azure`, `google`).
- **Resources**: The infrastructure components you want to manage (e.g., `aws_instance`, `aws_s3_bucket`, `google_compute_instance`).
- **Data Sources**: Read information from existing infrastructure (e.g., "Find the latest Ubuntu AMI").

### 2. Writing Terraform Configuration Files
- **HCL (HashiCorp Configuration Language)**: The human-friendly syntax used in Terraform files (`.tf`).
- **Variables**: Inputs that allow you to customize configuration.
- **Outputs**: Values that are displayed after a terraform operation (e.g., an IP address, a DNS name).

### 3. Terraform State Management
- **State File**: A JSON document that tracks the current state of your infrastructure (`terraform.tfstate`).
- **State Commands**: `terraform show`, `terraform state list`, `terraform state rm`.
- **Remote State**: Storing the state file in a central location (e.g., S3 bucket with DynamoDB locking) for team collaboration.

### 4. Terraform Workflow
- `terraform init`: Initialize the workspace and install required providers.
- `terraform plan`: Preview the changes that will be made to your infrastructure.
- `terraform apply`: Execute the changes to bring the infrastructure to the desired state.
- `terraform destroy`: Remove all managed infrastructure.

### 5. Using Terraform Modules
- **Modules**: Reusable units of configuration that encapsulate a set of resources.
- **Custom Modules**: Writing your own modules to standardize infrastructure across your organization.
- **Public Modules**: Using modules from the Terraform Registry.

### 6. Advanced Concepts
- **Workspaces**: Managing multiple environments (e.g., development, staging, production) within a single configuration.
- **Provisioners**: Executing scripts on a local or remote machine after a resource is created (e.g., `local-exec`, `remote-exec`).
- **Terraform Cloud / Enterprise**: Managed services for Terraform infrastructure.

### 7. AWS CloudFormation (Alternative)
- **Stacks**: A collection of AWS resources managed together as a single unit.
- **Templates**: JSON/YAML files defining the desired state of your infrastructure.
- **CloudFormation Designer**: A visual tool for creating and editing templates.

---
**Practical Challenge**: Use Terraform to launch an EC2 instance in a specific VPC and subnet. Output the public IP address of the instance after it's created.
