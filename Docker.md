# Docker

This document assumes basic knowledge of the [Docker](https://www.docker.com) container runtime environment.

## Building and Publishing

### Building the Arricor TensorFlow Image

To build a new version of the Arricor TensorFlow Image, change into the directory where the `Dockerfile` is located and execute the following:

```bash
$ docker build -t arricor/tensorflow:<new-tag>
```

Typically you will use the same tag as the underlying TensorFlow image, e.g., 1.12.0-gpu-py3 for TensorFlow version 1.12.0 with GPU support and a Python3 runtime.

### Publishing Images to Docker Hub

To publish an image or tag to Docker Hub, on the machine where you have built the image, execute the following:

```bash
$ docker push arricor/tensorflow:<tag>
```

## Docker Operations

Below are several useful commands to control the Docker containers running on your system. For a complete list, see [the official Docker documentation](https://docs.docker.com/).

- List running containers:
  ```bash
  $ docker ps
  ```
- List all containers, including those which are stopped:
  ```bash
  $ docker ps -a
  ```
- Get configuration information for an existing containers:
  ```bash
  $ docker inspect [container_id|container_name]
  ```
- Stop a running container:
  ```bash
  $ docker stop [container_id|container_name]
  ```
- Show all locally pulled docker images:
  ```bash
  $ docker images
  ```
- Remove a (stopped) docker container:
  ```bash
  $ docker rm [container_id|container_name]
  ```
- Remove a docker image:
  ```bash
  $ docker rmi [image_id|image_name:tag_name]
  ```
- Start an ephemeral container and drop into a shell:
  ```bash
  $ docker run --runtime=nvidia -it --rm arricor/tensorflow:1.12.0-gpu-py3 bash
  ```
