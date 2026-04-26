# 04. Simple Workflow Example (GitHub Actions)

Let's walk through a practical "Hello World" example using **GitHub Actions**. This will help you visualize how a pipeline file looks.

## The Scenario
We have a simple website. We want a pipeline that does this every time we push code:
1.  **Check out** the code.
2.  **Print** "Hello, World!" to the console.
3.  **Run** a fake test.

## The File Structure
In GitHub Actions, pipelines live in `.github/workflows/`.
Filename: `.github/workflows/hello.yml`

## The YAML Code

```yaml
# Name of the pipeline
name: Hello World Pipeline

# When does this run?
on: [push] 

# The list of jobs
jobs:
  # Name of the first job
  say-hello:
    # The OS the runner will use (Ubuntu Linux)
    runs-on: ubuntu-latest

    # The steps to execute
    steps:
      # Step 1: Check out the repository code
      - name: Checkout Code
        uses: actions/checkout@v3

      # Step 2: Run a simple script
      - name: Print Hello
        run: echo "Hello, World! I am running on a CI server."

      # Step 3: Run another script
      - name: Run Fake Test
        run: |
          echo "Running tests..."
          echo "Test Passed!"
```

## Detailed Explanation

1.  **`name: Hello World Pipeline`**: Just a human-readable name.
2.  **`on: [push]`**: This assumes the Trigger. "Hey GitHub, run this whenever anyone pushes code".
3.  **`runs-on: ubuntu-latest`**: We are asking GitHub to give us a fresh virtual machine running Ubuntu.
4.  **`steps`**:
    - **`uses: actions/checkout@v3`**: This is a pre-made action. It downloads your code onto the runner. Without this, the runner is empty!
    - **`run: echo ...`**: This is just a standard Linux command line instruction.

## What Happens in Real Life?
When you push this file:
1.  GitHub detects the file.
2.  It spins up a server.
3.  It runs the steps one by one.
4.  If any step fails (returns a non-zero exit code), the whole pipeline turns **RED** (Failed).
5.  If all step pass, the pipeline turns **GREEN** (Success).
