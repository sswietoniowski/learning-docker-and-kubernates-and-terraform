# Getting Started with Docker

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
docker container ls
```

Stop container:

```cmd
docker stop pgs-first-container
```

Kill container:

```cmd
docker kill pgs-first-container
```

Remove container:

```cmd
docker rm pgs-first-container
```
