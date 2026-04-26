# Getting Started with Terraform

## 1. Installation

Terraform is a single binary file, making it very easy to install.

### Windows
1.  Download the binary from the [official website](https://developer.hashicorp.com/terraform/downloads).
2.  Unzip it and place `terraform.exe` in a folder included in your system's `PATH` (e.g., `C:\Windows\System32` or a custom tools folder).
3.  **Verify**: Open cmd/PowerShell and run `terraform -version`.

### Linux (Ubuntu/Debian)
```bash
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```

---

## 2. Key Concept: Providers

Terraform relies on plugins called **Providers** to interact with cloud platforms and other services.

*   **AWS Provider**: To talk to Amazon Web Services.
*   **Azure Provider**: To talk to Microsoft Azure.
*   **Local Provider**: To manage local files (great for learning!).
*   **Docker Provider**: To manage Docker containers.

You define providers in your configuration file (usually `main.tf`).

```hcl
provider "aws" {
  region = "us-east-1"
}
```

## 3. Storage & Authentication

To use cloud providers, you need credentials.

*   **AWS**: Install `aws-cli` and run `aws configure`. Terraform will automatically pick up the credentials from `~/.aws/credentials`.
*   **Best Practice**: Never hardcode secrets (access keys) directly in your `.tf` files!
