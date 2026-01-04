.PHONY: init plan fmt lint scan

init:
	cd terraform/environments/dev && terraform init

plan:
	cd terraform/environments/dev && terraform plan

fmt:
	terraform fmt -recursive

lint:
	tflint --recursive

scan:
	tfsec terraform/
	checkov -d terraform/

# The "All-in-One" command
validate: fmt lint scan
