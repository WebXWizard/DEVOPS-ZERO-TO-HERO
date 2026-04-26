# Git & GitHub Mastery: The Simulator

This project is a **safe sandbox** to practice Git commands. It includes a script that *intentionally breaks* your code so you can learn how to fix it!

## 📂 Project Structure
- `collaboration-story.txt`: The file we will be tracking.
- `simulate_conflict.sh`: A script that creates a complex merge conflict for you to solve.
- `GIT_CHEAT_SHEET.md`: Your reference guide.

---

## 🎮 Level 1: Basic Save (Commit)
1.  Open `collaboration-story.txt` and add a new line at the bottom.
2.  Open your terminal (Git Bash).
3.  Run:
    ```bash
    git init
    git add .
    git commit -m "Added a new ending"
    ```

## 🎮 Level 2: The Parallel Universe (Branching)
1.  Create a new world called "feature-fantasy":
    ```bash
    git checkout -b feature-fantasy
    ```
2.  Change the story in `collaboration-story.txt` to include dragons.
3.  Save it:
    ```bash
    git add .
    git commit -m "Added dragons"
    ```
4.  Switch back to reality:
    ```bash
    git checkout master
    ```
    (Notice the dragons disappeared? That's the power of branches!)

## 🎮 Level 3: The Boss Fight (Merge Conflicts)
This is the most important skill for a DevOps engineer.

1.  Run the simulator script:
    ```bash
    ./simulate_conflict.sh
    ```
    *   *Note: You may need to run `chmod +x simulate_conflict.sh` first.*

2.  **Git will panic** and tell you there is a CONFLICT.
3.  Open `collaboration-story.txt`. You will see something like this:
    ```
    <<<<<<< HEAD
    It seemed EXTREMELY HARD at first.
    =======
    It seemed VERY EASY at first.
    >>>>>>> developer-a
    ```
4.  **Your Job**: Delete the symbols (`<<<`, `===`, `>>>`) and choose which sentence is correct (or rewrite it).
5.  Save the fix:
    ```bash
    git add .
    git commit -m "Fixed the conflict"
    ```
    **VICTORY!** 🏆

---

## ✅ Task List

- [x] Project Initialization
    - [x] Create project directory `Git-GitHub-Project`
    - [x] Create `implementation_plan.md`
- [x] Practice Environment
    - [x] Create `collaboration-story.txt` (A file to practice editing)
    - [x] Create `simulate_conflict.sh` (A script to auto-generate a conflict for practice)
- [x] Educational Resources
    - [x] Create `GIT_CHEAT_SHEET.md` (Add, Commit, Push, Branch, Merge)
    - [x] Create `README.md` (The "Git Workflow" Simulation Guide)
- [x] Verification
    - [x] Guide user to run the conflict simulator
