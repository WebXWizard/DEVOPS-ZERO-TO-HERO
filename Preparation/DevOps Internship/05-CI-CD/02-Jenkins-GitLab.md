# Jenkins vs GitLab CI

## Jenkins
-   **Type**: Open-source automation server (Java).
-   **Pros**: Hugh plugin ecosystem, highly customizable, free.
-   **Cons**: Steep learning curve, old UI, requires maintenance.
-   **Configuration**: `Jenkinsfile` (Groovy syntax).

### Jenkins Pipeline Example
```groovy
pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'echo "Building..."'
                sh 'npm install'
            }
        }
        stage('Test') {
            steps {
                sh 'npm test'
            }
        }
        stage('Deploy') {
            steps {
                sh 'echo "Deploying..."'
            }
        }
    }
}
```

## GitLab CI/CD
-   **Type**: Built-in into GitLab.
-   **Pros**: Integrated with repo, modern, easy YAML syntax, runners.
-   **Cons**: Tightly coupled with GitLab.
-   **Configuration**: `.gitlab-ci.yml` (YAML syntax).

### GitLab CI Example
```yaml
stages:
  - build
  - test
  - deploy

build_job:
  stage: build
  script:
    - echo "Building..."
    - npm install

test_job:
  stage: test
  script:
    - npm test

deploy_job:
  stage: deploy
  script:
    - echo "Deploying..."
  only:
    - main
```

## Comparison
| Feature | Jenkins | GitLab CI |
| :--- | :--- | :--- |
| **Setup** | Self-hosted (complex) | SaaS or Self-hosted (easy) |
| **Config** | Groovy | YAML |
| **Plugins** | Massive library | Built-in features |
| **Docker** | Via plugins | Native support |
