# Automation Scripting (Bash & Python)

## Bash Scripting
Used for system administration, file manipulation, and simple automation.

### Example 1: Check Website Health
```bash
#!/bin/bash
URL="https://google.com"
CODE=$(curl -s -o /dev/null -w "%{http_code}" $URL)

if [ "$CODE" -eq 200 ]; then
    echo "Website is UP"
else
    echo "Website is DOWN (Status: $CODE)"
fi
```

### Example 2: Log Rotation (Delete files older than 7 days)
```bash
#!/bin/bash
LOG_DIR="/var/log/myapp"
find $LOG_DIR -name "*.log" -type f -mtime +7 -exec rm {} \;
echo "Old logs deleted."
```

## Python Scripting
Used for complex logic, API interactions (AWS Boto3), and data processing.

### Example 1: Backup Directory to Zip
```python
import shutil
import datetime

src = "/home/user/data"
dst = f"/tmp/backup_{datetime.date.today()}"

shutil.make_archive(dst, 'zip', src)
print(f"Backup created at {dst}.zip")
```

### Example 2: Check Disk Usage
```python
import shutil

total, used, free = shutil.disk_usage("/")

print(f"Total: {total // (2**30)} GiB")
print(f"Used: {used // (2**30)} GiB")
print(f"Free: {free // (2**30)} GiB")

if (free // total) < 0.1:
    print("WARNING: Low disk space!")
```

## Interview Questions
1.  **Shebang line?**
    *`#!/bin/bash` or `#!/usr/bin/env python3`. Tells the system which interpreter to use.*

2.  **`chmod +x`?**
    *Makes the script executable.*

3.  **Exit codes?**
    *0 = Success, Non-zero (1-255) = Error. stored in `$?` in Bash.*

4.  **Difference between `$@` and `$*`?**
    *`$@` treats arguments as separate strings ("1" "2"). `$*` treats as one string ("1 2").*
