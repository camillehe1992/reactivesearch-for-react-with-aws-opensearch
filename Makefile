#########################################################################
# Terraform Makefile
#########################################################################
-include .env

SHELL := /bin/bash
BASE := $(shell /bin/pwd)

VAR_FILE := $(BASE)/terraform/terraform.tfvars

$(info AWS_ACCOUNT 		= $(AWS_ACCOUNT))
$(info AWS_PROFILE 		= $(AWS_PROFILE))
$(info AWS_REGION  		= $(AWS_REGION))
$(info STATE_BUCKET		= $(STATE_BUCKET))
$(info ENVIRONMENT 		= $(ENVIRONMENT))
$(info NICKNAME    		= $(NICKNAME))
$(info VAR_FILE 		= $(VAR_FILE))

# Add defaults/common variables for all components
define DEFAULTS
-var-file=$(VAR_FILE) \
-var aws_profile=$(AWS_PROFILE) \
-var aws_region=$(AWS_REGION) \
-var master_user_password=${MASTER_USER_PASSWORD} \
-refresh=true
endef

override OPTIONS += $(DEFAULTS)

lint:
	$(info [*] Linting terraform)
	@$(TF) fmt -check -diff -recursive
	@$(TF) validate

check-env:
	$(info [*] Check Environment Done)
	@$(info $(shell aws sts get-caller-identity --profile $(AWS_PROFILE)))

init: check-env
	$(info [*] Init Terrafrom Infra)
	cd terraform && terraform init -reconfigure \
		-backend-config="bucket=$(STATE_BUCKET)" \
		-backend-config="region=$(AWS_REGION)" \
		-backend-config="profile=$(AWS_PROFILE)" \
		-backend-config="key=$(NICKNAME)/$(ENVIRONMENT)/$(AWS_REGION)/terraform.tfstate"

plan: init
	$(info [*] Plan Terrafrom Infra)
	cd terraform && terraform plan $(OPTIONS) -out tfplan

plan-destroy: init
	$(info [*] Plan Terrafrom Infra - Destroy)
	cd terraform && terraform plan -destroy $(OPTIONS) -out tfplan

apply: init
	$(info [*] Apply Terrafrom Infra)
	cd terraform && terraform apply tfplan

quick-deploy:
	make plan && cd terraform && terraform apply tfplan

import-data:
	$(info [*] Import Sample Data)
	ENDPOINT=$(shell terraform output dashboard_endpoint)
	# curl -XPOST -u 'admin:$(MASTER_USER_PASSWORD)' \
	# 	'$(ENDPOINT)/_bulk' \
	# 	--data-binary @bulk_movies.json \
	# 	-H 'Content-Type: application/json'
