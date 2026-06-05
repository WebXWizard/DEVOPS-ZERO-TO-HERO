# Docker Compose

## What is Docker Compose?

Tool for running multi-container applications.

## Example

version: '3'

services:
  app:
    image: node

  mongo:
    image: mongo

## Commands

docker compose up

docker compose down

docker compose ps

## Interview Questions

Why Docker Compose?

Difference between Docker and Docker Compose?