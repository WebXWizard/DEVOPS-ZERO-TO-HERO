# Beginner Project: The Collaborative Workflow

In professional DevOps, you rarely work alone. This project simulates the standard "Team Workflow" using Git and GitHub.

## 🎯 Objective
Simulate a full feature lifecycle: Branch -> Commit -> Pull Request -> Merge.

## 🛠️ Step 1: Configuration
Ensure your git identity is set up locally.
```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

## 🏗️ Step 2: Set up the Repository
1.  Create a new repo on GitHub called `git-workflow-demo`.
2.  Clone it to your machine.
3.  Create a file `main.txt` with the text: "Version 1.0".
4.  Commit and push to `main`.

## 🌿 Step 3: The "Feature" Phase
Pretend you are adding a new feature.
1.  **Create a Branch**:
    ```bash
    git checkout -b feature/update-version
    ```
2.  **Make Changes**:
    Open `main.txt` and change text to "Version 2.0 - Improved!".
3.  **Check Status**:
    ```bash
    git status
    ```
4.  **Commit**:
    ```bash
    git add main.txt
    git commit -m "feat: update version number to 2.0"
    ```
5.  **Push**:
    ```bash
    git push -u origin feature/update-version
    ```

## 🔀 Step 4: The Pull Request (PR)
1.  Go to your GitHub repository page.
2.  You will see a yellow banner: "feature/update-version had recent pushes".
3.  Click **Compare & pull request**.
4.  Title: "Update to Version 2.0".
5.  Click **Create Pull Request**.

## ✅ Step 5: The Review and Merge
1.  On the PR page, click the **Files changed** tab to see code differences (Diff).
2.  Go back to **Conversation**.
3.  Click **Merge pull request** -> **Confirm merge**.
4.  The changes are now in the `main` branch!

## 🧹 Step 6: Cleanup
1.  Delete the remote branch on GitHub (there is a button for it).
2.  Update your local system:
    ```bash
    git checkout main
    git pull origin main
    git branch -d feature/update-version
    ```
