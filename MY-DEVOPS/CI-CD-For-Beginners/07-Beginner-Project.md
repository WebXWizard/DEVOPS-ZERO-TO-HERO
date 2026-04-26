# 07. Beginner Project: Your First CI Pipeline

Theory is good, but practice is better. In this project, you will build a real CI pipeline using **GitHub Actions** and a simple **Node.js** application.

## 🎯 Objective
Create a repository where every time you push code, GitHub automatically:
1.  Installs your project dependencies.
2.  Runs a test script.
3.  Tells you if your code is "Safe" (Green) or "Broken" (Red).

---

## 🛠️ Step 1: Create a GitHub Repository
1.  Go to [GitHub.com](https://github.com) and sign in.
2.  Click the **+** icon in the top right -> **New repository**.
3.  Name it: `my-first-ci-pipeline`.
4.  Check "Add a README file".
5.  Click **Create repository**.

---

## 💻 Step 2: Create the Project Files (Locally)
Clone the repository recursively to your machine, or just create these files manually and upload them.

### File 1: `package.json`
This file defines our Node.js project and the test command.

```json
{
  "name": "my-first-ci",
  "version": "1.0.0",
  "scripts": {
    "test": "node test.js"
  }
}
```

### File 2: `test.js`
This is our "Test Suite". It's a simple script that checks if 1 + 1 equals 2.

```javascript
// A simple test script
const sum = 1 + 1;

if (sum === 2) {
  console.log("Test Passed! 1 + 1 is indeed 2.");
  process.exit(0); // Exit with success code
} else {
  console.error("Test Failed! Math is broken.");
  process.exit(1); // Exit with error code
}
```

---

## 🚀 Step 3: Create the Pipeline
Create the folder structure `.github/workflows/` and add the pipeline file.

### File 3: `.github/workflows/main.yml`

```yaml
name: Node.js CI

on: [push]

jobs:
  build-and-test:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout Code
        uses: actions/checkout@v3

      - name: Setup Node.js
        uses: actions/setup-node@v3
        with:
          node-version: '16'

      - name: Install Dependencies
        run: npm install

      - name: Run Tests
        run: npm test
```

---

## 🧪 Step 4: Push and Watch
1.  Commit and push these 3 files to GitHub.
2.  Go to your Repository page on GitHub.
3.  Click the **Actions** tab.
4.  You should see a workflow run named "Node.js CI".
5.  Click on it -> Click **build-and-test**.
6.  You will see the logs. It should be **Green** ✅.

---

## 💥 Step 5: Break It! (Optional)
1.  Edit `test.js` and change `const sum = 1 + 1;` to `const sum = 1 + 5;`.
2.  Commit and push having the message "Breaking the build".
3.  Go back to the **Actions** tab.
4.  Watch the pipeline fail. It will turn **Red** ❌.
5.  You should receive an email saying your build failed.

## 🎉 Congratulations!
You have just implemented Continuous Integration. You successfully automated the testing process!
