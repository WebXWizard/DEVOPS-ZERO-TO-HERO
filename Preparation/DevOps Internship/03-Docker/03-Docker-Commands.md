# Essential Docker Commands

## Lifecycle
```bash
docker run <image>           # Run container (pulls if needed)
docker run -d <image>        # Run in background (detached)
docker run -p 80:80 <image>  # Map host:container ports
docker start <id>            # Start stopped container
docker stop <id>             # Stop running container
docker restart <id>          # Restart container
docker rm <id>               # Remove container (must stop first)
docker rm -f <id>            # Force remove
```

## Images
```bash
docker build -t <name> .     # Build image from Dockerfile
docker images                # List local images
docker pull <image>          # Download image
docker push <image>          # Upload image
docker rmi <id>              # Remove image
docker tag <id> <new>        # Tag image
```

## Info & Logs
```bash
docker ps                    # List running containers
docker ps -a                 # List all containers
docker logs <id>             # View logs
docker logs -f <id>          # Follow log output
docker inspect <id>          # Detailed JSON info
docker stats                 # live resource usage stats
```

## Interaction
```bash
docker exec -it <id> bash    # Enter container shell
docker exec -it <id> sh      # Enter shell (alpine)
```

## Volumes & Network
```bash
docker volume create <name>  # Create volume
docker volume ls             # List volumes
docker network create <net>  # Create network
docker network ls            # List networks
```

## System Cleanup
```bash
docker system prune          # Remove unused data
docker system prune -a       # Remote everything unused
```
