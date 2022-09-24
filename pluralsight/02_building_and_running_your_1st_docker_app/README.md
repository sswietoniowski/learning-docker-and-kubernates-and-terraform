# Building and Running Your First Docker App

1st steps with building & running apps on Docker :-).

## Create an Application Image

You can read contents of "node.dockerfile" file and my comments inside.

To create an image we can use:

```cmd
docker build -t nodeapp:1.0.0 -f node.dockerfile .
```

Option "-t" is for tagging the image with a name and a version.

We can use registry name as part of the image name. For example:

```cmd
docker build -t sswietoniowski/nodeapp:1.0.0 -f node.dockerfile .
```

Last part of the image name is version. We can use any versioning scheme we want.

While pushing the image to the registry we should consider using 2FA (2 Factor Authentication).
If so, we might need to use `docker login` command to login to the registry, and create an
access token for the image push.

Instead of using CLI we might use VSC extension for Docker, it has a nice feature of pushing images to the registry.

## Run an Application Container

To retrieve the image from the registry we can use:

```cmd
docker pull sswietoniowski/nodeapp:1.0.0
```

To run the container we can use:

```cmd
docker run -d -p 3000:3000 --name nodeapp sswietoniowski/nodeapp:1.0.0
```

Option "-d" is for running the container in the background.

Option "-p" is for mapping the port 3000 on the host to the port 3000 on the container.

Option "--name" is for naming the container.

To show container logs we can use:

```cmd
docker logs nodeapp
```

To stop the container we can use:

```cmd
docker stop nodeapp
```

To remove the container we can use:

```cmd
docker rm nodeapp
```

To remove the image we can use:

```cmd
docker rmi sswietoniowski/nodeapp:1.0.0
```

To store some data permanently we can use volumes. We can create a volume with:

```cmd
docker volume create nodeapp
```

To run the container with a volume we can use:

```cmd
docker run -d -p 3000:3000 --name nodeapp -v nodeapp:/app/data sswietoniowski/nodeapp:1.0.0
```

## Communicate between multiple Containers

To create a bridge network we can use:

```cmd
docker network create nodeapp
```

To list available networks we can use:

```cmd
docker network ls
```

To remove a network we can use:

```cmd
docker network rm nodeapp
```

To run the container with a network we can use:

```cmd
docker run -d -p 3000:3000 --name nodeapp --network nodeapp sswietoniowski/nodeapp:1.0.0
```

To run the container with a network and a volume we can use:

```cmd
docker run -d -p 3000:3000 --name nodeapp --network nodeapp -v nodeapp:/app/data sswietoniowski/nodeapp:1.0.0
```

To connect to the container we can use:

```cmd
docker exec -it nodeapp bash
```

To show container IP address we can use:

```cmd
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' nodeapp
```

To show container IP address and port we can use:

```cmd
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}:{{(index (index .NetworkSettings.Ports "3000/tcp") 0).HostPort}}' nodeapp
```

To show container IP address and port for all containers we can use:

```cmd
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}:{{(index (index .NetworkSettings.Ports "3000/tcp") 0).HostPort}}' $(docker ps -aq)
```

To work with multiple containers we can use docker-compose. We can create a docker-compose.yml file and my comments inside should help you understand what is going on.

To build the containers we can use:

```cmd
docker-compose build
```

To run the containers we can use:

```cmd
docker-compose up -d
```

To stop the containers we can use:

```cmd
docker-compose down
```

To remove the containers we can use:

```cmd
docker-compose rm
```
