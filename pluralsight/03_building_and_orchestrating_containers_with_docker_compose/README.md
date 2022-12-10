# Building and Orchestrating Containers with Docker Compose

More info about containers in general and Docker Compose in particular.

## Getting Started with Docker Compose

To use Docker Compose we would need to learn YAML.

### YAML

YAML is a human friendly data serialization standard for all programming languages.

YAML is a superset of JSON.

More info:

- [YAML](https://yaml.org/),
- [YAML Ain't Markup Language](https://en.wikipedia.org/wiki/YAML),
- [YAML Syntax](https://docs.ansible.com/ansible/latest/reference_appendices/YAMLSyntax.html).

YAML files are composed of maps and lists.

```yaml
# map (key-value pairs)
key: value
# list (ordered sequence of values)
- item1
- item2
# list of maps
- key1: value1
  key2: value2
# map of lists
key1:
  - item1
  - item2
# complex example
complexMap:
    key1: value1
    key2:
        subkey1: subvalue1
items:
    - item1
    - item2
itemsMap:
    - map1:
        key1: value1
        key2: value2
    - map2:
        key1: value1
        key2: value2
```

Be aware that indentation is important in YAML.

Always use spaces (preferred 2) for indentation.

Inside "NodeExpressMongoDBDockerApp" folder we have a "docker-compose.yml" (or \*.yaml) file.

You might read through this file to understand how YAML can be used to describe a Docker Compose file.

### Docker Compose

Basic commands:

```bash
# build and run containers
docker-compose up
# build and run containers in the background
docker-compose up -d
# stop containers
docker-compose stop
# stop and remove containers
docker-compose down
# list containers
docker-compose ps
# list images
docker-compose images
# list volumes
docker-compose volumes
# list networks
docker-compose networks
```

## Building Images with Docker Compose

If we need to start more than one container, we can use Docker Compose.

### Build Images with Docker Compose

To do that we can use `docker-compose build` command. An example:

```bash
docker-compose build
```

In never versions of Docker Compose we can use `docker compose build` with the same result.

Example:

```bash
docker compose build
```

Then we can use also never syntax to start and stop containers.

Example:

```bash
docker compose up
docker compose down
```

Key Docker Compose build properties:

- context: path to the build context (where Dockerfile is located),
- dockerfile: name of the Dockerfile (if not "Dockerfile"),
- args: build arguments (key-value pairs),
- image: name of the image (if not the name of the folder).

All of that can be stored inside "docker-compose.yml" file.

Example:

```yaml
version: '3.9'
services:
  web:
    image: node-express-mongo
    build:
      context: .
      dockerfile: node.dockerfile
      args:
        buildversion: 1.0.0
        NODE_VERSION: 14.17.0
        YARN_VERSION: 1.22.10
      environment:
        NODE_ENV: development
        PORT: 3000
    ports:
      - '3000:3000'
```

### Add Build Properties to a Service

A complete example of "docker-compose.yml" file can be found [here](./NodeExpressMongoDBDockerApp/docker-compose.yml).

We will use _args_ variables for things like build version, node version, yarn version, etc. anything that we might want to change during the build process.

We can use _environment_ variables for things that might change during the runtime.

### Build Multiple Images

To build multiple images we can also use "docker-compose.yml" file, good example of that can be found [here](./CodeWithDanDockerServices/docker-compose.yml).

### Push Images to Registry

To push images to registry we can do what we did before, but we can we can also use `docker compose push` command.

Example:

```bash
docker compose push
```

We can push individual services or all services.

To push and individual service we can use:

```bash
docker compose push <service_name>
```

## Orchestrating Containers with Docker Compose

Now we can use Docker Compose to orchestrate containers.

### Docker Compose Properties

Scenario:

- we have a web application that uses a database,
- or we have a web application that uses a message broker,
- or we have a web application that uses a cache,
- eventually we have a web application(-s) that are using all of the above.

How to start all of the above?

We can use Docker Compose to start all of the above.

Example:

```bash
docker compose up
```

To stop all of the above we can use:

```bash
docker compose down
```

Useful properties while running containers with Docker Compose:

- the ones we used before,
- ports: ports to expose (host:container),
- volumes: volumes to mount (host:container),
- environment: environment variables to set (key-value pairs), we can load them from a file,
- networks: networks to connect to (name of the network).

### Define Ports and Volumes

Examples of using these can be found [here](./NodeExpressMongoDBDockerApp/docker-compose.yml).

Part of YAML file with the following properties:

```yaml
ports:
  - '3000:3000'
volumes:
  - ./logs:/var/www/logs
```

Why we need volumes you might ask?

Because we want to persist data, examples:

- database data,
- logs,
- etc.

### Define Environment Variables

Syntax to use environment variables from a file can be found in the [following](./CodeWithDanDockerServices/docker-compose.yml) file.

Some examples.

YAML file with the following properties:

```yaml
environment:
  - MONGO_INITDB_ROOT_USERNAME=${MONGO_INITDB_ROOT_USERNAME}
  - MONGO_INITDB_ROOT_PASSWORD=${MONGO_INITDB_ROOT_PASSWORD}
```

or (if we want to use a file):

```yaml
env_file:
  - ./common.env
  - ./settings.env
```

If one service depends on another service we can use _depends_on_ property.

Example:

```yaml
depends_on:
  - mongo
```

### Create a Bridge Network

> Bridge networks are the default type of network in Docker.

To create a bridge network we can use:

```bash
docker network create <network_name>
```

Syntax to use inside a YAML file:

```yaml
networks:
  - <network_name>:
    driver: bridge
```

### Start and Stop Containers

To start containers we can use:

```bash
docker compose up
```

To start in the detached mode we can use:

```bash
docker compose up -d
```

We can also start individual services:

```bash
docker compose up <service_name>
```

We can also use `--no-deps` flag to not start dependencies.

Example:

```bash
docker compose up --no-deps <service_name>
```

> In this case we are not starting dependencies (we would reuse existing ones).

To stop containers we can use:

```bash
docker compose down
```

To remove containers we can use:

```bash
docker compose rm
```

### Using Docker Compose Commands

Showed during the presentation.

To see running containers we can use the following command:

```bash
docker compose ps
```

## Additional Docker Compose Features

There are some additional features that we can use with Docker Compose.

### View Container Logs

To view container logs we can use:

```bash
docker compose logs
```

and to follow logs we can use:

```bash
docker compose logs -f
```

If we want to see logs for a specific service we can use:

```bash
docker compose logs <service_name>
```

### Shell Into a Container

To shell into a container we can use:

```bash
docker compose exec <service_name> sh
```

### Scale Containers

To scale containers we can use:

```bash
docker compose up --scale <service_name>=<number_of_instances>
```

Another way to scale containers is to use `deploy` property.

Example:

```yaml
deploy:
  replicas: 3
  restart_policy:
    condition: on-failure
    delay: 5s
    max_attempts: 3
    window: 120s
```

We can't map ports when we scale containers nor use name property.

Example:

```yaml
services:
  web:
    image: nginx
    deploy:
      replicas: 3
      resources:
        limits:
          cpus: '0.1'
          memory: 50M
      restart_policy:
        condition: on-failure
    ports:
      - '80'
    networks:
      - webnet
```

In this case to connect to the container we would need to use `docker compose ps` command to get the container details and then check the port mapping.

## Summary

Now you know the basics of building and running containers with Docker Compose.
