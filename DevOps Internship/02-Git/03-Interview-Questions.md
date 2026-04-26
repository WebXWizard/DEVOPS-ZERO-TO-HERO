# Git Interview Questions & Answers

## Basic
1.  **What is Git?**
    *Distributed version control system for tracking changes in source code.*

2.  **Git vs GitHub?**
    *Git is the tool (local); GitHub is the service (cloud) hosting Git repositories.*

3.  **What is `git init`?**
    *Initializes a new Git repository in the current directory.*

4.  **What is the 'Staging Area'?**
    *Intermediate area where changes are prepared before committing.*

## Intermediate
5.  **Explain `git merge` vs `git rebase`?**
    *Merge preserves history order; Rebase rewrites history to be linear.*

6.  **What is a Merge Conflict?**
    *Occurs when Git cannot automatically resolve differences between two commits (e.g., same line edited differently).*

7.  **How to revert a bad commit that was already pushed?**
    *Use `git revert <commit-id>` to create a new commit that undoes changes. Avoid `git reset` on shared branches.*

8.  **Difference between `git fetch` and `git pull`?**
    *`fetch` gets changes but doesn't merge; `pull` does `fetch` + `merge`.*

## Advanced
9.  **What is Cherry-picking?**
    *`git cherry-pick <commit-id>` applies a specific commit from one branch to another.*

10. **What is git stash?**
    *Temporarily checks out locally modified files to a stack so you can switch branches. `git stash pop` restores them.*

11. **What is a detached HEAD?**
    *When you checkout a specific commit instead of a branch. You are not on any branch.*

12. **Gitflow Workflow?**
    *Standard branching model: Master, Develop, Feature branches, Release branches, Hotfix branches.*
