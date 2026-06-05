# Dockerfile

## What is Dockerfile?

Instructions to build Docker Images.

## Example

FROM node:18

WORKDIR /app

COPY . .

RUN npm install

CMD ["npm","start"]

## Build Image

docker build -t app .

## Run Image

docker run -p 3000:3000 app

## Interview Questions

Difference between CMD and ENTRYPOINT?

What does COPY do?