It stopped because /bin/bash started, found no interactive terminal/input attached, and exited immediately.

Your command:

```bash
docker run -d --name my_ubuntu_container ubuntu:latest /bin/bash
```

means:

```text
Run Ubuntu container in background
Name it my_ubuntu_container
Start /bin/bash
```

But bash is an interactive shell. In detached mode, there is no terminal for you to type into, so bash exits. Once the main process exits, the container stops.

## Core rule

A Docker container keeps running only as long as its main process keeps running.

In this case:

```text
Container starts
↓
/bin/bash starts
↓
No interactive input
↓
bash exits
↓
container stops
```

## Correct way to run Ubuntu interactively

Use:

```bash
docker run -it --name my_ubuntu_container ubuntu:latest /bin/bash
```

Here:

```text
-i = keep standard input open
-t = allocate a terminal
```

Now you can work inside Ubuntu.

## If you want Ubuntu to run in background

Use a long-running command:

```bash
docker run -d --name my_ubuntu_container ubuntu:latest sleep infinity
```

Then enter it using:

```bash
docker exec -it my_ubuntu_container /bin/bash
```

## Teaching sentence

Ubuntu containers stop immediately when started with only /bin/bash in detached mode because bash needs an interactive terminal. Since there is no input attached, the shell exits, and Docker stops the container because the container’s main process has ended.
