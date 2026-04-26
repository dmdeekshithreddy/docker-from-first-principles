
# 1. Check Docker version
docker version

# 2. Check if Docker is working
docker run hello-world

# 3. List available Docker images
docker image ls

# 4. List all running containers
docker container ls 
## or
docker ps

# 5. Pull an image from Docker Hub
docker pull ubuntu:latest

# 6. Run a container in interactive mode
docker run -it ubuntu:latest /bin/bash

# 7. List all containers (both running and stopped)
docker container ls -a
## or
docker ps -a

# 8. Run a container in detached mode; 

## Without detached mode
## The container runs in the foreground, and your terminal stays attached to the container logs.
## You will see nginx logs directly in the terminal, and the terminal is “occupied.”

## -d flag is for detached mode, 
## --name is to give a name to the container, 
docker run -d --name my_nginx_container nginx:latest


## tail -f /dev/null is to keep the container running
docker run -d --name my_ubuntu_container ubuntu:latest tail -f /dev/null

# run container with port mapping
## This command runs an nginx container in detached mode, names it "my_nginx_container", 
## and maps port 8080 on the host to port 80 in the container. 
## This allows you to access the nginx server running inside the container by navigating to http://localhost:8080 in your web browser.
docker run -d --name my_nginx_container -p 8080:80 nginx:latest


# 9. Stop a running container
docker stop <container_id_or_name>
docker stop my_nginx_container

# 10. Start a stopped container
docker start <container_id_or_name>


# 11. Remove a container
docker container rm <container_id_or_name>
docker container rm my_nginx_container
## or
docker rm <container_id_or_name>
docker rm my_nginx_container

# 12. Remove an image
docker image rm <image_id_or_name>
docker image rm nginx:latest
## or 
docker rmi <image_id_or_name>
docker rmi nginx:latest


# 13. View logs of a container
docker logs <container_id_or_name>
docker logs my_nginx_container


# 14. Execute a command inside a running container
docker run -d --name my_ubuntu_container ubuntu:latest /bin/bash # This command runs an Ubuntu container in detached mode and starts a bash shell.
docker exec -it <container_id_or_name> <command>
docker exec -it my_ubuntu_container ls /


# 15. Build image from a Dockerfile
docker build -t <image_name>:<tag> <path_to_parent_dir_of_dockerfile>
docker build -t simple_ls:latest ~/GitHub/devops/docker-from-first-principles/Dockerfiles/simple_ls







