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

## Additional Docker Compose Features
