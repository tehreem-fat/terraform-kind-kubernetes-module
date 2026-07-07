output "cluster_name" {
  value = var.cluster_name
}

output "kubectl_context" {
  value = "kind-${var.cluster_name}"
}

output "kubeconfig_path" {
  value = "~/.kube/config"
}

output "cluster_metadata" {

  value = {
    cluster_name        = var.cluster_name
    node_count          = var.node_count
    kubectl_context     = "kind-${var.cluster_name}"
    ingress_enabled     = var.enable_ingress
    metrics_server      = var.enable_metrics_server
    kubeconfig_location = "~/.kube/config"
  }
}
