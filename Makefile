demo-apply:
	git pull
	terraform init
	terraform apply -auto-approve


demo-destroy:
	git pull
	terraform init
	terraform destroy -auto-approve