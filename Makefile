DOCKER_REPO=fiisoft
DOCKER_IMAGE=frappe
VERSION_BASE?=12
VERSION?=v12.9.1
FLAVOUR?=alpine
BUILD_DIR:=./images/$(VERSION_BASE)-master/$(FLAVOUR)
BASE_TAG:=$(DOCKER_REPO)/$(DOCKER_IMAGE)
FULL_TAG:=$(DOCKER_REPO)/$(DOCKER_IMAGE):$(VERSION)-$(FLAVOUR)

build-image:
	docker build --build-arg VERSION=$(VERSION) -t $(BASE_TAG)  $(BUILD_DIR)

tag-image:
	docker tag $(BASE_TAG) $(FULL_TAG)

push-image:
	docker push $(FULL_TAG)

build: build-image tag-image push-image
