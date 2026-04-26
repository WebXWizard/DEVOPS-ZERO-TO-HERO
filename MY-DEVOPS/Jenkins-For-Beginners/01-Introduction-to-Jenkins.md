# 01 Introduction to Jenkins

## What is Jenkins?
Jenkins is an open-source automation server that enables developers around the world to reliably build, test, and deploy their software. It is the most popular tool for **Continuous Integration (CI)** and **Continuous Delivery (CD)**.

Think of Jenkins as the "Butler" of your software development life cycle. It handles the repetitive tasks so you can focus on coding.

## Key Concepts

### 1. Continuous Integration (CI)
CI is a practice where developers regularly merge their code changes into a central repository.
- **Goal**: Detect errors quickly.
- **Jenkins Role**: Automatically triggers a build and runs tests whenever code is pushed to Git.

### 2. Continuous Delivery (CD)
CD expands on CI by automatically deploying all code changes to a testing or production environment after the build stage.
- **Goal**: Release software faster and more often.

### 3. Jenkins Architecture
Jenkins follows a **Master-Slave (Controller-Agent)** architecture to manage distributed builds.

- **Jenkins Master (Controller)**:
  - The "Brain" of the operation.
  - Schedules jobs.
  - Monitors slaves.
  - Dispatches builds to slaves.
  - Records and presents build results.

- **Jenkins Slave (Agent)**:
  - The "Muscle".
  - A Java executable running on a remote machine (Windows, Linux, Docker, etc.).
  - Executes the build steps dispatched by the Master.

## Why Use Jenkins?
- **Open Source**: Free to use with a massive community.
- **Plugins**: Over 1800+ plugins to integrate with almost any tool (Git, Docker, Maven, AWS, etc.).
- **Distributed Builds**: distribute build loads across multiple machines.
- **Easy Installation**: Cross-platform support (Windows, Mac, Linux).

---
*Next Step: [Getting Started with Jenkins](./02-Getting-Started-with-Jenkins.md)*
