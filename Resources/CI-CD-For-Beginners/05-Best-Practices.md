# 05. CI/CD Best Practices

To really master CI/CD, you shouldn't just know how to write a file. You need to know the *philosophy* behind it.

## 1. Commit Early, Commit Often
- Don't wait 2 weeks to push your code.
- Smaller changes are easier to test and easier to fix if they break something.
- **Rule**: If it hurts, do it more often.

## 2. Fail Fast
- The pipeline should give you feedback as soon as possible.
- Run the fastest tests (Unit Tests) first.
- Don't run a 2-hour integration test if the code has a syntax error. Catch it in the first 30 seconds.

## 3. Build Once, Deploy Anywhere (Immutable Artifacts)
- **Bad Practice**: Compile the code in Dev, then compile it *again* in Prod. (What if the compiler version changed?)
- **Good Practice**: Compile the code *once* into an Artifact (e.g., a Docker Image). Deploy that *exact same image* to Dev, Staging, and Prop.

## 4. Environment Parity
- Keep your Development, Testing, and Production environments as similar as possible.
- If Prod uses Linux, don't test on Windows.
- Use **Docker** to ensure the environment is identical everywhere.

## 5. Security Scanning (DevSecOps)
- Integrate security checks into your pipeline.
- **SAST** (Static Application Security Testing): Scans code for vulnerabilities before it runs.
- **Dependency Scanning**: Checks if your libraries (npm packages) have known security holes.

## 6. Infrastructure as Code (IaC)
- Don't manually log in to servers to change settings.
- Define your infrastructure (servers, databases, networks) in code (using Terraform or CloudFormation) and deploy it via the pipeline.
