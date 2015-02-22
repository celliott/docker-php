# Makefile for docker-php

# set token
MONGODB ?= 'mongodb://@172.17.42.1:27017/api'

# docker settings
ENVS =  -e MONGODB=$(MONGODB)
PORTS = -p 80:80
CONTAINER = php
VOLUMES =


.PHONY: container run

container :
	docker build -t $(CONTAINER) .

run :
	docker run --name $(CONTAINER) -i -d $(PORTS) $(ENVS) $(VOLUMES) -t $(CONTAINER)
stop :
	docker stop $(CONTAINER)
	docker rm $(CONTAINER)
kill :
	docker kill $(CONTAINER)
	docker rm $(CONTAINER)
restart :
	docker kill $(CONTAINER)
	docker rm $(CONTAINER)
	docker run --name $(CONTAINER) -i -d $(PORTS) $(ENVS) $(VOLUMES) -t $(CONTAINER)
attach:
	docker attach $(CONTAINER)

tail:
	docker logs -f $(CONTAINER)
