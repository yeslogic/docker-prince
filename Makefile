PRINCE_VERSION?=13.1

all: debian debian-slim

debian: debian-8 debian-9 debian-10

debian-slim: debian-8-slim debian-9-slim debian-10-slim

debian-10: Dockerfile.debian
	docker build \
	  -f $< \
	  -t yeslogic/prince:$(PRINCE_VERSION)-$@ \
	  --build-arg PRINCE_VERSION=$(PRINCE_VERSION) \
	  --build-arg DEBIAN_VERSION=10 \
	  --build-arg BASE_IMAGE=10 \
	  .

debian-9: Dockerfile.debian
	docker build \
	  -f $< \
	  -t yeslogic/prince:$(PRINCE_VERSION)-$@ \
	  --build-arg PRINCE_VERSION=$(PRINCE_VERSION) \
	  --build-arg DEBIAN_VERSION=9 \
	  --build-arg BASE_IMAGE=9 \
	  .

debian-8: Dockerfile.debian8
	docker build \
	  -f $< \
	  -t yeslogic/prince:$(PRINCE_VERSION)-$@ \
	  --build-arg PRINCE_VERSION=$(PRINCE_VERSION) \
	  --build-arg DEBIAN_VERSION=8 \
	  --build-arg BASE_IMAGE=8 \
	  .

debian-10-slim: Dockerfile.debian
	docker build \
	  -f $< \
	  -t yeslogic/prince:$(PRINCE_VERSION) \
	  -t yeslogic/prince:$(PRINCE_VERSION)-$@ \
	  --build-arg PRINCE_VERSION=$(PRINCE_VERSION) \
	  --build-arg DEBIAN_VERSION=10 \
	  --build-arg BASE_IMAGE=10-slim \
	  .

debian-9-slim: Dockerfile.debian
	docker build \
	  -f $< \
	  -t yeslogic/prince:$(PRINCE_VERSION)-$@ \
	  --build-arg PRINCE_VERSION=$(PRINCE_VERSION) \
	  --build-arg DEBIAN_VERSION=9 \
	  --build-arg BASE_IMAGE=9-slim \
	  .

debian-8-slim: Dockerfile.debian8
	docker build \
	  -f $< \
	  -t yeslogic/prince:$(PRINCE_VERSION)-$@ \
	  --build-arg PRINCE_VERSION=$(PRINCE_VERSION) \
	  --build-arg DEBIAN_VERSION=8 \
	  --build-arg BASE_IMAGE=8-slim \
	  .

