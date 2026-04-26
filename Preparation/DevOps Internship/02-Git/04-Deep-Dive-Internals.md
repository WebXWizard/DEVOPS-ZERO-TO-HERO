# Git Internals & Advanced Workflows

## 1. Git Internals (The .git folder)
Git is essentially a content-addressable filesystem (Key-Value store).

### The Object Model
Everything is an object identified by a SHA-1 hash (40 chars).
1.  **Blob (Binary Large Object)**: Stores file *content*. (No filename, no metadata).
2.  **Tree**: Represents a directory. Stores filenames and pointers (hashes) to Blobs or other Trees.
3.  **Commit**: Stores pointer to a top-level Tree (Project snapshot), Author, Message, and **Parent Commit hash**.
4.  **Tag**: Named pointer to a Commit.

### The Refs (`.git/refs`)
Human-readable names for hashes.
*   `refs/heads/main`: A file containing the hash of the latest commit on main.
*   **HEAD**: A pointer to the current branch ref (e.g., `ref: refs/heads/main`).

## 2. Advanced Concepts

### The Reflog (Reference Logs)
Git records updates to the tip of branches and HEAD.
*   *Scenario*: You did `git reset --hard` and lost a commit.
*   *Solution*: `git reflog` shows your history of moves. Find the hash before the reset and `git checkout` or `git reset` to it.
*   Reflog is local-only and temporary (expires in ~90 days).

### Detached HEAD
Occurs when you checkout a commit directly (`git checkout a1b2c3d`) instead of a branch.
*   New commits created here do not belong to any branch.
*   If you switch away, garbage collector might delete them.
*   *Fix*: `git checkout -b new-branch-name` to save the work.

### Submodules
Keeping a Git repo inside another Git repo.
*   Use for shared libraries.
*   Tracks a specific *commit hash* of the submodule, not the branch.
*   `git submodule add <url>`
*   `git submodule update --init --recursive`

## 3. Advanced Workflows

### Interactive Rebase (`git rebase -i`)
Rewrite history to clean up local commits before pushing.
*   **Pick**: Keep commit.
*   **Squash**: Meld into previous commit.
*   **Edit**: Stop to modify commit.
*   **Drop**: Remove commit.
*   *Rule*: Never rebase shared public history!

### Git Hooks (`.git/hooks`)
Scripts that run automatically on events.
*   **Client-side**: `pre-commit` (run linting), `commit-msg` (check message pattern).
*   **Server-side**: `pre-receive` (enforce policy, e.g., reject push to master).

### Bisect (`git bisect`)
Binary search to find which commit introduced a bug.
1.  `git bisect start`
2.  `git bisect bad` (current broken version)
3.  `git bisect good v1.0` (last known working)
4.  Git checks out a middle commit. You test.
5.  Say `git bisect good` or `git bisect bad`. Repeat until culprit found.
