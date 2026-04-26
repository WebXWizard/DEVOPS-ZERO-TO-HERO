# Git and GitHub Fundamentals

## What is Version Control?

Version control is a system that records changes to files over time so you can recall specific versions later. It allows multiple developers to work on the same project without conflicts.

**Benefits:**
- Track all changes and who made them
- Revert to previous versions
- Collaborate without conflicts
- Branch and merge workflows
- Backup and disaster recovery

## Git vs GitHub

### Git
- **Distributed version control system**
- Runs locally on your computer
- Works offline
- Free and open-source
- Created by Linus Torvalds (2005)

### GitHub
- **Web-based hosting service for Git repositories**
- Cloud storage for Git repositories
- Collaboration platform
- Features: Issues, Pull Requests, Actions, Wikis
- Owned by Microsoft

**Alternatives to GitHub:** GitLab, Bitbucket, Gitea

## Core Git Concepts

### 1. Repository (Repo)
A directory tracked by Git containing your project files and history.
- **Local Repository**: On your computer
- **Remote Repository**: On GitHub/GitLab

### 2. Three States of Git

```
Working Directory → Staging Area → Repository
    (Modified)     (Staged/Indexed)  (Committed)
```

1. **Working Directory**: Where you edit files
2. **Staging Area (Index)**: Prepared files for next commit
3. **Repository**: Permanent snapshot of your project

### 3. Commit
A snapshot of your project at a specific point in time. Each commit has:
- **Unique SHA-1 hash**: 40-character identifier
- **Author and date**
- **Commit message**: Description of changes
- **Reference to previous commit** (parent)

### 4. Branch
An independent line of development. The default branch is usually `main` or `master`.

```
main:     A --- B --- C --- D
                 \
feature:          E --- F
```

### 5. Merge
Combining changes from different branches.

### 6. Remote
A version of your repository hosted on a server (e.g., GitHub).

## Git Workflow

### Basic Workflow
```bash
# 1. Make changes to files
# 2. Stage the changes
git add file.txt

# 3. Commit the changes
git commit -m "Description of changes"

# 4. Push to remote
git push origin main
```

### Branching Workflow
```bash
# Create and switch to new branch
git checkout -b feature-branch

# Make changes and commit
git add .
git commit -m "Add new feature"

# Switch back to main
git checkout main

# Merge feature into main
git merge feature-branch

# Delete feature branch
git branch -d feature-branch
```

## Git Configuration

### Initial Setup
```bash
# Set your identity
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"

# Set default editor
git config --global core.editor "nano"

# Set default branch name
git config --global init.defaultBranch main

# View configuration
git config --list
git config user.name
```

### Configuration Levels
- **--system**: All users on the system
- **--global**: Current user (most common)
- **--local**: Current repository only

## Important Git Files

### .gitignore
Specifies files/directories Git should ignore.

```gitignore
# Logs
*.log
logs/

# Dependencies
node_modules/
vendor/

# Environment variables
.env
.env.local

# IDE
.vscode/
.idea/

# OS files
.DS_Store
Thumbs.db

# Build outputs
dist/
build/
*.exe
```

### .git/ Directory
Hidden directory containing all Git metadata:
- `config`: Repository configuration
- `HEAD`: Points to current branch
- `objects/`: Stores all content
- `refs/`: References to commit objects

## GitHub Features

### 1. Pull Requests (PRs)
A request to merge code from one branch to another.

**Workflow:**
1. Fork or create branch
2. Make changes and commit
3. Create pull request
4. Code review
5. Merge after approval

### 2. Issues
Track bugs, features, and tasks.

**Components:**
- Title and description
- Labels (bug, enhancement, etc.)
- Assignees
- Milestones
- Comments

### 3. GitHub Actions
CI/CD platform for automation.

**Use cases:**
- Run tests on commits
- Deploy applications
- Build and publish packages
- Automated code quality checks

### 4. Forks
Your personal copy of someone else's repository.

**Fork workflow:**
1. Fork repository
2. Clone to local
3. Create feature branch
4. Make changes and commit
5. Push to your fork
6. Create pull request to original repo

