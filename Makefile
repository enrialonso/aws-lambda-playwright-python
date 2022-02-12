.SHELL=bash
IMAGE_NAME=aws-lambda-playwright-python

install:
	npm install

build:
	docker build -t $(IMAGE_NAME) .

run-local:
	docker run -it $(IMAGE_NAME)

deploy:
	bash $(shell pwd)/scripts/manager.sh $(stage) deploy
	make prune-ecr stage=$(stage)

invoke:
	bash $(shell pwd)/scripts/invoke.sh $(stage) invoke

remove:
	bash $(shell pwd)/scripts/manager.sh $(stage) remove

prune-ecr:
	bash $(shell pwd)/scripts/ecr.sh $(stage)

delete-all-images:
	docker rmi $(shell docker images -q)

delete-all-containers:
	docker rm $(shell docker ps -a -q)

prune:
	docker system prune -f
