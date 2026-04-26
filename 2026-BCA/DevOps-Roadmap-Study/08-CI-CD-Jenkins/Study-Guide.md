# CI/CD (Jenkins) Study Guide

**Estimated Time**: 3-4 weeks

Continuous Integration and Continuous Deployment (CI/CD) is the heart of DevOps. It automates the building, testing, and deployment of applications, ensuring faster delivery and higher quality.

## Essential Concepts

### 1. CI/CD Concepts and Principles
- **Continuous Integration (CI)**: Frequently merging code into a central repository and verifying it with automated builds and tests.
- **Continuous Delivery (CD)**: Automatically preparing code for release to a production environment.
- **Continuous Deployment (CD)**: Automatically deploying every change that passes all tests to production.

### 2. Jenkins Installation and Setup
Installing Jenkins on various platforms, managing plugins, and configuring global tool settings (JDK, Git, Docker, etc.). 

### 3. Creating and Configuring Jenkins Pipelines
- **Freestyle Projects**: Simple, GUI-based configuration.
- **Pipeline Projects**: Code-based configuration (Pipeline as Code).
- **Multibranch Pipelines**: Automatically detects and builds multiple branches in a repository.

### 4. Jenkinsfile Basics
Defining your pipeline in code:
- **Declarative vs Scripted Syntax**.
- **Stages**: Logical divisions of the pipeline (e.g., `Build`, `Test`, `Deploy`).
- **Steps**: Specific tasks within a stage (e.g., `sh 'make'`, `git checkout`).
- **Agents**: Specifying where the pipeline or a stage should run (e.g., `label 'linux'`, `docker { image 'maven:3.8.1' }`).

### 5. Automated Testing
Integrating tests into the pipeline:
- Unit tests, integration tests, and end-to-end tests.
- Publishing test results and code coverage reports (e.g., JUnit, Cobertura).

### 6. Build and Deployment Automation
- Triggering builds on code commits (Webhooks).
- Managing build artifacts and dependencies.
- Deploying to various environments (Staging, Production) using scripts or specialized plugins.

### 7. Monitoring and Reporting
- Build status notifications (email, Slack).
- Analyzing build history and performance.
- Managing users and permissions (RBAC).

---
**Practical Challenge**: Set up a simple Jenkins pipeline that clones a Git repository, runs a "Hello World" script, and prints the build status. Bonus: Trigger the pipeline automatically using a GitHub webhook.
