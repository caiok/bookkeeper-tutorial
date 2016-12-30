
VERSION := $(shell mvn org.apache.maven.plugins:maven-help-plugin:2.1.1:evaluate -Dexpression=project.version 2>/dev/null | grep -v '^\[' )
IMAGE := caiok/bookkeeper-tutorial
CONTAINER_PREFIX := bookkeeper-tutorial
CONTAINER_NUM ?= 1
CONTAINER := $(CONTAINER_PREFIX)-$(CONTAINER_NUM)

all: build
	

build-java:
	mvn clean install

build-docker:
	-docker rmi $(IMAGE):$(VERSION) $(IMAGE):latest
	cp -afv target/tutorial-$(VERSION)-jar-with-dependencies.jar docker/bookkeeper-tutorial.jar
	cd docker; docker build \
		-t $(IMAGE):$(VERSION) -t $(IMAGE):latest \
		.

build: | build-java build-docker
	

push:
	docker login
	docker push $(IMAGE):$(VERSION)
	docker push $(IMAGE):latest

run:
	docker run --rm -it \
		--name $(CONTAINER) \
		-e ZOOKEEPER_SERVERS=127.0.0.1:2181 \
		$(IMAGE):latest
