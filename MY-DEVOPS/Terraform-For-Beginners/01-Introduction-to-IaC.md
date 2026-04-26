# Introduction to Infrastructure as Code (IaC)

## What is Infrastructure as Code?

Infrastructure as Code (IaC) is the practice of provisioning and managing computing infrastructure (servers, networks, load balancers, etc.) through machine-readable definition files, rather than through physical hardware configuration or interactive configuration tools (like clicking around in the AWS Console).

### Declarative vs Imperative
There are two main approaches to IaC:

1.  **Imperative (How)**: You specify the exact steps to achieve a goal.
    *   *Example*: "Spin up a server. Then install Nginx. Then start the service."
    *   *Tools*: Bash scripts, Ansible (can be both).

2.  **Declarative (What)**: You specify the desired end state, and the tool figures out how to achieve it.
    *   *Example*: "I want one server with Nginx running."
    *   *Tools*: **Terraform**, Kubernetes.

---

## Why Terraform?

Terraform by HashiCorp is the most popular open-source IaC tool.

### Key Benefits:
1.  **Cloud Agnostic**: Terraform works with AWS, Azure, Google Cloud, and hundreds of other providers. You can use a specific provider for each, but the workflow (`init`, `plan`, `apply`) remains the same.
2.  **State Management**: Terraform keeps track of your infrastructure's state in a file (`terraform.tfstate`). This allows it to know what it created previously and what needs to be changed or deleted.
3.  **Immutable Infrastructure**: Terraform tends to favor replacing infrastructure rather than modifying it in place. If you need a change, you often destroy the old server and spin up a new one with the new config. This reduces "configuration drift".
