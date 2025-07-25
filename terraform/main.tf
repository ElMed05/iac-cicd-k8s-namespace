terraform {
  required_version = ">= 1.8.2"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.30"
    }
  }
}


provider "kubernetes" {
  config_path = "${path.module}/.kubeconfig"
}



