# Git & GitHub Best Practices

Git is the foundation of DevOps. Using it "correctly" triggers the rest of your automation.

## 1. Write Meaningful Commit Messages
- **Bad**: `fix`, `update`, `working on it`.
- **Good**: `fix: login button crash on mobile`, `feat: add user profile page`.
- **Reason**: The history is your documentation. Six months from now, you won't remember what "fix" meant.

## 2. Never Commit Secrets
- **Rule**: API Keys, AWS Credentials, and Passwords should NEVER go into Git.
- **Tool**: Use `.gitignore` to exclude config files (like `.env`).
- **Safety**: If you accidentally commit a password, consider it compromised. Rotate it immediately.

## 3. Use Branches (Feature Branch Workflow)
- **Rule**: Never push directly to `main` (or `master`).
- **Workflow**:
    1.  Create a branch: `git checkout -b feature/login-page`
    2.  Work on your changes.
    3.  Push the branch.
    4.  Create a Pull Request to merge correctly into `main`.
- **Reason**: This allows for code review and automated testing before changing the "production" code.

## 4. Keep Commits Small (Atomic Commits)
- **Rule**: One commit should do one thing.
- **Reason**: If you break something, it's easier to revert a small commit than a massive one that changed 50 files.

## 5. Use `.gitignore`
- Always have a `.gitignore` file at the root of your repo.
- Ignore: `node_modules/`, `__pycache__/`, `*.log`, `.DS_Store`, build artifacts (`/dist`, `/build`).
