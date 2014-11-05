REPO=dind
REGISTRY:=quay.io/3scale
TAG:=$(shell git rev-parse --abbrev-ref HEAD)
IMAGE:=$(REGISTRY)/$(REPO):$(TAG)

RUN := docker run --privileged --rm
INTERACTIVE := --tty --interactive

build:
	docker build -t $(IMAGE) .
bash:
	$(RUN) $(INTERACTIVE) $(IMAGE) bash
test: build
	$(RUN) $(IMAGE) docker run busybox true
run:
	$(RUN) $(INTERACTIVE) $(IMAGE)
