run:
	node index.js

run-docker:
	docker-compose up --build

deploy:
	docker build . -t simple-node-test
	`aws ecr get-login --region us-east-1`
	docker tag simple-node-test:latest 796397107801.dkr.ecr.us-east-1.amazonaws.com/simple-node-test:latest
	docker push 796397107801.dkr.ecr.us-east-1.amazonaws.com/simple-node-test:latest

.PHONY: run run-docker deploy
