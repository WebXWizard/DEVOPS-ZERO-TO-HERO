# Project: Containerized Web App with CI/CD

**Goal**: Take a simple Python application, dockerize it, and deploy it to Kubernetes.

## Prerequisites
- Docker Installed.
- Minikube or Kind (Local K8s).
- GitHub Account.

## Step 1: The Application
Create a folder `flask-app`. Inside, create `app.py`:
```python
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello():
    return "Hello from Kubernetes!"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
```
Create `requirements.txt`:
```
flask
```

## Step 2: Dockerize It
Create a `Dockerfile`:
```dockerfile
FROM python:3.9-slim
WORKDIR /app
COPY . .
RUN pip install -r requirements.txt
CMD ["python", "app.py"]
```

## Step 3: Build & Push
1.  Build: `docker build -t <your-username>/flask-app:v1 .`
2.  Test: `docker run -p 5000:5000 <your-username>/flask-app:v1`
3.  Push: `docker push <your-username>/flask-app:v1` (Requires `docker login`).

## Step 4: Deploy to Kubernetes
Create `deployment.yaml`:
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: flask-deploy
spec:
  replicas: 2
  selector:
    matchLabels:
      app: flask
  template:
    metadata:
      labels:
        app: flask
    spec:
      containers:
      - name: flask
        image: <your-username>/flask-app:v1
        ports:
        - containerPort: 5000
---
apiVersion: v1
kind: Service
metadata:
  name: flask-service
spec:
  type: NodePort
  selector:
    app: flask
  ports:
    - port: 5000
      targetPort: 5000
      nodePort: 30007
```

## Step 5: Run It
1.  `kubectl apply -f deployment.yaml`
2.  Access via `http://localhost:30007` (or `minikube service flask-service`).

## Bonus: GitHub Actions (CI)
Create `.github/workflows/docker-build.yml` in your repo to auto-build the image when you push changes.
