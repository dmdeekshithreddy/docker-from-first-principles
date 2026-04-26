# Connecting Basic Docker Commands to Dockerfile

So far, we have learned how to run containers using ready-made Docker images.
For example:

```bash
docker run -it ubuntu bash
docker run -d -p 8080:80 nginx
```

These images are already available on Docker Hub.

---

## Why Do We Need a Dockerfile?

In real projects, we usually do not want to manually install dependencies every time inside a container.

For example, inside an Ubuntu container, we may manually run:

```bash
apt update
apt install python3 -y
mkdir /app
cd /app
```

This works for learning, but it is not repeatable.

If another student, developer, or server wants the same setup, they must repeat all commands manually.

That is not a good practice.

---

## What Is a Dockerfile?

A Dockerfile is a text file that contains step-by-step instructions to build our own Docker image.

Simple definition:

A Dockerfile is a recipe for creating a Docker image.

---

## Basic Idea

```text
Manual Docker commands → temporary container setup

Dockerfile → permanent image-building instructions
```

---

## Example Dockerfile

Create a file named:

```text
Dockerfile
```

Important:

A Dockerfile usually has no file extension. The standard file name is simply `Dockerfile`.

Example content:

```text
FROM ubuntu:latest
RUN apt update
RUN apt install python3 -y
WORKDIR /app
CMD ["bash"]
```

---

## Explanation of the Dockerfile

### 1. FROM

```dockerfile
FROM ubuntu:latest
```

This means:

> Start building our image from the Ubuntu base image.

---

### 2. RUN

```dockerfile
RUN apt update
RUN apt install python3 -y
```

This means:

> Run these commands while building the image.

Here, we are updating package information and installing Python.

---

### 3. WORKDIR

```dockerfile
WORKDIR /app
```

This means:

> Set /app as the working directory inside the container.

If /app does not exist, Docker creates it automatically.

---

### 4. CMD

```dockerfile
CMD ["bash"]
```

This means:

> When a container starts from this image, run bash by default.

---

## Build the Docker Image

After creating the Dockerfile, build the image using:

```bash
docker build -t my-ubuntu-python .
```

Explanation:

| Part                  | Meaning                                        |
| --------------------- | ---------------------------------------------- |
| `docker build`        | Build a Docker image                           |
| `-t my-ubuntu-python` | Give the image a name/tag                      |
| `.`                   | Use the current directory as the build context |

---

### Check the Image

```bash
docker image ls
```

You should see an image like:

```text
REPOSITORY TAG IMAGE ID CREATED SIZE
my-ubuntu-python latest abc123... few seconds ago ...
```

---

### Run a Container from Our Custom Image

```bash
docker run -it my-ubuntu-python
```

Now you are inside a container created from your own image.

Try:

```bash
python3 --version
pwd
```

Expected idea:

```text
Python is already installed
Current directory is /app
```

---

### Full Flow

```text
Write Dockerfile
↓
Build Docker image
↓
Run Docker container
```

---

### Important Point

Until now, we used Docker images created by others, such as:

```text
ubuntu
nginx
hello-world
```

With a Dockerfile, we create our own image with:

- required operating system base
- required software
- required dependencies
- required application files
- required startup command

---

## Final Student-Friendly Summary

After learning how to run containers from existing images, the next step is to learn how to create our own images using a Dockerfile.

A Dockerfile allows us to define all setup steps once, build an image from it, and run containers consistently on any machine that has Docker.
