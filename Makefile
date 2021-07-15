.PHONY: build
build:
	mkdir -p tmp
	curl -L -o tmp/qemu-arm-static.tar.gz https://github.com/multiarch/qemu-user-static/releases/download/v5.2.0-2/qemu-arm-static.tar.gz
	tar -C ./tmp -xzf tmp/qemu-arm-static.tar.gz
	docker run --rm --privileged multiarch/qemu-user-static:register --reset
	docker build -f ./arm/Dockerfile --build-arg ARCH=arm32v6/ -t erikdevries/rpi-baseimage .
	docker build -f ./x86/Dockerfile --build-arg ARCH=amd64/ -t erikdevries/baseimage .
	rm -rf ./tmp

.PHONY: test
test:
	docker run --rm -t erikdevries/rpi-baseimage uname -m
	docker run --rm -t erikdevries/baseimage uname -m