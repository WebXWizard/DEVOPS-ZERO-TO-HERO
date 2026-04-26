# 05 Beginner Projects

Here are three projects to take you from a complete beginner to running your first CI pipeline.

## Project 1: "Hello World" (Freestyle Job)
**Goal**: Create a job that simply prints "Hello World" to the console.

1.  **Create Job**:
    - Click **New Item**.
    - Name: `Hello-World-Job`.
    - Select **Freestyle project**.
    - Click **OK**.
2.  **Configure**:
    - Scroll down to **Build Steps**.
    - Click **Add build step** -> **Execute shell** (Linux/Mac) or **Execute Windows batch command** (Windows).
    - Command: `echo "Hello World"`
    - Click **Save**.
3.  **Run**:
    - Click **Build Now** on the left menu.
4.  **Verify**:
    - Look at **Build History** (bottom left). Click the blue ball (or `#1`).
    - Click **Console Output**.
    - You should see: `Hello World` and `SUCCESS`.

---

## Project 2: First Pipeline Job
**Goal**: Convert the "Hello World" job into a modern Pipeline script.

1.  **Create Job**:
    - Click **New Item**.
    - Name: `First-Pipeline`.
    - Select **Pipeline**.
    - Click **OK**.
2.  **Configure**:
    - Scroll to **Pipeline** section.
    - Script:
      ```groovy
      pipeline {
          agent any
          stages {
              stage('Hello') {
                  steps {
                      echo 'Hello World from a Pipeline!'
                  }
              }
          }
      }
      ```
    - Click **Save**.
3.  **Run**:
    - Click **Build Now**.
4.  **Verify**:
    - You will see the "Stage View" appear on the dashboard showing the "Hello" stage as green.

---

## Project 3: Simple CI Build (GitHub Integration)
**Goal**: Pull code from a public Git repository and "build" it.

*Note: You need Git installed on the machine running Jenkins.*

1.  **Create Job**:
    - Name: `Simple-CI-Build`.
    - Select **Pipeline**.
2.  **Configure**:
    - **Description**: "My first real CI pipeline".
    - **Pipeline Script**:
      ```groovy
      pipeline {
          agent any
          
          stages {
              stage('Checkout') {
                  steps {
                      // Pulls code from a sample public repo
                      git 'https://github.com/jenkins-docs/simple-java-maven-app.git'
                  }
              }
              
              stage('Build') {
                  steps {
                      // Simulating a build process
                      echo 'Building the application...'
                      // If you had Maven installed, you would run:
                      // sh 'mvn -B -DskipTests clean package' 
                  }
              }
              
              stage('Test') {
                  steps {
                      echo 'Running Unit Tests...'
                  }
              }
          }
      }
      ```
3.  **Run**:
    - Click **Build Now**.
    - Jenkins will clone the repo and run the echo commands.
4.  **Success**:
    - You have just simulated a Continuous Integration flow!

---
## What's Next?
Now that you know the basics, try:
- Connecting Jenkins to your *own* GitHub repository.
- Setting up a "Build Trigger" to run automatically when you push code (requires Webhooks).
- Installing "Blue Ocean" plugin for a beautiful UI experience.
