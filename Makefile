plan_file=.terraform/plan.terraform

.PHONY: init plan apply destroy list output fmt lint

init:
	@rm -rf ./.terraform
	@terraform init -backend-config=backend.config

plan:
	@terraform plan -refresh=true -out=${plan_file}

apply:
	@terraform apply ${plan_file}

destroy:
	@terraform destroy

list:
	@terraform state list

output:
	@terraform output

fmt:
	@terraform fmt
