# Day 7: Infrastructure as Code with CloudFormation 📜🏗️

AWS CloudFormation is a service that helps you model and set up your AWS resources so that you can spend less time managing those resources and more time focusing on your applications.

## 🏗️ What is Infrastructure as Code (IaC)?

IaC replaces manual clicking in the AWS Console with writing declarative configuration files. 
- **Version Control**: Infrastructure files can be stored in Git.
- **Repeatability**: You can deploy the exact same architecture to 10 different regions in minutes.
- **Auditability**: You can easily review exactly what is provisioned.

## 📜 CloudFormation Concepts: Templates & Stacks

```mermaid
graph LR
    Dev[Developer] --> |Writes| Template[Template<br>(JSON or YAML file)]
    Template --> |Uploads to| CFN[AWS CloudFormation Service]
    CFN --> |Provisions| Stack[Stack<br>(Collection of Resources)]
    Stack --> EC2
    Stack --> S3
    Stack --> VPC
```

| Term | Definition |
| :--- | :--- |
| **Template** | The Blueprint. A JSON or YAML formatted text file that describes your desired resources. |
| **Stack** | The actual running resources. CloudFormation creates the stack based on your template. |
| **Change Set** | A preview of how proposed changes to a template will impact your running stack. |

## ✍️ Structure of a CloudFormation Template

A template has several sections, though only `Resources` is strictly mandatory.

| Section | Purpose | Example |
| :--- | :--- | :--- |
| **Parameters** | Values to pass into your template at runtime. | Ask the user for the `InstanceType` (e.g., t2.micro vs m5.large). |
| **Mappings** | Lookup tables. | Map a "Region" to a specific "AMI ID". |
| **Resources** | **(Required)** The AWS components to create. | `AWS::EC2::Instance`, `AWS::S3::Bucket`. |
| **Outputs** | Values that are returned whenever you view your stack's properties. | The public IP of your new EC2 instance. |

### Basic YAML Example (Creating an S3 Bucket)

```yaml
AWSTemplateFormatVersion: '2010-09-09'
Description: A simple template to create an S3 bucket.

Parameters:
  BucketNamePrefix:
    Type: String
    Description: Prefix for the bucket name.

Resources:
  MyS3Bucket:
    Type: AWS::S3::Bucket
    Properties:
      BucketName: !Sub "${BucketNamePrefix}-my-unique-suffix-123"

Outputs:
  BucketDomainName:
    Value: !GetAtt MyS3Bucket.DomainName
    Description: The domain name of the newly created bucket.
```

## 🔄 Version Control and Updating

1. **Store in Git**: Manage your `.yaml` files just like application code.
2. **Update Process**: When you need to change your infrastructure, don't use the console. Update the `.yaml` file.
3. **Apply via CFN**: Submit the updated file to CloudFormation. It will calculate the difference and apply *only* the changes required (Update Stack).

## ❌ Handling Errors and Troubleshooting

- **Rollbacks**: By default, if CloudFormation encounters an error while creating a stack (e.g., you asked for an instance type that isn't available), it will **rollback**—deleting everything it successfully created during that run to ensure your environment isn't left in a half-built state.
- **Troubleshooting**: Check the `Events` tab in the CloudFormation console to see the exact API errors that caused the failure.
