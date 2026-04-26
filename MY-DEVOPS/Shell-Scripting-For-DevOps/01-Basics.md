# 01 - Shell Scripting Basics

## What is Shell Scripting?
A shell script is a computer program designed to be run by the Unix shell, a command-line interpreter. It is essentially a text file containing a series of commands that are executed sequentially.

## The Shebang (`#!`)
The first line of a shell script is called the **shebang**. It tells the system which interpreter to use to execute the script.

For Bash scripts, it looks like this:
```bash
#!/bin/bash
```

## Creating a Script
1.  Create a file with a `.sh` extension (e.g., `myscript.sh`).
2.  Add the shebang at the top.
3.  Add your commands.

**Example:**
```bash
#!/bin/bash
echo "Hello, DevOps World!"
```

## Making it Executable
Before you can run a script directly, you need to give it execute permissions using the `chmod` command:

```bash
chmod +x myscript.sh
```

## Running the Script
You can run the script in two ways:

1.  **Directly (if executable):**
    ```bash
    ./myscript.sh
    ```

2.  **Using the interpreter explicitly:**
    ```bash
    bash myscript.sh
    ```
    *(This works even if the file doesn't have execute permissions)*
