LOCALHOST_PROJECT_DIR := $(shell pwd)

# IMPORT CONFIG WITH ENVS. You can change the default config with `make cnf="config_special.env" up-dev`
#cnf ?= $(LOCALHOST_PROJECT_DIR)/deploy/config.env
#include $(cnf)
#
#export $(shell sed 's/=.*//' $(cnf))

.DEFAULT_GOAL := help
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help:## This is help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.PHONY: help

echo-project-dir:## Show current working directory.
	@echo $(LOCALHOST_PROJECT_DIR)
#	@echo $(PROJECT_NAME)

.PHONY: echo-project-dir

print:## print
	@printenv

.PHONY: print

## Docker compose shortcuts
srv-up srv-down srv-build srv-top print-compose-file: COMPOSE_FILE=./docker-compose.yml
srv-up: ## Up current containers
	docker-compose -f $(COMPOSE_FILE) up -d

srv-down: ## Down current containers
	docker-compose -f $(COMPOSE_FILE) down

srv-build: ## Down current containers
	docker-compose -f $(COMPOSE_FILE) build

srv-top: ## Down current containers
	docker-compose -f $(COMPOSE_FILE) top

print-compose-file:## print compose file
	@echo $(COMPOSE_FILE)

.PHONY: up-dev srv-down srv-build srv-top print-compose-file

php-exec: CMD?=-r 'phpinfo();'
php-exec: ## Run any php command in our container
	docker exec ${PROJECT_NAME}-php php $(CMD)

.PHONY: php-exec

#composer-remote: DIR = "./vendor:/data/vendor"
composer-remote:
	docker run --name composer-remote --interactive --volume $(LOCALHOST_PROJECT_DIR):/app composer $(CMD) &
	docker cp composer-remote:/app $(LOCALHOST_PROJECT_DIR)/app &
	docker rm composer-remote


.PHONY: composer-remote

#	docker run --name composer-remote --interactive --tty --volume $(DIR) composer $(CMD) &
#	docker cp composer-remote:data/vendor app &
#	docker rm composer-remote &

#docker run --name test --interactive --tty --volume $PWD:/app composer $(RUN_ARGS) &
#	docker cp test:app $PWD &
#	docker rm test &







