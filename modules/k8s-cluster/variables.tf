variable "cluster_name" {
  description = "Kind cluster name"
  type        = string

  validation {
    condition     = length(trimspace(var.cluster_name)) > 0
    error_message = "cluster_name cannot be empty."
  }
}

variable "node_count" {
  description = "Number of worker nodes"
  type        = number
  default     = 1

  validation {
    condition     = var.node_count >= 1 && var.node_count <= 10
    error_message = "node_count must be between 1 and 10."
  }
}

variable "k8s_image" {
  description = "Kind node image"
  type        = string

  default = "kindest/node:v1.28.0"
}

variable "enable_ingress" {
  description = "Install ingress nginx"
  type        = bool
  default     = false
}

variable "enable_metrics_server" {
  description = "Install metrics server"
  type        = bool
  default     = false
}
