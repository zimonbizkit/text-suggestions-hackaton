all: help

UID:=""
##	help:		Help of the project
. PHONY : help
help : Makefile
	@sed -n 's/^##//p' $<


##	up:		Brings the environment on
.PHONY : up
up:
	docker-compose -f docker-compose.yml up -d

##	down:		Turns down the environment
.PHONY : down
down:
	docker-compose down


##	setup: 		Setups the environment for the first time
.PHONY: setup
setup:
	docker-compose up -d
	./scripts/download_dataset.sh


##	jupyter:		runs jupyter notebook
.PHONY : jupyter
jupyter:
	docker-compose -f docker-compose.yml up -d
	docker exec -it notebooks sh -c "jupyter notebook"

##	solr-bash:		runs bash on solr
.PHONY : solr-bash
solr-bash:
	docker exec -it solr bash

##	jupyter-bash:		runs bash on jupyter environment
.PHONY : jupyter-bash
jupyter-bash:
	docker exec -it notebooks bash

##	glue-bash:		runs bash on AWS glue local development environment
.PHONY : glue-bash
glue-bash:
	docker exec -it awsglue bash

##	data-clean:			cleans the datasets from your host
.PHONY: data-clean
data-clean:
	rm -rf data/*