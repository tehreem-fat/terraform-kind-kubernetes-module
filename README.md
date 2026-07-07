# Terraform Kind Kubernetes Module

Production-style Terraform module that provisions local Kubernetes clusters using Kind.

## Features

- Reusable Terraform Module
- Input Validation
- Template-Based Kind Config
- Optional NGINX Ingress
- Optional Metrics Server
- Structured Outputs
- Null Resource Automation

## Technologies

- Terraform
- Kubernetes
- Kind
- Docker
- Kubectl

## Example

```bash
terraform init
terraform apply
```

Creates:

- Kubernetes Control Plane
- Worker Nodes
- NGINX Ingress Controller
- Metrics Server
## Testing

This project includes automated infrastructure testing using Terratest.

### Run Tests

```bash
cd test

go mod tidy

go test -v
