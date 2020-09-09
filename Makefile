SERVICE = php
COMMAND = /bin/bash
VERSION = ~4.0

up:
	docker-compose up -d --build
down:
	docker-compose down
run:
	docker-compose run --rm ${SERVICE} ${COMMAND}
exec:
	docker-compose exec ${SERVICE} ${COMMAND}

composer/install:
	docker-compose run --rm ${SERVICE} composer install

cakephp/install:
	docker-compose run --rm ${SERVICE} composer create-project --prefer-dist cakephp/app:${VERSION} .
cakephp/server/start:
	docker-compose run --rm --service-ports -d ${SERVICE} bin/cake server -p 8080 --host 0.0.0.0
cakephp/migrate:
	docker-compose run --rm ${SERVICE} bin/cake migrations migrate
