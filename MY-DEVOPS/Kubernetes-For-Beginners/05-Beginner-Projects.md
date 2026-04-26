# 05 Beginner Projects

Let's get hands-on! Ensure your cluster is running (`minikube start` or `kind create cluster`).

## Project 1: Deploy Nginx (The Hello World of K8s)
**Goal**: Launch an Nginx web server using a Pod.

1.  **Create a YAML file** named `nginx-pod.yaml`:
    ```yaml
    apiVersion: v1
    kind: Pod
    metadata:
      name: my-nginx
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:latest
        ports:
        - containerPort: 80
    ```
2.  **Apply it**:
    ```bash
    kubectl apply -f nginx-pod.yaml
    ```
3.  **Verify**:
    ```bash
    kubectl get pods
    ```
    Wait until status is `Running`.

---

## Project 2: Deployment and Scaling
**Goal**: Run 3 copies of Nginx and handle a restart.

1.  **Create `nginx-deployment.yaml`**:
    ```yaml
    apiVersion: apps/v1
    kind: Deployment
    metadata:
      name: nginx-deploy
    spec:
      replicas: 3
      selector:
        matchLabels:
          app: web
      template:
        metadata:
          labels:
            app: web
        spec:
          containers:
          - name: nginx
            image: nginx:latest
    ```
2.  **Apply**: `kubectl apply -f nginx-deployment.yaml`
3.  **Check Pods**: `kubectl get pods`. You should see 3 pods named `nginx-deploy-xxxx`.
4.  **Scale Up**:
    Change `replicas: 3` to `replicas: 5` in the file.
    Run `kubectl apply -f nginx-deployment.yaml` again.
    Watch new pods appear!

---

## Project 3: Expose Application (Service)
**Goal**: Access the Nginx server from your browser.

1.  **Create `nginx-service.yaml`**:
    ```yaml
    apiVersion: v1
    kind: Service
    metadata:
      name: nginx-service
    spec:
      selector:
        app: web
      type: NodePort
      ports:
        - port: 80
          targetPort: 80
          nodePort: 30005
    ```
    *Note: `app: web` must match the label in Project 2.*

2.  **Apply**: `kubectl apply -f nginx-service.yaml`

3.  **Access**:
    - **Minikube**: Run `minikube service nginx-service`. It will open the URL.
    - **Kind/Other**: Access `http://localhost:30005` (might require port forwarding: `kubectl port-forward service/nginx-service 30005:80`).

---
## What's Next?
- Learn **Helm** (The Package Manager for Kubernetes).
- Try **Imperative Commands** (e.g., `kubectl run nginx --image=nginx`).
- Explore **Ingress Controllers** for advanced routing.
