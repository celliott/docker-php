# Makefile for docker-php

# set token
MONGODB ?= 'mongodb://@172.17.42.1:27017/api'

# docker settings
ENVS =  -e MONGODB=$(MONGODB)
PORTS = -p 80:80
CONTAINER = php
VOLUMES = -v /data/html:/var/www/html



.PHONY: build run

build :
	docker build -t $(CONTAINER) .

run : rm
	docker run --restart=always --name $(CONTAINER) -i -d $(PORTS) $(ENVS) $(VOLUMES) -t $(CONTAINER)

stop :
	docker stop $(CONTAINER)
	docker rm $(CONTAINER)

rm :
	-docker kill $(CONTAINER)
	-docker rm $(CONTAINER)

attach:
	docker attach $(CONTAINER)

tail:
	docker logs -f $(CONTAINER)
