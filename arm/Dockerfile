FROM arm32v6/alpine:3.7
MAINTAINER Erik de Vries <docker@erikdevries.nl>

# qemu arm static binary
COPY ./arm/qemu-arm-static /usr/bin/qemu-arm-static

# root filesystem
COPY rootfs /

# s6 overlay
ADD https://github.com/just-containers/s6-overlay/releases/download/v1.21.4.0/s6-overlay-armhf.tar.gz /tmp/
RUN tar xzf /tmp/s6-overlay-armhf.tar.gz -C / && \
    rm /tmp/s6-overlay-armhf.tar.gz

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