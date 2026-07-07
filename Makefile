fmt:
	terraform fmt -recursive

validate:
	cd examples/basic-cluster && terraform validate

test-unit:
	go test ./test -v

ci: fmt validate test-unit
