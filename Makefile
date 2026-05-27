# Имя образа (замените на свой логин Docker Hub)
IMAGE_NAME = drise2008/devops-for-developers-project-74
IMAGE_TAG = latest

.PHONY: build-prod push run-prod test-prod ci

build-prod:
	docker-compose -f docker-compose.yml build app

push:
	docker-compose -f docker-compose.yml push app

run-prod:
	docker run -p 8080:8080 -e NODE_ENV=development $(IMAGE_NAME):$(IMAGE_TAG) make dev

test-prod:
	docker-compose -f docker-compose.yml up --abort-on-container-exit

ci: test-prod