# Version Control (Git) Study Guide

**Estimated Time**: 1-2 weeks

Git is the most powerful and widely used version control system (VCS) today. It's essential for collaboration, tracking history, and managing code deployments in a DevOps pipeline.

## Essential Concepts

### 1. Git Basics and Commands
The fundamental building blocks:
- `git init`: Initialize a new local Git repository.
- `git clone`: Copy an existing repository from a remote source.
- `git status`: Show the working tree status.
- `git add <file>`: Stage changes for the next commit.
- `git commit -m "messsage"`: Save the staged changes to the local repository.
- `git log`: See the history of commits.
- `git push`: Send local changes to a remote repository.
- `git pull`: Fetch and merge changes from a remote repository.

### 2. Branching and Merging
Managing multiple paths of development:
- `git branch`: List, create, or delete branches.
- `git checkout <branch>`: Switch between branches.
- `git merge <branch>`: Combine the changes from one branch into another.
- **Fast-forward vs Recursive Merge**: Understanding different merge strategies.

### 3. Working with Remote Repositories
Collaboration platforms:
- **GitHub**, **GitLab**, **Bitbucket**: Hosting services for Git repositories.
- `git remote add <name> <url>`: Connect your local repo to a remote server.
- `git fetch`: Pull metadata but not the actual data (safe).

### 4. Pull Requests and Code Reviews
Reviewing changes before they're merged:
- **Pull Request (PR)**: Requesting to merge your changes into a main branch.
- **Merge Conflict**: When two branches have different changes on the same line of a file.

### 5. Git Workflows
Best practices for using Git in a team:
- **Git Flow**: Traditional branching model with `develop`, `feature`, `release`, and `hotfix` branches.
- **GitHub Flow**: Simplified model focusing on `main` and feature branches.

### 6. Resolving Merge Conflicts
Handling disputes in code:
- Identify the conflicting lines (marked with `<<<<<<<`, `=======`, `>>>>>>>`).
- Manually edit the file to choose the correct version.
- `git add` and `git commit` to finalize the resolution.

---
**Practical Challenge**: Initialize a Git repository on your local machine, create a branch, make a change, commit it, then merge it back into the main branch. Try causing a conflict on purpose to practice resolving it!
