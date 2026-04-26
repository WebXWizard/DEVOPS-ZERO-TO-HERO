# Terraform Basics

## 1. HCL Syntax (HashiCorp Configuration Language)
Terraform uses HCL, which is declarative and block-based.

**Structure**:
```hcl
<block_type> "<resource_type>" "<resource_name>" {
  argument = value
}
```

**Example**:
```hcl
resource "aws_instance" "web" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"
}
```
*   `resource`: The block type.
*   `aws_instance`: The resource provider type (from the AWS provider).
*   `web`: The internal name Terraform uses (not the AWS dashboard name).

---

## 2. Core Commands (The Workflow)
The standard Terraform workflow consists of four main commands:

1.  `terraform init`: Initializes the directory. Downloads the provider plugins (e.g., AWS, Azure). **Must be run first.**
2.  `terraform plan`: Creates an execution plan. It looks at your local config, compares it to the real world (using the state file), and tells you what it *will* do (create, destroy, modify). **Always run this before applying.**
3.  `terraform apply`: Executes the changes. It effectively makes your infrastructure match your configuration.
4.  `terraform destroy`: Removes all infrastructure managed by this configuration.

---

## 3. The State File (`terraform.tfstate`)
When you run `apply`, Terraform creates a file called `terraform.tfstate`.

*   **Purpose**: Maps your logical configuration (e.g., resource "web") to the real world ID (e.g., AWS Instance i-01234abc).
*   **Important**: specific details about your infra are stored here.
*   **Rule**: Never edit this file manually!

---

## 4. Input Variables
Avoid hardcoding values by using variables.

**`variables.tf`**:
```hcl
variable "instance_type" {
  description = "The type of instance to start"
  default     = "t2.micro"
}
```

**`main.tf`**:
```hcl
resource "aws_instance" "web" {
  ami           = "ami-12345678"
  instance_type = var.instance_type
}
```
