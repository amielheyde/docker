#!/bin/bash
docker run --rm --name arduino -it -v ${HOME}:/home/${USER} -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY -e AUSER=${USER} -e AUID=$(id -u) -v /var/run/dbus:/var/run/dbus --entrypoint "/local-entrypoint.sh" --device=/dev/ttyUSB0 --privileged jokke/arduino
