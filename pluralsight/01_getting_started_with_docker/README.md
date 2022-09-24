# Getting Started with Docker

Gentle introduction to Docker :-).

## Basic Commands

Check version:

```cmd
docker --version
```

Get help:

```cmd
docker [COMMAND] --help
```

Get info:

```cmd
docker info
```

Build an image (if you've got an error try to read [this](https://www.baeldung.com/ops/docker-build-argument-error) article):

```cmd
docker build -f Dockerfile -t sswietoniowski/pgs-first-container --no-cache .
```

Show images:

```cmd
docker image ls
```

or

```cmd
docker images
```

Push image to the Docker Hub:

```cmd
docker push sswietoniowski/pgs-first-container
```

Run container:

```cmd
docker run -d -p 8080:8080 --name pgs-first-container sswietoniowski/pgs-first-container
```

Show running containers:

```cmd
docker ps
```

or

```cmd
docker container ls -a
```

Stop container:

```cmd
docker stop pgs-first-container
```

Start container:

```cmd
docker start pgs-first-container
```

Kill container:

```cmd
docker kill pgs-first-container
```

Remove container:

```cmd
docker rm pgs-first-container
```

Check Docker Composer version:

```cmd
docker-compose --version
```

Build Compose file:

```cmd
docker-compose build
```

Run Compose file:

```cmd
docker-compose up -d
```

Stop Compose file:

```cmd
docker-compose down
```

Remove Compose file:

```cmd
docker-compose rm
```

Build and run Swarm:

```cmd
docker swarm init
```

Join Swarm:

```cmd
docker swarm join --token [TOKEN] [IP]:2377
```

Leave Swarm:

```cmd
docker swarm leave --force
```

List Swarm nodes:

```cmd
docker node ls
```

Deploy stack:

```cmd
docker stack deploy -c docker-compose.yml pgs-first-container
```

Remove stack:

```cmd
docker stack rm pgs-first-container
```
