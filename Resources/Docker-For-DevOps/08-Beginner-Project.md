# 08. Beginner Project: Dockerize a Python App

In this project, you will take a simple Python script and make it run inside a Docker container.

## 🎯 Objective
Create a Docker image that runs a Python "Hello World" web server (Flask) and run it on your machine.

---

## 🛠️ Step 1: Create the Project Files
Create a new folder named `docker-project` and add these files inside it.

### File 1: `app.py`
A simple web server that says "Hello from Docker!".

```python
from flask import Flask
import os

app = Flask(__name__)

@app.route('/')
def hello():
    return "Hello from Docker! My hostname is: " + os.uname().nodename

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
```

### File 2: `requirements.txt`
List of dependencies for our app.

```text
flask
```

---

## 🐳 Step 2: Create the Dockerfile
This file tells Docker how to build the image. Create a file named `Dockerfile` (no extension).

```dockerfile
# 1. Start from a small python base image
FROM python:3.9-slim

# 2. Set the working directory inside the container
WORKDIR /app

# 3. Copy requirements first (for caching)
COPY requirements.txt .

# 4. Install dependencies
RUN pip install -r requirements.txt

# 5. Copy the rest of the application code
COPY . .

# 6. Expose the port the app runs on
EXPOSE 5000

# 7. Define the command to run the app
CMD ["python", "app.py"]
```

---

## 🏗️ Step 3: Build the Image
Open your terminal in the folder where you created the files and run:

```bash
docker build -t my-python-app .
```
- `-t my-python-app`: Names the image "my-python-app".
- `.`: Tells Docker to look for the Dockerfile in the *current directory*.

---

## 🏃 Step 4: Run the Container
Now that the image is built, let's run it.

```bash
docker run -p 5000:5000 my-python-app
```
- `-p 5000:5000`: Maps port 5000 on your machine (localhost) to port 5000 inside the container.

**Verify it works**: Open your browser and go to `http://localhost:5000`. You should see "Hello from Docker!".

---

## 🧹 Step 5: Clean Up
To stop the container, press `Ctrl+C` in the terminal.
To remove the image (if you want to save space):
```bash
docker rmi my-python-app
```

## 🎉 Congratulations!
You have successfully containerized an application. You can now ship this image to any computer with Docker, and it will run exactly the same way.
