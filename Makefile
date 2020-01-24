PRINCE_VERSION?=13.1

all:

debian-slim: debian-8-slim debian-9-slim debian-10-slim

debian-10-slim: Dockerfile.debian-slim
	docker build \
	  -f $< \
	  -t yeslogic/prince:$(PRINCE_VERSION) \
	  -t yeslogic/prince:$(PRINCE_VERSION)-$@ \
	  --build-arg PRINCE_VERSION=$(PRINCE_VERSION) \
	  --build-arg DEBIAN_VERSION=10 \
	  .
