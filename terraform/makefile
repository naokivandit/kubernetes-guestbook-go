init:
	terraform init

plan:
	terraform plan

apply:
	time terraform apply -parallelism=20 --auto-approve

destroy:
	time terraform destroy -parallelism=20 --auto-approve

fmt:
	terraform fmt -recursive

fmtcheck:
	terraform fmt -recursive -check

validate:
	terraform validate

tflint:
	tflint

check_identity:
	aws sts get-caller-identity