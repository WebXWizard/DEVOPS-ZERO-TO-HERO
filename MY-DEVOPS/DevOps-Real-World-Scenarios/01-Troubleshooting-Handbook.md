# The DevOps Troubleshooting Handbook

**"The server is down."** - The scariest 4 words. Here is how to fix it.

## 1. Scenario: "The server is slow" (High Load)
**Tools**: `top`, `htop`, `iotop`.

1.  **Check CPU/RAM**: Run `htop`.
    - Is one process eating 100% CPU? -> Kill it (`kill -9 PID` - careful!).
    - Is RAM full? -> Check for memory leaks.
2.  **Check Swap**: If Swap is being used heavily, you need more RAM or to optimize the app.
3.  **Check IO**: Run `iotop`. Is the disk writing too much data?

## 2. Scenario: "Disk is Full" (No space left on device)
**Tools**: `df`, `du`.

1.  **Check usage**: `df -h`. (If `/` is 100%, you are in trouble).
2.  **Find the culprit**: `du -sh /var/log/* | sort -h`.
    - Usually, it's a massive log file.
3.  **Fix**:
    - Temporary: `truncate -s 0 /var/log/syslog` (Empty file without deleting it).
    - Permanent: Setup `logrotate`.

## 3. Scenario: "502 Bad Gateway"
**Context**: You have Nginx sitting in front of a Python/NodeJS app.
**Meaning**: The Gateway (Nginx) tried to talk to the Upstream (App), but the App gave an invalid response (or was dead).

1.  **Check App Status**: Is the Python/Node process running? (`ps aux | grep python`).
2.  **Check Port**: Is the app listening on the right port? (`netstat -plnt`).
3.  **Check Logs**:
    - Nginx: `/var/log/nginx/error.log`
    - App: `journalctl -u my-app`

## 4. Scenario: "Connection Refused" (SSH)
1.  **Check IP**: Are you pinging the right IP?
2.  **Check Security Group (AWS)**: Did you allow Port 22 from your IP?
3.  **Check Key Permissions**: `chmod 400 key.pem`.
