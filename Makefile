# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

THIS_FILE := $(lastword $(MAKEFILE_LIST))

composer-install:
	docker run --rm -it \
		-v $$(pwd):/srv/laminas-wordpress \
		-w /srv/laminas-wordpress \
		-e COMPOSER_HOME=/srv/laminas-wordpress/.composer \
		--user $$(id -u):$$(id -g) \
	composer install --no-plugins --no-scripts --no-dev --prefer-dist -v --ignore-platform-reqs
composer-update:
	docker run --rm -it \
		-v $$(pwd):/srv/laminas-wordpress \
		-w /srv/laminas-wordpress \
		-e COMPOSER_HOME=/srv/laminas-wordpress/.composer \
		--user $$(id -u):$$(id -g) \
	composer update -v --no-dev
composer:
	docker run --rm -it \
		-v $$(pwd):/srv/laminas-wordpress \
		-w /srv/laminas-wordpress \
		-e COMPOSER_HOME=/srv/laminas-wordpress/.composer \
		--user $$(id -u):$$(id -g) \
	composer $(filter-out $@,$(MAKECMDGOALS))

