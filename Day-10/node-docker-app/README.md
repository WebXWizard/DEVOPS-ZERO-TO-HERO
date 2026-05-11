# Day 10 - Node.js Docker App

This project recreates the Dockerfile screenshot as a working Node.js and Express application.

## Project Structure

```text
node-docker-app/
|-- app.js
|-- package.json
|-- Dockerfile
|-- .dockerignore
`-- README.md
```

## Run Locally

Install dependencies:

```bash
npm install
```

Start the app:

```bash
npm start
```

Open the app:

```text
http://localhost:3000
```

## Build Docker Image

```bash
docker build -t node-app .
```

## Run Docker Container

```bash
docker run -d -p 3000:3000 --name node-docker-app node-app
```

## Check Container

```bash
docker ps
docker logs node-docker-app
```

## Stop and Remove Container

```bash
docker stop node-docker-app
docker rm node-docker-app
```
