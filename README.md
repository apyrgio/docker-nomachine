# Run NoMachine's client in a container

Download and install NoMachine's proprietary code in a Debian 11 container. You
can then mount your X11 socket in that container and run the NoMachine client,
if you want to connect to a NoMachine server.

First, build the container image. The following instructions work for Docker and
Podman alike:

```bash
git clone https://github.com/apyrgio/docker-nomachine
cd docker-nomachine/
docker build -f Dockerfile -t nx
```

Then, run the NoMachine client (`nxplayer`) in the container.

```bash
docker run --rm -e DISPLAY=${DISPLAY?} -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
    -e XAUTHORITY=${XAUTHORITY?} -v ${XAUTHORITY?}:${XAUTHORITY}  \ # Remove if no XAUTHORITY file
    nx /usr/NX/bin/nxplayer
```

Caveats:
* For compatibility reasons, in Wayland systems this will use XWayland (less
  secure)
* The configuration is amnesiac, meaning that connections are lost after the
  container exits.
* Rebuilding the container image always pulls the .deb file, in order to verify
  that the step is cached.
