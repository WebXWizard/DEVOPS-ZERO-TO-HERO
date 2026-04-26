# Day 9: CI/CD with AWS CodePipeline 🔄🛠️

AWS CodePipeline is a fully managed continuous delivery service that helps you automate your release pipelines for fast and reliable application and infrastructure updates.

## 📦 The AWS Code Suite Components

AWS provides a suite of developer tools that work together to form a complete CI/CD pipeline, often referred to as the "Code Suite".

| Service | Category | Description | Equivalent Tool |
| :--- | :--- | :--- | :--- |
| **CodeCommit** | Source Control | Secure, highly scalable, managed source control service that hosts private Git repositories. | GitHub, GitLab, Bitbucket |
| **CodeBuild** | Build | Compiles source code, runs tests, and produces software packages that are ready to deploy. | Jenkins, Travis CI |
| **CodeDeploy** | Deploy | Automates code deployments to any instance, including EC2 instances and on-premises servers. | Spinnaker, ArgoCD |
| **CodePipeline** | Orchestration | Automates the phases of your release processes; ties the other services together. | Jenkins Pipelines, GitLab CI |

## ⚙️ Integrating the Pipeline

CodePipeline defines the workflow. It grabs the code, passes it to the builder, and takes the output to the deployer.

```mermaid
graph LR
    Dev[Developer] -- "git push" --> Source[Source Stage<br>(CodeCommit/GitHub)]
    Source -- "Source Code<br>(zip)" --> Build[Build Stage<br>(CodeBuild)]
    Build -- "Test & Compile" --> Tests(Unit Tests Pass)
    Tests -- "Artifact<br>(jar/zip/image)" --> Deploy[Deploy Stage<br>(CodeDeploy/ECS)]
    Deploy -- "Push to Web" --> Prod[Production Servers]
```

### Key Terms in CodePipeline

*   **Stages**: Logical divisions of your pipeline (e.g., `Source`, `Build`, `Test`, `Deploy`).
*   **Actions**: Tasks performed within a stage (e.g., `Run JUnit tests`, `Deploy to Beanstalk`).
*   **Artifacts**: Files or data passed between stages. The output of the `Build` stage becomes the input artifact for the `Deploy` stage. These are temporarily stored in Amazon S3.
*   **Transitions**: The links between stages. You can disable transitions to temporarily pause the pipeline.

## 🛠️ Automating and Monitoring the Process

### Triggering the Pipeline
Pipelines are typically triggered automatically based on events:
1. A push to a specific branch in CodeCommit or GitHub.
2. An update to an S3 bucket or ECR image repository.
3. A scheduled time via Amazon EventBridge (e.g., nightly builds).

### Manual Approvals
You can insert a **Manual Approval Action** into your pipeline (e.g., between the `Staging` deploy and the `Production` deploy). The pipeline will pause until someone with IAM permission clicks "Approve" in the console.

### Handling Errors
If an action fails (e.g., CodeBuild tests fail), the entire pipeline stops. CodePipeline integrates tightly with Amazon CloudWatch Events. You can create EventBridge rules to send a notification (via Amazon SNS to email/Slack) if a pipeline execution fails.
