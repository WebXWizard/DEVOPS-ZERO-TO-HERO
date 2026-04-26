# Beginner Friendly Terraform Projects

## Project 1: Local File "Hello World"
**Goal**: Create a local file with text content using Terraform. No cloud account needed!

1.  Create `main.tf`:
    ```hcl
    resource "local_file" "example" {
      filename = "${path.module}/hello.txt"
      content  = "Hello, Terraform!"
    }
    ```
2.  Run `terraform init`.
3.  Run `terraform plan`.
4.  Run `terraform apply` (type `yes`).
5.  Check your folder for `hello.txt`.
6.  Change the content in the file and run `apply` again to see it update.
7.  Run `terraform destroy` to delete the file.

---

## Project 2: Spin up a Docker Container
**Goal**: Launch an Nginx web server using Docker.

**Prerequisites**: Docker Desktop installed.

1.  Create `main.tf`:
    ```hcl
    terraform {
      required_providers {
        docker = {
          source  = "kreuzwerker/docker"
        }
      }
    }

    provider "docker" {}

    resource "docker_image" "nginx" {
      name         = "nginx:latest"
      keep_locally = false
    }

    resource "docker_container" "nginx" {
      image = docker_image.nginx.image_id
      name  = "tutorial"
      ports {
        internal = 80
        external = 8000
      }
    }
    ```
2.  Run `init`, `plan`, `apply`.
3.  Visit `http://localhost:8000`.

---

## Project 3: Basic AWS EC2 Instance
**Goal**: Provision a free-tier usage EC2 instance.

**Prerequisites**: AWS Account, AWS CLI configured.

1.  Create `main.tf`:
    ```hcl
    provider "aws" {
      region = "us-east-1"
    }

    resource "aws_instance" "my_server" {
      ami           = "ami-0c7217cdde317cfec" # Update this AMI ID for your region/OS!
      instance_type = "t2.micro"

      tags = {
        Name = "Terraform-Beginner-Server"
      }
    }
    ```
2.  Run `init`, `plan`, `apply`.
3.  Check AWS Console to see your server.
4.  **Important**: Run `terraform destroy` when done to avoid costs!
