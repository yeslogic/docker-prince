DOCKER?=docker
PRINCE_VERSION?=15.2

all: debian debian-slim

debian: debian-9 debian-10 debian-11

debian-slim: debian-9-slim debian-10-slim debian-11-slim

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

debian-9: Dockerfile.debian
	$(DOCKER) build \
	  -f $< \
	  -t yeslogic/prince:$(PRINCE_VERSION)-$@ \
	  --build-arg PRINCE_VERSION=$(PRINCE_VERSION) \
	  --build-arg DEBIAN_VERSION=9 \
	  --build-arg BASE_IMAGE=9 \
	  .

debian-11-slim: Dockerfile.debian
	$(DOCKER) build \
	  -f $< \
	  -t yeslogic/prince:latest \
	  -t yeslogic/prince:$(PRINCE_VERSION) \
	  -t yeslogic/prince:$(PRINCE_VERSION)-$@ \
	  --build-arg PRINCE_VERSION=$(PRINCE_VERSION) \
	  --build-arg DEBIAN_VERSION=11 \
	  --build-arg BASE_IMAGE=11-slim \
	  .

debian-10-slim: Dockerfile.debian
	$(DOCKER) build \
	  -f $< \
	  -t yeslogic/prince:$(PRINCE_VERSION) \
	  -t yeslogic/prince:$(PRINCE_VERSION)-$@ \
	  --build-arg PRINCE_VERSION=$(PRINCE_VERSION) \
	  --build-arg DEBIAN_VERSION=10 \
	  --build-arg BASE_IMAGE=10-slim \
	  .

debian-9-slim: Dockerfile.debian
	$(DOCKER) build \
	  -f $< \
	  -t yeslogic/prince:$(PRINCE_VERSION)-$@ \
	  --build-arg PRINCE_VERSION=$(PRINCE_VERSION) \
	  --build-arg DEBIAN_VERSION=9 \
	  --build-arg BASE_IMAGE=9-slim \
	  .

dockerhub: all
	$(DOCKER) push yeslogic/prince:latest
	$(DOCKER) push yeslogic/prince:$(PRINCE_VERSION)
	$(DOCKER) push yeslogic/prince:$(PRINCE_VERSION)-debian-11
	$(DOCKER) push yeslogic/prince:$(PRINCE_VERSION)-debian-10
	$(DOCKER) push yeslogic/prince:$(PRINCE_VERSION)-debian-9
	$(DOCKER) push yeslogic/prince:$(PRINCE_VERSION)-debian-11-slim
	$(DOCKER) push yeslogic/prince:$(PRINCE_VERSION)-debian-10-slim
	$(DOCKER) push yeslogic/prince:$(PRINCE_VERSION)-debian-9-slim
