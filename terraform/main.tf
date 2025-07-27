terraform {
  required_version = ">= 1.8.2"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.30"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.13"
    }
  }
}

provider "kubernetes" {
  config_path    = "${path.module}/.kubeconfig"
  config_context = "minikube"
}

provider "helm" {
  kubernetes {
    config_path    = "${path.module}/.kubeconfig"
    config_context = "minikube"
  }
}

resource "kubernetes_namespace" "this" {
  metadata {
    name = var.namespace
    labels = {
      environment = var.environment
    }
  }
}

