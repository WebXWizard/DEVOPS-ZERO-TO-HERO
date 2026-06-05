# Docker Volumes

## Why Volumes?

Containers are temporary.

Volumes store persistent data.

## Commands

docker volume create myvolume

docker volume ls

docker volume inspect myvolume

## Example

docker run -v myvolume:/data nginx

## Interview Questions

Difference between Volume and Bind Mount?