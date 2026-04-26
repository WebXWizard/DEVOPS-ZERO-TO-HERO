# 06. Top CI/CD Interview Questions (For Beginners)

Prepare for your interview with these common questions.

## Q1: What is the main difference between Continuous Delivery and Continuous Deployment?
**Answer:** The difference is the final step using **Automation**.
- **Continuous Delivery**: The code is built, tested, and ready to release, but the final push to production requires a *manual approval* (click of a button).
- **Continuous Deployment**: Everything is automated. If tests pass, it goes straight to production without any human intervention.

## Q2: Why is CI/CD important for a DevOps team?
**Answer:** It automates repetitive tasks, reduces human error, speeds up the feedback loop (developers know instantly if they broke something), and allows for faster and more reliable releases.

## Q3: What is a "Build Artifact"?
**Answer:** An artifact is the output of the build process. It can be a compiled binary, a JAR file, a ZIP file, or a Docker Image. It is the "thing" that actually gets deployed.

## Q4: How do you handle a failed pipeline?
**Answer:** 
1.  **Stop**: Do not proceed.
2.  **Notify**: The developer who broke the build is notified (via Slack/Email).
3.  **Fix**: The priority becomes fixing the build. No new features should be merged until the pipeline is green again.

## Q5: What are "Self-Hosted Runners" vs "Cloud Runners"?
**Answer:**
- **Cloud Runners**: Managed by the CI provider (like GitHub). Easy to use, but might be expensive or slower.
- **Self-Hosted Runners**: You install the runner software on your own machines. Faster, more control over security/hardware, but you have to maintain the server.

## Q6: Can you name a few stages in a typical CI/CD pipeline?
**Answer:** 
1.  **Checkout** (Get code)
2.  **Dependencies** (Install libraries)
3.  **Build** (Compile/Dockerize)
4.  **Test** (Unit/Integration tests)
5.  **Scan** (Security checks)
6.  **Deploy** (Push to server)

## Q7: How do you secure credentials (passwords) in a pipeline?
**Answer:** Never hardcode them in the YAML file! Use the CI tool's "Secrets" management feature (e.g., GitHub Secrets, Jenkins Credentials) to store them securely and inject them as environment variables at runtime.
