# AWS CloudFormation (IaC) - Interview Prep

## 1. Infrastructure as Code (IaC)
Defining your infrastructure (servers, databases, networks) in a text file (JSON or YAML).
**Benefits:** Version control, Reproducibility, Automation.

## 2. CloudFormation Concepts

### Template
The actual code file.
- **Sections:**
  - `Parameters`: Inputs (e.g., InstanceType).
  - `Resources`: **(Required)** The actual AWS resources to build (e.g., `Type: AWS::EC2::Instance`).
  - `Outputs`: Values returned after creation (e.g., Public IP of the Load Balancer).
  - `Mappings`: Conditional variables (e.g., if Region=us-east-1, use AMI-123).

### Stack
The instantiation of the template. You upload a template -> AWS creates a "Stack".
- **Nested Stacks:** Using a CloudFormation stack inside another stack (Reusability).

### Change Sets
A preview of changes before they happen. Always run a Change Set before updating a Production Stack!

### Drift Detection
Checks if the *actual* configuration of resources differs from the *template*.
- *Scenario:* Someone manually changed a Security Group rule in the console. Drift Detection alerts you so you can fix the template or the resource.

## 3. Comparison with Terraform
*Interviewers often ask this.*
- **CloudFormation:** AWS native. State is managed by AWS. Free.
- **Terraform:** Multi-cloud (AWS, Azure, Google). State is managed by user (state file). Open source (HashiCorp).

## 4. AWS CDK (Cloud Development Kit)
Writing CloudFormation using real languages (Python, TypeScript, Java) instead of YAML.
- **Synth:** CDK compiles your Python code -> CloudFormation Template -> Deployment.
