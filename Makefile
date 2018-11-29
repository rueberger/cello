.PHONY: all
all: push_image

.PHONY: build_image
build_image:
	docker build --pull -t rueberger/cello:latest -f Dockerfile ${CURDIR}

.PHONY push_image:
push_image: build_image
	docker push rueberger/cello:latest
