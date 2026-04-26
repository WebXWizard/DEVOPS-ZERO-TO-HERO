# Advanced CloudFormation

## 1. Intrinsic Functions
Built-in functions to assign values dynamically.
- `!Ref`: Returns the value of a parameter or the ID of a resource.
  - `VpcId: !Ref MyVPC`
- `!GetAtt`: Returns a specific attribute of a resource.
  - `!GetAtt MyELB.DNSName`
- `!Sub`: Substitute variables in a string.
  - `UserData: !Sub "yum install -y httpd"`
- `!ImportValue`: Export outputs from one stack and import them into another.

## 2. Nested Stacks
- Stacks created as part of other stacks.
- **Use Case:** Reusing common patterns (e.g., standard VPC configuration, standard Load Balancer setup).
- Helps bypass the 500-resource limit per stack.

## 3. StackSets
- Deploy stacks across **Multiple Accounts** and **Multiple Regions** with a single operation.
- Managed by Administrator account.

## 4. Helper Scripts (cfn-init)
- Used on EC2 instances to download metadata, install packages, and start services defined in the template.
- `cfn-signal`: Signals back to CloudFormation that the setup is complete.
