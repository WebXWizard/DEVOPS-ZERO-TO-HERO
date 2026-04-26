# 🚀 Complete Git Guide - By WebXWizard

A complete beginner-to-advanced guide for mastering **Git** — your ultimate version control tool.

---

## 🧩 Table of Contents
1. [What is Git?](#what-is-git)
2. [Install Git](#install-git)
3. [Setup Git Configuration](#setup-git-configuration)
4. [Basic Commands](#basic-commands)
5. [Working with Repositories](#working-with-repositories)
6. [Branching & Merging](#branching--merging)
7. [Undoing Changes](#undoing-changes)
8. [Working with Remotes (GitHub, GitLab)](#working-with-remotes)
9. [Stashing Changes](#stashing-changes)
10. [Rebase, Cherry-Pick & Tagging](#rebase-cherry-pick--tagging)
11. [Collaboration Workflow](#collaboration-workflow)
12. [Common Issues & Fixes](#common-issues--fixes)
13. [Git Best Practices](#git-best-practices)
14. [Resources](#resources)

---

## 🧠 What is Git?
Git is a **distributed version control system** that tracks changes in your code and allows multiple people to collaborate on the same project efficiently.

---

## ⚙️ Install Git

### 🪟 Windows
Download from [git-scm.com](https://git-scm.com/downloads) and follow the installer.

### 🐧 Linux
```bash
sudo apt install git -y
```

### 🍎 macOS
```bash
brew install git
```

---

## ⚙️ Setup Git Configuration

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
git config --list
```

Optional:
```bash
git config --global core.editor "code --wait"
git config --global color.ui auto
```

---

## 📂 Basic Commands

| Command | Description |
|----------|--------------|
| `git init` | Initialize a new repository |
| `git clone <url>` | Copy (clone) a repository |
| `git status` | Check current repo status |
| `git add <file>` | Add a file to staging |
| `git add .` | Add all changes |
| `git commit -m "message"` | Save staged changes |
| `git log` | Show commit history |
| `git diff` | Show unstaged changes |

---

## 🧱 Working with Repositories

```bash
git init                # Start a new repo
git clone <repo-url>    # Clone existing repo
git add <file>          # Add file to staging
git commit -m "msg"     # Commit staged changes
git push origin main    # Push to GitHub
git pull origin main    # Pull latest changes
```

---

## 🌿 Branching & Merging

### Create and Switch Branch
```bash
git branch feature-login
git checkout feature-login
# OR
git checkout -b feature-login
```

### Merge Branch
```bash
git checkout main
git merge feature-login
```

### Delete Branch
```bash
git branch -d feature-login
```

---

## 🧹 Undoing Changes

| Action | Command |
|--------|----------|
| Unstage a file | `git reset <file>` |
| Undo last commit (keep changes) | `git reset --soft HEAD~1` |
| Undo last commit (remove changes) | `git reset --hard HEAD~1` |
| Undo unstaged file | `git checkout -- <file>` |

---

## 🌐 Working with Remotes

### Add Remote
```bash
git remote add origin <url>
```

### Push / Pull
```bash
git push origin main
git pull origin main
```

### View Remotes
```bash
git remote -v
```

---

## 💾 Stashing Changes

```bash
git stash save "temporary work"
git stash list
git stash apply stash@{0}
git stash drop stash@{0}
git stash clear
```

---

## 🪄 Rebase, Cherry-Pick & Tagging

### Rebase
```bash
git checkout feature
git rebase main
```

### Cherry-pick (pick a specific commit)
```bash
git cherry-pick <commit-hash>
```

### Tag a commit
```bash
git tag -a v1.0 -m "Version 1.0"
git push origin v1.0
```

---

## 🤝 Collaboration Workflow

1. **Fork & Clone**
   ```bash
   git clone https://github.com/user/repo.git
   ```
2. **Create Branch**
   ```bash
   git checkout -b feature-xyz
   ```
3. **Commit Changes**
   ```bash
   git add .
   git commit -m "Added new feature"
   ```
4. **Push & Create Pull Request**
   ```bash
   git push origin feature-xyz
   ```

---

## ⚠️ Common Issues & Fixes

| Problem | Fix |
|----------|-----|
| `fatal: not a git repository` | Run inside a Git repo |
| `error: failed to push` | Run `git pull --rebase origin main` |
| Merge conflicts | Manually edit files, then `git add` + `git commit` |
| Permission denied (SSH) | Re-add SSH key or use HTTPS URL |

---

## 🧠 Git Best Practices

- Commit often with clear messages.
- Use `.gitignore` to skip unnecessary files.
- Keep branches small and focused.
- Always `pull` before `push`.
- Never commit secrets or API keys.

---

## 📘 Resources

- [Official Git Docs](https://git-scm.com/docs)
- [GitHub Guides](https://guides.github.com/)
- [Atlassian Git Tutorials](https://www.atlassian.com/git/tutorials)
- [Oh My Git! — Visual Game](https://ohmygit.org/)

---

**Made with ❤️ for developers who want to master Git.**
