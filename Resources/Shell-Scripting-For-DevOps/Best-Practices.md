# Shell Scripting Best Practices

Shell scripts are powerful but dangerous. A small typo can delete the wrong folder. Follow these rules to write safe production scripts.

## 1. Always Use a Shebang
The first line should define the interpreter.
```bash
#!/bin/bash
```

## 2. Fail Fast (`set -e`)
By default, bash continues even if a command fails. This is bad for automation.
- **Rule**: Add `set -e` at the top of your script.
- **Effect**: If *any* command fails, the script stops immediately.

## 3. Quote Your Variables
- **Bad**: `rm $FILE`
- **Good**: `rm "$FILE"`
- **Reason**: If the filename has a space (e.g., "my file"), the bad command executes `rm my` and `rm file`. Disaster waiting to happen.

## 4. Use Descriptive Variable Names
- **Bad**: `d=/var/www`
- **Good**: `WEB_DIR=/var/www`

## 5. Clean Up Temporary Files
If your script creates temporary files, ensure it deletes them at the end.
- Use `trap` to ensure cleanup happens even if the script crashes.
```bash
temp_file=$(mktemp)
trap "rm -f $temp_file" EXIT
```

## 6. Debug Mode
If your script is acting weird, run it with `-x` to see every command being executed.
```bash
bash -x myscript.sh
```
