project=blt

.PHONY: inject
inject:
	@op inject -i provider.tf.1p -o provider_override.tf

.PHONY: init
init: inject
	terraform init -backend-config=$(project).tfbackend

.PHONY: plan
plan: init
	terraform plan -var-file=$(project).tfvars
	@rm provider_override.tf

.PHONY: apply
apply: inject
	terraform apply -auto-approve -var-file=$(project).tfvars
	@rm provider_override.tf

.PHONY: destroy
destroy: init
	terraform destroy -auto-approve -var-file=$(project).tfvars
	@rm provider_override.tf

.PHONY: clean
clean:
	@rm -rf .terraform
	@rm *.tfstate
