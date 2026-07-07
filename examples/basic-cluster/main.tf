module "cluster" {

  source = "../../modules/k8s-cluster"

  cluster_name = "lab-cluster"

  node_count = 2

  enable_ingress = true

  enable_metrics_server = true
}

output "cluster_info" {
  value = module.cluster.cluster_metadata
}
