# Essential Git Commands Cheat Sheet

## Configuration
```bash
git config --global user.name "Your Name"      # Set username
git config --global user.email "mail@ex.com"   # Set email
git config --global color.ui auto              # Enable colors
git config --list                              # List config
```

## Setup & Init
```bash
git init                       # Initialize local repo
git clone <url>                # Clone remote repo
git clone <url> .              # Clone into current dir
```

## Basic Snapshotting
```bash
git status                     # Check file status
git add <file>                 # Stage file
git add .                      # Stage all files
git commit -m "Message"        # Commit staged files
git commit --amend             # Modify last commit
```

## Branching & Merging
```bash
git branch                     # List branches
git branch <name>              # Create branch
git checkout <name>            # Switch branch
git switch <name>              # Switch branch (modern)
git checkout -b <name>         # Create & switch
git merge <branch>             # Merge branch into current
git branch -d <name>           # Delete branch (safe)
git branch -D <name>           # Force delete
```

## Sharing & Updating
```bash
git remote add origin <url>    # Add remote
git remote -v                  # List remotes
git push origin <branch>       # Push to remote
git push -u origin <branch>    # Push and set upstream
git pull                       # Fetch and merge
git fetch                      # Fetch changes only
```

## Inspection & Comparison
```bash
git log                        # Show commit history
git log --oneline              # Compact history
git log --graph                # Visual history
git diff                       # Diff working dir vs staged
git diff --staged              # Diff staged vs last commit
git show <commit>              # Show commit details
```

## Undo & Reset
```bash
git clean -n                   # Dry run of cleaning untracked
git clean -f                   # Remove untracked files
git restore <file>             # Discard changes
git reset HEAD <file>          # Unstage file
git reset --soft HEAD~1        # Undo commit, keep changes
git reset --hard HEAD~1        # Undo commit, discard changes
```
