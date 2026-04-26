# CI/CD Interview Questions

## Beginner
1.  **What is CI/CD?**
    *Continuous Integration and Continuous Delivery/Deployment. Automating the software release process.*

2.  **Why use a pipeline?**
    *To eliminate manual errors, ensure consistency, and speed up delivery.*

3.  **What is a Jenkinsfile?**
    *A text file (Groovy) that contains the definition of a Jenkins Pipeline and is checked into version control.*

## Intermediate
5.  **Difference between Continuous Delivery and Deployment?**
    *Delivery creates a deployable artifact (requires manual trigger to deploy). Deployment automates the release to production entirely.*

6.  **What is a Build Agent / Runner?**
    *A machine or container that executes the steps defined in the pipeline job.*

7.  **How do you handle secrets in pipelines?**
    *Never hardcode them. Use the CI tool's credential management (e.g., Jenkins Credentials, GitLab Variables) and inject them as environment variables.*

8.  **What happens when a build fails?**
    *The pipeline stops, developers are notified (email/Slack), and the team fixes the issue before new changes are accepted.*

## Advanced
9.  **Explain Blue-Green Deployment.**
    *Two identical environments. Blue is live. Deploy to Green. Test Green. Switch traffic to Green. Blue becomes idle.*

10. **Explain Canary Deployment.**
    *Roll out update to a small subset of users (e.g., 5%). Monitor. If good, roll out to the rest.*

11. **How do you secure a CI/CD pipeline?**
    *Least privilege permissions, secure secrets management, scan images for vulnerabilities, code signing, audit logs.*

12. **What are artifacts?**
    *The output of a build process (e.g., JAR file, Docker image, ZIP file) stored and used in subsequent stages.*
