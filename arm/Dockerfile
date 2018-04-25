FROM arm32v6/alpine:3.7
MAINTAINER Erik de Vries <docker@erikdevries.nl>

# qemu arm static binary
ADD https://github.com/multiarch/qemu-user-static/releases/download/v2.11.0/qemu-arm-static.tar.gz /tmp/
RUN tar xzf /tmp/qemu-arm-static.tar.gz -C /usr/bin/

# root filesystem
COPY rootfs /

# s6 overlay
ADD https://github.com/just-containers/s6-overlay/releases/download/v1.21.4.0/s6-overlay-armhf.tar.gz /tmp/
RUN tar xzf /tmp/s6-overlay-armhf.tar.gz -C /

# base image packages
RUN apk -U update && \
    apk -U upgrade && \
    apk -U add --no-cache \
        bash \
        coreutils \
        ca-certificates \
        shadow

# create default user / group and folders
RUN groupadd -g 1000 abc && \
    useradd -u 1000 -g abc -d /app -s /bin/false abc && \
    mkdir -p \
	    /app \
	    /config

ENTRYPOINT ["/init"]