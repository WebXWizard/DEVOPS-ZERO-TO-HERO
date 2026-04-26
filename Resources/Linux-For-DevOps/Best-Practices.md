# Linux Best Practices for DevOps

You will spend 90% of your time in a Linux terminal. Here is how to keep your system clean and secure.

## 1. Respect `sudo` (The Root User)
- **Rule**: Do not log in as `root`. Log in as a regular user and use `sudo` for commands that need admin privileges.
- **Reason**: Running everything as root increases the risk of accidentally deleting system files (`rm -rf /`).

## 2. File Permissions (Not everything is 777)
- **Bad**: `chmod 777 filename` (Gives read/write/execute permission to *everyone*).
- **Good**:
    - `755` (Owner can write, everyone can read/execute).
    - `644` (Owner can write, everyone can read).
    - `400` (Only owner can read - used for SSH keys).

## 3. SSH Keys over Passwords
- **Rule**: Disable password authentication for your servers. Use SSH Key Pairs (`id_rsa`).
- **Reason**: Passwords can be brute-forced. SSH keys are cryptographically secure.

## 4. Updates and Upgrades
- Before installing software, always update your package list.
- `sudo apt update`
- This ensures you aren't installing an obsolete or insecure version of a package.

## 5. Script Reusability (Variables)
- Don't hardcode paths like `/home/hp/myproject`.
- Use variables (`$HOME/myproject`) so your scripts run on any user's machine.