### 5. README.md
Project documentation displayed on the repository homepage.

**Should include:**
- Project description
- Installation instructions
- Usage examples
- Contributing guidelines
- License information

## Collaboration Best Practices

### 1. Commit Messages
**Good commit messages:**
```
Add user authentication feature

- Implement JWT token generation
- Add login/logout endpoints
- Create middleware for protected routes
```

**Bad commit messages:**
```
fixed stuff
update
wip
```

### 2. Branch Naming Conventions
```
feature/user-authentication
bugfix/login-error
hotfix/security-patch
release/v1.2.0
```

### 3. Git Flow
Popular branching model:
- **main**: Production-ready code
- **develop**: Integration branch
- **feature/***: New features
- **release/***: Release preparation
- **hotfix/***: Production fixes

### 4. Code Review Guidelines
- Review code promptly
- Be constructive and respectful
- Test the changes
- Check for code quality and standards
- Suggest improvements

## Common Scenarios

### Undoing Changes

```bash
# Discard changes in working directory
git checkout -- file.txt

# Unstage file
git reset HEAD file.txt

# Undo last commit (keep changes)
git reset --soft HEAD~1

# Undo last commit (discard changes)
git reset --hard HEAD~1

# Revert commit (create new commit)
git revert commit-hash
```

### Handling Conflicts

```bash
# Pull latest changes
git pull origin main
# CONFLICT appears

# Edit conflicted files (remove markers)
<<<<<<< HEAD
your changes
=======
their changes
>>>>>>> branch-name

# After resolving
git add conflicted-file.txt
git commit -m "Resolve merge conflict"
```

### Stashing Changes

```bash
# Save changes temporarily
git stash

# List stashes
git stash list

# Apply latest stash
git stash apply

# Apply and remove stash
git stash pop

# Drop stash
git stash drop
```

## Git vs Other Version Control

### Git vs SVN
| Feature | Git | SVN |
|---------|-----|-----|
| Type | Distributed | Centralized |
| Offline work | Yes | Limited |
| Performance | Faster | Slower |
| Learning curve | Steeper | Easier |
| Storage | More efficient | Less efficient |

## Security Best Practices

1. **Never commit secrets**
   - Use `.gitignore` for sensitive files
   - Use environment variables
   - Scan for leaked secrets

2. **Use SSH keys**
   - More secure than passwords
   - No need to type password repeatedly

3. **Enable 2FA on GitHub**
   - Additional security layer
   - Protect account from unauthorized access

4. **Review permissions**
   - Limit collaborator access
   - Use protected branches
   - Require code reviews

## DevOps Integration

### CI/CD Pipeline
```yaml
# Example GitHub Actions workflow
name: CI/CD Pipeline

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Run tests
        run: npm test
      - name: Build
        run: npm run build
      - name: Deploy
        run: ./deploy.sh
```

### GitOps
Using Git as single source of truth for infrastructure and application configuration.

**Benefits:**
- Version-controlled infrastructure
- Automated deployments
- Easy rollbacks
- Audit trail

## Quick Reference

### Git Objects
1. **Blob**: File content
2. **Tree**: Directory structure
3. **Commit**: Snapshot
4. **Tag**: Named reference to commit

### HEAD
Pointer to current branch/commit.
- **HEAD**: Current branch
- **HEAD~1**: One commit before HEAD
- **HEAD^**: First parent of HEAD

### Tracking Changes
```bash
git status              # Check status
git diff                # Changes in working directory
git diff --staged       # Changes in staging area
git log                 # Commit history
git log --oneline       # Compact history
git log --graph         # Visual branch history
```

## Learning Resources

1. **Official Documentation**: https://git-scm.com/doc
2. **GitHub Learning Lab**: Interactive tutorials
3. **Try Git**: https://try.github.io
4. **Git Cheat Sheet**: Quick command reference
5. **Pro Git Book**: Free comprehensive guide

## Study Tips

1. **Practice regularly**: Create dummy repositories
2. **Break things**: Learn by making mistakes
3. **Use visualization tools**: GitKraken, SourceTree
4. **Contribute to open source**: Real-world experience
5. **Follow best practices**: Write good commits from day one
