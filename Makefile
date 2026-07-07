fmt:
	terraform fmt -recursive

validate:
	cd examples/basic-cluster && terraform validate

test-unit:
	cd test && go test -v

test-integration:
	cd test && go test -v -timeout 45m

plan:
	cd examples/basic-cluster && terraform plan

apply:
	cd examples/basic-cluster && terraform apply -auto-approve

destroy:
	cd examples/basic-cluster && terraform destroy -auto-approve

ci: fmt validate test-unit
