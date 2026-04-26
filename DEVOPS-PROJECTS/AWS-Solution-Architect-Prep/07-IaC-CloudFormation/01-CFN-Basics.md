# CloudFormation Basics

## 1. Infrastructure as Code (IaC)
Provision and manage AWS resources by writing template files.

## 2. Template Anatomy (YAML)
- **AWSTemplateFormatVersion:** 2010-09-09
- **Description:** "This creates a web server"
- **Parameters:** Inputs. (e.g., `InstanceType`, `KeyName`).
- **Mappings:** Static variables. (e.g., Map Region to AMI ID).
- **Resources:** (MANDATORY). The AWS resources.
  ```yaml
  Resources:
    MyEC2Instance:
      Type: AWS::EC2::Instance
      Properties:
        ImageId: ami-12345678
        InstanceType: t2.micro
  ```
- **Outputs:** Return values. (e.g., `InstanceID`, `PublicIP`).

## 3. Stacks
- A "Stack" is the deployment of a template.
- You update the stack by uploading a modified template.

## 4. Drift Detection
- Detects if someone manually changed a resource outside of CloudFormation.
- Essential for maintaining state integrity.
