# Terraform Fundamentals (Infrastructure as Code)

## What is Terraform?
An open-source IaC tool by HashiCorp that allows you to define cloud and on-premise resources in human-readable configuration files.

## Key Concepts

### 1. Infrastructure as Code (IaC)
Managing infrastructure (VMs, networks, load balancers) using code files rather than manual clicking in a console.
-   **Declarative**: You define *what* you want (e.g., "I need 2 servers"), not *how* to do it.

### 2. Provider
A plugin that allows Terraform to interact with cloud platforms (AWS, Azure, GCP).

### 3. Resource
The building block. Defines a specific infrastructure object (e.g., `aws_instance`).

### 4. State File (`terraform.tfstate`)
A file that keeps track of the resources Terraform has created. It maps your code to real-world resources. **Crucial** file.

### 5. HCL (HashiCorp Configuration Language)
The syntax used by Terraform.

## Basic Workflow
1.  **`terraform init`**: Initialize the directory, download providers.
2.  **`terraform plan`**: Preview changes (Dry run).
3.  **`terraform apply`**: Create/Update the resources.
4.  **`terraform destroy`**: Delete all resources.

## Example: Create AWS EC2
```hcl
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  tags = {
    Name = "MyServer"
  }
}
```

## Benefits
-   **Version Control**: Track infrastructure history.
-   **Reproducibility**: Create identical environments (Dev, Test, Prod).
-   **Automation**: No manual errors.
