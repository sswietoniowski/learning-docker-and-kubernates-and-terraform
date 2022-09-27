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

## Orchestrating Containers with Docker Compose

## Additional Docker Compose Features
