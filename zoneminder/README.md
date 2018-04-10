ZoneMinder
==========

All documentation for ZoneMinder is now online at https://zoneminder.readthedocs.org

## Overview

ZoneMinder is an integrated set of applications which provide a complete surveillance solution allowing capture, analysis, recording and monitoring of any CCTV or security cameras attached to a Linux based machine. It is designed to run on distributions which support the Video For Linux (V4L) interface and has been tested with video cameras attached to BTTV cards, various USB cameras and also supports most IP network cameras. 

This is a docker container which builds ZoneMinder from master branch (bleeding edge) and using Ubuntu Xenial as distribution.

Build the container

    docker build --rm -t floppe/zoneminder .

Example how to run the container with an external database.

    docker run -d -t -P \
      --shm-size 1G \
      -e TZ='Europe/Helsinki' \
      -e ZM_DB_user='zmuser' \
      -e ZM_DB_PASS='zmpassword' \
      -e ZM_DB_NAME='zoneminder_database' \
      -e ZM_DB_HOST='my_central_db_server' \
      -v /disk/zoneminder/events:/var/lib/zoneminder/events \
      -v /disk/zoneminder/images:/var/lib/zoneminder/images \
      -v /disk/zoneminder/logs:/var/log/zm \
      --name zoneminder \
      floppe/zoneminder

## Roadmap

* Replace Apache with nginx
* Switch base image to Alpine

