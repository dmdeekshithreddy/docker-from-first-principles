1. We cannot run two containers with the same name. Below error will be thrown

   ```log
   docker: Error response from daemon: Conflict. The container name "/my_nginx_latest" is already in use by container "36c7533ad8ae960acf579534af9de9223067628bdfeeb9f5d94f274c6f3441d9". You have to remove (or rename) that container to be able to reuse that name.
   ```

---

2. Running `docker start` command multiple times on a running container will not have any effect. No warning or info message is thrown.

---

3. You cannot remove running container

   ```log
   $ docker rm my_nginx_latest
   Error response from daemon: cannot remove container "/my_nginx_latest": container is running: stop the container before removing or force remove
   ```

---

4. You cannot remove an image if there are containers (running or stopped) using it.

   ```log
    $ docker rmi nginx
    Error response from daemon: conflict: unable to remove repository reference "nginx" (must force) - container 36c7533ad8ae is using its referenced image 9e4696c649b1
   ```

---

5. Docker container stopped automatically
