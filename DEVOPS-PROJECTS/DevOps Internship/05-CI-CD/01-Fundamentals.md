# CI/CD Fundamentals

## What is CI/CD?
CI/CD is a method to frequently deliver apps to customers by introducing automation into the stages of app development.

### 1. Continuous Integration (CI)
Developers frequently merge code changes into a central repository where automated builds and testsrun.
-   **Goal**: Find and fix bugs quicker, improve software quality.
-   **Process**: Code Commit -> Build -> Test -> Reporting.

### 2. Continuous Delivery (CD)
Automates the release of valid code to a repository. The goal is to have a codebase that is always ready for deployment.
-   **Goal**: Ensure code can be deployed at any time.
-   **Manual Step**: Deployment to production usually requires manual approval.

### 3. Continuous Deployment (CD)
Every change that passes all stages of your production pipeline is released to your customers automatically.
-   **Goal**: No human intervention in deployment.
-   **Requirements**: Extensive automated testing.

## The Pipeline
A series of automated steps to deliver software.
1.  **Source Stage**: Triggered by commit/push to Git.
2.  **Build Stage**: Compile code, build Docker image.
3.  **Test Stage**: Run unit tests, integration tests.
4.  **Deploy Stage**: Deploy to Staging/Production environments.

## Benefits
-   **Smaller Changes**: Less risk, easier to debug.
-   **Faster Release Cycles**: Features reach users faster.
-   **Reliability**: Automated tests catch regressions.
-   **Reduced Costs**: Less manual work.
