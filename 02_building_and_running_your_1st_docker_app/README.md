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

Instead of using CLI we might use VSC extension for Docker. It has a nice feature of
building images from Dockerfiles. It also has a nice feature of pushing images to the registry.

## Run an Application Container

## Communicate between multiple Containers
