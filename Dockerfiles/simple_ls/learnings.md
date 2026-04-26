## Dockerfile

```dockefile
FROM ubuntu:latest

CMD ["ls", "-l", "/"]
```

## Build image using Dockerfile

```bash
docker build -t simple_ls:latest ~/GitHub/devops/docker-from-first-principles/Dockerfiles/simple_ls
```

If you run the container in detached mode, you will be able to see the output using `docker logs` command

```bash
docker run -d --name simple_ls_container simple_ls:latest
docker logs simple_ls:latest
```

If you run the container in interactive mode, you will be able to see the output in the current terminal window

```bash
docker run -it simple_ls:latest
```
