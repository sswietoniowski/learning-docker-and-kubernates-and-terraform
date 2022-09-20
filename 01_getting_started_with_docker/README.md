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
