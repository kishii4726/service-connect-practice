tf-init:
	terraform -chdir=terraform init
tf-plan:
	terraform -chdir=terraform plan
tf-apply:
	terraform -chdir=terraform apply
frontend-deploy:
	ecspresso deploy --config "ecspresso/frontend/ecspresso.yml"
backend-deploy:
	ecspresso deploy --config "ecspresso/backend/ecspresso.yml"
