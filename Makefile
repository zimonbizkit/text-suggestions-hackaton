all: help

UID:=""
##	help:			Help of the project
. PHONY : help
help : Makefile
	@sed -n 's/^##//p' $<


##	up:			Brings the environment on
.PHONY : up
up:
	docker-compose -f docker-compose.yml up -d

##	down:			Turns down the environment
.PHONY : down
down:
	docker-compose down


##	rebuild:		rebuilds the environment with whathever changes done
.PHONY: rebuild
rebuild:
	docker-compose down
	docker-compose build
	docker-compose -f docker-compose.yml up -d

##	setup: 			Setups the environment for the first time
.PHONY: setup
setup:
	docker-compose up -d
	./scripts/download_dataset.sh
	cp -r data/* notebooks/notebooks/data/
	cp -r data/* notebooks/notebooks/example_2/
	cp -r data/* notebooks/notebooks/example_3/

##	jupyter:		runs jupyter notebook
.PHONY : jupyter
jupyter:
	docker-compose -f docker-compose.yml up -d
	docker exec -it notebooks sh -c "jupyter notebook --NotebookApp.iopub_data_rate_limit=9e10 --NotebookApp.iopub_msg_rate_limit=9e10 --notebook-dir=/tmp/notebooks/"

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

##	data-clean:		cleans the datasets from your host
.PHONY: data-clean
data-clean:
	rm -rf data/* && rm -rf /notebooks/data/*

##	build_suggestions_1:	builds example 1
.PHONY : build_suggestions_1
build_suggestions_1:
	docker-compose -f docker-compose.yml up -d
	./scripts/build_example_1.sh