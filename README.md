# Docker base image

[![Build Status](https://travis-ci.org/edv/docker-baseimage.svg?branch=master)](https://travis-ci.org/edv/docker-baseimage)

Based on Alpine with the S6 overlay to be able to run processes with custom UID (user id) and GID (group id). This prevents all kinds of problems with external mountpoints and incorrect user permissions.

This setup is based on the fine work done by `linuxserver.io`

## Quick setup

This image should be used as the base image for new custom images. See `https://github.com/just-containers/s6-overlay` for more information about the S6 overlay system.

## Use as base image

```
FROM erikdevries/baseimage:latest
```

With this base image you get a system that includes Alpine Linux with S6 overlay installed. A single script is installed with this base image, namely to create a custom user (abc with UID = 1000) and group (abc with GID = 1000).

Provide the following environment variables when starting a container to modify the user id and/or group id:
* `PUID` to modify the UID (1000 by default)
* `PGID` to modify the GID (1000 by default)

To find out the UID and GID for the user running Docker, run the following command;

```
  $ id <dockeruser>
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```