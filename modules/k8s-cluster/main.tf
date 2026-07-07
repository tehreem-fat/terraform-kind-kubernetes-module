terraform {

  required_version = ">= 1.6.0"

  required_providers {

    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }

    null = {
      source  = "hashicorp/null"
      version = "~> 3.2"
    }

  }
}

resource "local_file" "kind_config" {

  filename = "${path.module}/kind-config.yaml"

  content = templatefile(
    "${path.module}/templates/kind-config.tpl",
    {
      node_count = var.node_count
    }
  )
}

resource "null_resource" "kind_cluster" {

  triggers = {
    cluster_name = var.cluster_name
    node_count   = var.node_count
  }

  provisioner "local-exec" {

    command = <<EOT
kind create cluster \
--name ${var.cluster_name} \
--config ${local_file.kind_config.filename}
EOT

  }

  provisioner "local-exec" {

    when = destroy

    command = "kind delete cluster --name ${self.triggers.cluster_name}"
  }

  depends_on = [
    local_file.kind_config
  ]
}

resource "null_resource" "install_ingress" {

  count = var.enable_ingress ? 1 : 0

  provisioner "local-exec" {

    command = <<EOT
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
EOT

  }

  depends_on = [
    null_resource.kind_cluster
  ]
}

resource "null_resource" "install_metrics_server" {

  count = var.enable_metrics_server ? 1 : 0

  provisioner "local-exec" {

    command = <<EOT
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
EOT

  }

  depends_on = [
    null_resource.kind_cluster
  ]
}
