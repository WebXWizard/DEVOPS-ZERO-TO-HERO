# Module 11 | Azure DevOps Suite

Azure DevOps is a cloud-based platform for organizing and managing software development projects. It's a collection of services that cover the entire software development lifecycle.

## 📁 Azure DevOps Services Mapping

| Azure DevOps Service | Traditional / Third-Party Tool | Description |
| :--- | :--- | :--- |
| **Azure Repos** | GitHub / GitLab | Source Code Management (Git). |
| **Azure Pipelines** | Jenkins / GitHub Actions | CI/CD automation and orchestration. |
| **Azure Artifacts** | Nexus / Artifactory | Store and share packages (npm, NuGet, etc.). |
| **Azure Boards** | Jira / Trello | Planning and tracking work items. |
| **Azure Test Plans** | TestLink / Selenium | Exploratory and regression testing. |

## 🚀 Azure CI/CD Pipeline Flow

```mermaid
graph LR
    SCM[Azure Repos] -- Trigger: Code Push --> Build[Build Pipeline: CI]
    Build -- Artifact --> Storage[Azure Artifacts]
    Storage -- Trigger --> Release[Release Pipeline: CD]
    Release -- Deploy --> App[Azure Webapp / AKS]
```

## 📜 Azure YAML Pipeline (Example)

```yaml
trigger:
- main

pool:
  vmImage: 'ubuntu-latest'

steps:
- task: Maven@3
  inputs:
    mavenPomFile: 'pom.xml'
    goals: 'package'

- task: CopyFiles@2
  inputs:
    SourceFolder: '$(system.defaultworkingdirectory)'
    Contents: '**/target/*.jar'
    TargetFolder: '$(build.artifactstagingdirectory)'

- task: PublishBuildArtifacts@1
  inputs:
    PathtoPublish: '$(build.artifactstagingdirectory)'
    ArtifactName: 'drop'
```

## 🛡️ Service Principal in Azure DevOps

A **Service Principal** is an application identity within Azure Active Directory that allows Azure DevOps to securely communicate with Azure resources.

| Feature | Importance |
| :--- | :--- |
| **No Passwords** | Uses certificates or secrets for authentication. |
| **RBAC** | Assign specific permissions (e.g., Contributor) to the SP. |
| **Isolation** | Only authorized apps can access specified subscriptions. |

---
**Preparation Tip**: Be ready to explain the difference between **Classic** and **YAML** pipelines.
- **Classic**: Graphical, easy to setup but not versionable.
- **YAML**: Code-based, versioned in Git, and supports complex logic.
