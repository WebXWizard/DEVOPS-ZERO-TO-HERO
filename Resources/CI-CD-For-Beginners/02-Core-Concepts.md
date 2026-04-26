# 02. Core CI/CD Concepts

Before you start writing pipelines, you need to understand the vocabulary. Here are the building blocks of any CI/CD system.

## 1. Code Repository (The Source)
Everything starts here. This is where your code lives (e.g., GitHub, GitLab, Bitbucket).
- **Trigger**: The CI/CD process is usually "triggered" by an event in the repository, like a `git push` or opening a `Pull Request`.

## 2. Pipeline
A **Pipeline** is the top-level component of continuous integration, delivery, and deployment.
- Think of it as a factory assembly line.
- It defines the "Receipt" of what needs to happen to your code from start to finish.

## 3. Stages
Pipelines are often broken down into **Stages**. Ideally, stages run sequentially.
- **Example Stages**:
    1.  `Build` (Compile code)
    2.  `Test` (Run unit tests)
    3.  `Package` (Create a Docker image or jar file)
    4.  `Deploy` (Push to server)

## 4. Jobs
Inside each Stage, you have **Jobs**. Jobs are the actual units of work.
- Jobs in the same stage can often run in parallel (at the same time).
- Example: Inside the `Test` stage, you might have a "Unit Test" job and a "Linting" job running together.

## 5. Steps / Tasks
Inside a Job, you have **Steps**. These are the linear commands executed one after another.
- Example Step 1: `npm install`
- Example Step 2: `npm test`

## 6. Runner / Agent / Builder
Who actually executes these commands? It's not "magic". It's a server (or container) somewhere.
- **Runner**: A machine (virtual or physical) installed with the CI/CD software that listens for jobs and executes them.
- You can use **Hosted Runners** (provided by GitHub/GitLab) or **Self-Hosted Runners** (your own servers).

## 7. Artifacts
An **Artifact** is a file or a collection of files produced by a pipeline run.
- Example: A compiled binary (`app.exe`), a Java JAR file, or a Docker Image.
- Artifacts are passed between stages (e.g., Build stage creates artifact -> Deploy stage takes that artifact and puts it on a server).

## 8. Secrets / Variables
You never want to hardcode passwords in your pipeline file!
- **Secrets** are encrypted variables stored in your CI/CD provider (like API Keys, SSH Keys, Passwords).
- The pipeline injects them securely when it runs.

---

## Visual Hierarchy
```
Pipeline
└── Stage: Build
    └── Job: Compile Code
        ├── Step: Checkout Code
        ├── Step: Install Dependencies
        └── Step: Run Build Command
└── Stage: Test
    └── Job: Run Tests
        └── Step: Execute Test Suite
```
