.PHONY: build
build:
	mkdir -p tmp
	pushd tmp && \
	curl -L -o qemu-arm-static.tar.gz https://github.com/multiarch/qemu-user-static/releases/download/v5.0.0-2/qemu-arm-static.tar.gz && \
	tar xzf qemu-arm-static.tar.gz && \
	popd
	docker run --rm --privileged multiarch/qemu-user-static:register --reset
	docker build -f ./arm/Dockerfile -t rpi-baseimage .
	docker build -f ./x86/Dockerfile -t baseimage .

.PHONY: test
test:
	docker run --rm -t rpi-baseimage uname -m
	docker run --rm -t baseimage uname -m