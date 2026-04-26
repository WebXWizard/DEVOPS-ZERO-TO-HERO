# Programming Languages (Python) Study Guide

**Estimated Time**: 4-6 weeks

Python is the preferred scripting language for DevOps due to its readability, powerful libraries, and cross-platform support. It's used for automating infrastructure, configuration, and data processing.

## Essential Concepts

### 1. Python Syntax and Data Structures
Foundational elements:
- **Variables**: Storing text, numbers, and boolean values.
- **Lists**: Ordered sequences (e.g., `['a', 'b', 'c']`).
- **Dictionaries**: Key-value pairs (e.g., `{'name': 'John', 'age': 30}`).
- **Sets**: Unique elements (e.g., `{1, 2, 3}`).
- **Tuples**: Immutable sequences (e.g., `(10.0, 20.0)`).

### 2. Modules and Packages
Reusing code:
- `import <module>`: Use built-in or external libraries.
- `pip install <package>`: Install third-party packages from PyPI.
- `venv`: Create isolated Python environments for projects.

### 3. Writing and Executing Scripts
Automating tasks:
- `python <script.py>`: Run scripts from the command line.
- `argparse`: Handle command-line arguments in scripts.
- **Shebang**: `#!/usr/bin/env python3` at the top of scripts.

### 4. File Handling
Processing configuration and logs:
- `open()`: Read (`'r'`), Write (`'w'`), and Append (`'a'`) to files.
- `with` statement: Automatic file closing (`with open('file.txt') as f:`).
- **JSON & YAML**: Parsing and generating configuration data.

### 5. Error Handling
Handling failures gracefully:
- `try`, `except`, `finally`: Catch and handle exceptions (e.g., `FileNotFoundError`).
- **Logging**: Using the `logging` module to track script execution.

### 6. Automation Scripts
System integrations:
- `subprocess`: Run shell commands from Python.
- `os` & `sys`: Interact with the operating system and interpreter.
- `shutil`: High-level file operations (copy, move, delete).

### 7. Web Scraping & APIs
Gathering data/integrations:
- `requests`: Make HTTP requests to external APIs.
- `BeautifulSoup`: Parse HTML and XML content.
- `flask` / `fastapi`: Create simple web servers/endpoints.

---
**Practical Challenge**: Write a Python script that takes a URL as a command-line argument, fetches its title using `requests` and `BeautifulSoup`, and saves it to a file called `titles.txt`.
