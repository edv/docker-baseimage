FROM alpine:3.9
MAINTAINER Erik de Vries <docker@erikdevries.nl>

# root filesystem
COPY rootfs /

# base image packages
RUN apk -U update && \
    apk -U upgrade && \
    apk -U add --no-cache \
        bash \
        coreutils \
        ca-certificates \
        shadow \
        curl

# s6 overlay
RUN curl -L https://github.com/just-containers/s6-overlay/releases/download/v1.21.8.0/s6-overlay-amd64.tar.gz \
    | tar -xzC /

# create default user / group and folders
RUN groupadd -g 1000 abc && \
    useradd -u 1000 -g abc -d /app -s /bin/false abc && \
    mkdir -p \
	    /app \
	    /config

ENTRYPOINT ["/init"]