# Shell Scripting Bootcamp

This project contains 4 essential scripts to start your journey into DevOps automation.

## 📂 Project Structure
- **/scripts**:
    - `01-hello-world.sh`: Learn variables and input.
    - `02-backup-manager.sh`: Learn zip archives and timestamps.
    - `03-server-monitor.sh`: Learn logical conditions (If/Else).
    - `04-user-management.sh`: Learn loops.

- `BASH_CHEAT_SHEET.md`: A quick reference guide.

---

## 🚀 How to Run (Windows Users)

You need **Git Bash** (which comes with Git) or **WSL** to run these commands. The default Windows Command Prompt (cmd) will not work easily.

### Step 1: Open Terminal
Right-click inside the folder and select **"Open Git Bash Here"**.

### Step 2: Make Scripts Executable
Linux protects files by default. You need to verify you have permission to run them.
```bash
cd scripts
chmod +x *.sh
```
*   `chmod`: Change Mode
*   `+x`: Add eXecute permission

### Step 3: Run a Script
To run a script in the current directory, use `./` before the filename.

```bash
./01-hello-world.sh
```

Try them all one by one!

---

## ✅ Task List

- [x] Project Initialization
    - [x] Create project directory `Shell-Scripting-Project`
    - [x] Create `implementation_plan.md`
- [x] Essential Scripts
    - [x] Create `01-hello-world.sh` (Variables & Echo)
    - [x] Create `02-backup-manager.sh` (Zipping & Timestamping)
    - [x] Create `03-server-monitor.sh` (Disk Usage & CPU)
    - [x] Create `04-user-management.sh` (Looping & User Creation)
- [x] Documentation
    - [x] Create `BASH_CHEAT_SHEET.md`
    - [x] Create `README.md` (How to run scripts)
- [x] Verification
    - [x] Test scripts locally (using Git Bash or WSL)
