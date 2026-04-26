# 🦑 Git Commands Cheat Sheet

## 🛫 Getting Started
*   `git init` -> Turns the current folder into a Git repository.
*   `git clone <url>` -> Downloads a repository from GitHub to your computer.

## 💾 Saving Changes
*   `git status` -> "What changed?" (Shows modified files).
*   `git add .` -> "Stage everything." (Prepare all changes to be saved).
*   `git commit -m "Message"` -> "Save it." (Officially records the snapshot).

## 🌿 Branches (Parallel Universes)
*   `git branch` -> Lists all branches.
*   `git branch <name>` -> Creates a new branch.
*   `git checkout <name>` -> Switches to that branch.
*   `git checkout -b <name>` -> Creates AND Switches to a new branch (Shortcut).

## 🤝 Syncing (GitHub)
*   `git push origin main` -> Uploads your commits to GitHub.
*   `git pull origin main` -> Downloads new commits from GitHub.

## 🔥 Advanced
*   `git merge <branch>` -> Combines the specified branch into your CURRENT branch.
*   `git log` -> Shows history of commits.
*   `git reset --hard` -> "Oops button". Erases unsaved changes and goes back to last commit.
