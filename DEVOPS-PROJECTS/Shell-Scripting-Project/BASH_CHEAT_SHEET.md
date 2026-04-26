# 📜 Bash Scripting Cheat Sheet

## 🚀 Key Symbols
| Symbol | Meaning | Example |
| :--- | :--- | :--- |
| `#!/bin/bash` | **Shebang**. Tells the computer this is a bash script. Must be on line 1. | `#!/bin/bash` |
| `$` | **Variable**. Required to *read* a variable's value. | `echo $NAME` |
| `#` | **Comment**. The computer ignores everything after this. | `# This is hidden` |
| `|` | **Pipe**. Takes the output of one command and gives it to the next. | `ls | grep .txt` |
| `>` | **Redirect (Overwrite)**. Saves output to a file, deleting old content. | `echo "Hi" > file.txt` |
| `>>` | **Redirect (Append)**. Adds output to the end of a file. | `echo "Hi" >> file.txt` |

## 🏗️ Logic & Flow
### Variables
```bash
NAME="DevOps"       # Assignment (No spaces!)
echo "Hello $NAME"  # Usage
```

### If/Else Statements
```bash
if [ "$AGE" -gt 18 ]; then
    echo "Adult"
else
    echo "Minor"
fi
```
*   `-gt`: Greater Than
*   `-lt`: Less Than
*   `-eq`: Equal

### Loops (For)
```bash
for file in *.txt; do
    echo "Found text file: $file"
done
```
