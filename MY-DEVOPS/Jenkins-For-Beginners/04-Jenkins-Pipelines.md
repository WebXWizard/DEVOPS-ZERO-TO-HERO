# 04 Jenkins Pipelines

Pipelines are the heart of modern Jenkins usage. Instead of clicking buttons in the UI (Freestyle), you write the build steps in a file.

## Why Pipelines?
- **Pipeline as Code**: The entire build process is stored in a file called `Jenkinsfile` inside your Git repo.
- **Version Control**: Changes to the build process are tracked just like code changes.
- **Visualization**: Pipelines provide a clear visual stage view of the build.

## Declarative Pipeline Syntax
This is the structured, easy-to-read syntax recommended for beginners. A basic `Jenkinsfile` looks like this:

```groovy
pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building the application...'
                // Command to compile code, e.g., sh 'mvn clean package'
            }
        }
        stage('Test') {
            steps {
                echo 'Running tests...'
                // Command to run tests, e.g., sh 'npm test'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying to server...'
                // Command to deploy
            }
        }
    }
    
    post {
        always {
            echo 'This runs after the build, regardless of success or failure.'
        }
    }
}
```

## Key Components

1.  **pipeline**: The wrapper for the entire script.
2.  **agent**: Defines *where* the build runs.
    - `agent any`: Run on any available executor.
    - `agent { docker { image 'node:16' } }`: Run inside a specific Docker container.
3.  **stages**: Container for all the major phases of work.
4.  **stage**: A specific phase (e.g., "Build", "Test").
5.  **steps**: The actual commands to run.
    - `sh 'command'`: Run a shell command (Linux/Mac).
    - `bat 'command'`: Run a batch command (Windows).
    - `echo 'msg'`: Print a message to the logs.
    - `git`: Checkout code from git.

## Creating Your First Pipeline Job
1.  Go to Dashboard -> **New Item**.
2.  Enter a name (e.g., "My-First-Pipeline") and select **Pipeline**.
3.  Scroll down to the **Pipeline** section.
4.  **Definition**:
    - Choose **Pipeline script** to type it directly (good for testing).
    - Choose **Pipeline script from SCM** to load a `Jenkinsfile` from Git (best practice).

---
*Next Step: [Beginner Projects](./05-Beginner-Projects.md)*
