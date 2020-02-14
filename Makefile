default:
	@printf "$$HELP"

# Docker commands
docker-build:
	docker-compose -f .docker/docker-compose.yml build

docker-composer-install:
	@docker exec -it kata-gilded-rose bash -c "composer install --prefer-source --no-interaction"

docker-behat:
	@docker exec -it kata-gilded-rose bash -c "./vendor/bin/phpunit"

docker-down:
	docker-compose -f .docker/docker-compose.yml down

docker-start:
	docker-compose -f .docker/docker-compose.yml up -d

docker-tests:
	@docker exec -it kata-gilded-rose bash -c "./vendor/bin/phpunit"

docker-coverage:
	@docker exec -it kata-gilded-rose bash -c "./vendor/bin/phpunit --coverage-text"

docker-ssh:
	@docker exec -it jtech_magento1_web bash

docker-clean-images:
	docker rmi $(docker images | tail -n +2 | awk '$1 == "<none>" {print $'3'}')
docker-clean-all:
	 docker-compose -f .docker/docker-compose.yml down && docker rmi docker_jtech_magento1_db:latest docker_jtech_magento1_web:latest

define HELP
# Docker
	- default:
	- docker-build:
	- docker-stop
	- docker-down:
	- docker-start:
	- docker-tests:
	- docker-coverage:
	- docker-ssh:

endef

export HELP