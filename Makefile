.PHONY: build invoke start-api

build:
	./samw build

invoke: build
	./samw local invoke HelloWorldFunction \
	--docker-volume-basedir "${PWD}"/.aws-sam/build \
	--container-host host.docker.internal

start-api: build
	./samw local start-api \
	--docker-volume-basedir "${PWD}"/.aws-sam/build \
	--container-host host.docker.internal \
	--host 0.0.0.0
