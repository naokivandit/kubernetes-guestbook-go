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

# ECR
nuxt_ecr_push:
	aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin 667123667048.dkr.ecr.ap-northeast-1.amazonaws.com;
	docker build -t nuxt-ecr ../front/;
	docker tag nuxt-ecr:latest 667123667048.dkr.ecr.ap-northeast-1.amazonaws.com/nuxt-ecr:latest;
	docker push 667123667048.dkr.ecr.ap-northeast-1.amazonaws.com/nuxt-ecr:latest

api_ecr_push:
	aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin 667123667048.dkr.ecr.ap-northeast-1.amazonaws.com;
	docker build -t rails-ecr ../api/;
	docker tag rails-ecr:latest 667123667048.dkr.ecr.ap-northeast-1.amazonaws.com/rails-ecr:latest;
	docker push 667123667048.dkr.ecr.ap-northeast-1.amazonaws.com/rails-ecr:latest