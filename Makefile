DOCKER?=docker
DOCKER_DEFAULT_PLATFORM?=linux/amd64
PRINCE_VERSION?=15.3

export DOCKER_DEFAULT_PLATFORM

all: debian debian-slim

debian: debian-10 debian-11 debian-12

debian-slim: debian-10-slim debian-11-slim debian-12-slim

debian-12: Dockerfile.debian
	$(DOCKER) build \
	  -f $< \
	  -t yeslogic/prince:$(PRINCE_VERSION)-$@ \
	  --build-arg PRINCE_VERSION=$(PRINCE_VERSION) \
	  --build-arg DEBIAN_VERSION=12 \
	  --build-arg BASE_IMAGE=12 \
	  .

debian-11: Dockerfile.debian
	$(DOCKER) build \
	  -f $< \
	  -t yeslogic/prince:$(PRINCE_VERSION)-$@ \
	  --build-arg PRINCE_VERSION=$(PRINCE_VERSION) \
	  --build-arg DEBIAN_VERSION=11 \
	  --build-arg BASE_IMAGE=11 \
	  .

debian-10: Dockerfile.debian
	$(DOCKER) build \
	  -f $< \
	  -t yeslogic/prince:$(PRINCE_VERSION)-$@ \
	  --build-arg PRINCE_VERSION=$(PRINCE_VERSION) \
	  --build-arg DEBIAN_VERSION=10 \
	  --build-arg BASE_IMAGE=10 \
	  .

debian-12-slim: Dockerfile.debian
	$(DOCKER) build \
	  -f $< \
	  -t yeslogic/prince:latest \
	  -t yeslogic/prince:$(PRINCE_VERSION) \
	  -t yeslogic/prince:$(PRINCE_VERSION)-$@ \
	  --build-arg PRINCE_VERSION=$(PRINCE_VERSION) \
	  --build-arg DEBIAN_VERSION=12 \
	  --build-arg BASE_IMAGE=12-slim \
	  .

debian-11-slim: Dockerfile.debian
	$(DOCKER) build \
	  -f $< \
	  -t yeslogic/prince:$(PRINCE_VERSION)-$@ \
	  --build-arg PRINCE_VERSION=$(PRINCE_VERSION) \
	  --build-arg DEBIAN_VERSION=11 \
	  --build-arg BASE_IMAGE=11-slim \
	  .

debian-10-slim: Dockerfile.debian
	$(DOCKER) build \
	  -f $< \
	  -t yeslogic/prince:$(PRINCE_VERSION)-$@ \
	  --build-arg PRINCE_VERSION=$(PRINCE_VERSION) \
	  --build-arg DEBIAN_VERSION=10 \
	  --build-arg BASE_IMAGE=10-slim \
	  .

dockerhub: all
	$(DOCKER) push yeslogic/prince:latest
	$(DOCKER) push yeslogic/prince:$(PRINCE_VERSION)
	$(DOCKER) push yeslogic/prince:$(PRINCE_VERSION)-debian-12
	$(DOCKER) push yeslogic/prince:$(PRINCE_VERSION)-debian-11
	$(DOCKER) push yeslogic/prince:$(PRINCE_VERSION)-debian-10
	$(DOCKER) push yeslogic/prince:$(PRINCE_VERSION)-debian-12-slim
	$(DOCKER) push yeslogic/prince:$(PRINCE_VERSION)-debian-11-slim
	$(DOCKER) push yeslogic/prince:$(PRINCE_VERSION)-debian-10-slim
