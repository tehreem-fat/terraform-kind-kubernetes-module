# Terraform Kind Kubernetes Module
![CI](https://github.com/tehreem-fat/terraform-kind-kubernetes-module/actions/workflows/ci.yml/badge.svg)
![Terraform](https://img.shields.io/badge/Terraform-v1.6+-623CE4?logo=terraform)
![Kubernetes](https://img.shields.io/badge/Kubernetes-v1.27+-326CE5?logo=kubernetes)
![Docker](https://img.shields.io/badge/Docker-Enabled-2496ED?logo=docker)
![Go](https://img.shields.io/badge/Go-Terratest-00ADD8?logo=go)
![GitHub Actions](https://img.shields.io/badge/CI-GitHub%20Actions-2088FF?logo=githubactions)
![License](https://img.shields.io/badge/License-MIT-green)

A production-style Terraform module that provisions and manages local Kubernetes clusters using **Kind (Kubernetes in Docker)**. The project demonstrates Infrastructure as Code (IaC), reusable Terraform modules, Kubernetes automation, testing with Terratest, and CI/CD integration.

---

## Overview

This project was built to showcase modern DevOps practices by combining:

- Terraform Modules
- Kubernetes (Kind)
- Docker
- Terratest (Go)
- GitHub Actions CI
- Infrastructure Automation
- Input Validation
- Template-Based Configuration

The module creates a complete local Kubernetes environment that can be reused across development, testing, and learning environments.

---

## Architecture

```text
Terraform
    │
    ▼
Reusable Module
    │
    ▼
Kind Cluster
    │
 ┌──┴──┐
 ▼     ▼
Ingress Metrics
NGINX  Server
```

---

## Features

### Reusable Terraform Module

- Modular design
- Clean separation of variables, resources, and outputs
- Easy customization

### Kubernetes Cluster Automation

Creates:

- Control Plane Node
- Worker Nodes
- Kubernetes Context

### Optional Components

- NGINX Ingress Controller
- Metrics Server

### Infrastructure Testing

Automated testing using:

- Go
- Terratest

### CI/CD Integration

GitHub Actions workflow automatically:

- Validates Terraform code
- Runs tests
- Verifies project integrity

---

## Project Structure

```text
terraform-kind-kubernetes-module/
│
├── .github/
│   └── workflows/
│       └── ci.yml
│
├── modules/
│   └── k8s-cluster/
│       ├── main.tf
│       ├── variables.tf
│       ├── outputs.tf
│       └── templates/
│           └── kind-config.tpl
│
├── examples/
│   └── basic-cluster/
│       └── main.tf
│
├── test/
│   ├── cluster_test.go
│   ├── go.mod
│   └── go.sum
│
├── Makefile
├── README.md
└── LICENSE
```

---

## Prerequisites

Install the following:

- Terraform >= 1.6
- Docker
- Kind
- Kubectl
- Go >= 1.21

Verify installation:

```bash
terraform version
docker version
kind version
kubectl version --client
go version
```

---

## Usage

### Initialize

```bash
cd examples/basic-cluster

terraform init
```

### Validate

```bash
terraform validate
```

### Deploy Cluster

```bash
terraform apply -auto-approve
```

### Verify Cluster

```bash
kubectl get nodes
```

Expected:

```text
lab-cluster-control-plane   Ready
lab-cluster-worker          Ready
lab-cluster-worker2         Ready
```

---

## Terraform Outputs

```bash
terraform output
```

Example:

```text
cluster_info = {
  cluster_name        = "lab-cluster"
  ingress_enabled     = true
  metrics_server      = true
  node_count          = 2
  kubectl_context     = "kind-lab-cluster"
}
```

---

## Makefile Commands

Format code:

```bash
make fmt
```

Validate configuration:

```bash
make validate
```

Run tests:

```bash
make test-unit
```

Generate plan:

```bash
make plan
```

Deploy infrastructure:

```bash
make apply
```

Destroy infrastructure:

```bash
make destroy
```

Run CI workflow locally:

```bash
make ci
```

---

## Terratest

Run automated infrastructure tests:

```bash
cd test

go test -v
```

The test automatically:

- Initializes Terraform
- Deploys the cluster
- Verifies successful deployment
- Destroys resources after testing

---

## GitHub Actions

CI pipeline runs automatically on:

- Push
- Pull Request

Pipeline stages:

1. Terraform Format Check
2. Terraform Validation
3. Terratest Execution

---

## Skills Demonstrated

- Terraform
- Infrastructure as Code (IaC)
- Kubernetes
- Kind
- Docker
- Go
- Terratest
- GitHub Actions
- DevOps Automation
- Module Design
- Infrastructure Testing

---

## Future Enhancements

- Helm Integration
- ArgoCD Deployment
- Prometheus Monitoring
- Grafana Dashboards
- Multi-Cluster Support
- AWS EKS Version

---

## Author

**Tehreem Fatima**

[![GitHub](https://img.shields.io/badge/GitHub-tehreem--fat-181717?logo=github)](https://github.com/tehreem-fat)

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Tehreem%20Fatima-0A66C2?logo=linkedin)](https://linkedin.com/in/tehreem-f-883ba1151)

---

## License

This project is licensed under the MIT License.
