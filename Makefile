DOCKER_REPO=fiisoft
DOCKER_IMAGE=docker-frappe
VERSION_BASE?=12
VERSION?=v12.11.2
FLAVOUR?=alpine
BUILD_DIR:=./images/$(VERSION_BASE)-master/$(FLAVOUR)
DATE_TAG:=$(DOCKER_REPO)/$(DOCKER_IMAGE):$(shell date +%Y%m%d)
BASE_TAG:=$(DOCKER_REPO)/$(DOCKER_IMAGE):$(VERSION_BASE)
FULL_TAG:=$(DOCKER_REPO)/$(DOCKER_IMAGE):$(VERSION)-$(FLAVOUR)

build-image:
	docker build --build-arg VERSION=$(VERSION) -t $(DATE_TAG)  $(BUILD_DIR)

tag-image:
	docker tag $(DATE_TAG) $(BASE_TAG)
	docker tag $(DATE_TAG) $(FULL_TAG)

push:
	docker push $(FULL_TAG)

build: build-image tag-image
