.PHONY: build

SHELL := /bin/bash
CONTAINERNAME_BACKEND=locust_backend
IMAGENAME_BACKEND=locust_backend_image
######################
#
# To setup:
#   make setup venv=name_of_venv settings=dev
#
# This fancy makfile will setup a django project for you. It will create the virtualenv that
# you specify, set the project directory, and setup postactivate and decativate files.
# You can also use it for quick installation but that only works on an active environment.
#
######################


# this doesn't want to run only on setup even when traget is set
# setup: VENV = $(shell if [ -z $(VENV) ] ; then read -p "Virtualenv name (you can decide): " NAME ; echo $$NAME ; fi )
build: ## Build the backend Docker image
	cp -r requirements ./build/backend
	docker build -t $(IMAGENAME_BACKEND) ./build/backend

up: build ## Bring the backend Docker container up
	docker-compose -p locust up -d backend || echo 'Already up!'

down: ## Stop the backend Docker container
	docker-compose -p locust stop backend

enter: ## Enter the running backend Docker container
	docker exec -it $(CONTAINERNAME_BACKEND) /bin/bash

clean: ## Stop and remove all Docker containers
	docker-compose -p locust down

