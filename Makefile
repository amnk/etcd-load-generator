AMD64=GOOS=linux GOARCH=amd64
OUT=bin/etcd-load-generator
GOBUILD=go build -o $(OUT) etcd_load.go report.go
DOCKER_TAG=latest
HOSTNAME=vgtest

all: install

deps:
	go get -d .

build: deps
	$(GOBUILD)

build-amd64: deps
	env $(AMD64) $(GOBUILD)

install: build-amd64
	scp $(OUT) $(HOSTNAME):

.PHONY: all deps install

