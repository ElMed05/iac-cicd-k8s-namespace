terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.30"
    }
  }
}

provider "kubernetes" {
  host                   = yamldecode(file("${path.module}/.kubeconfig"))["clusters"][0]["cluster"]["server"]
  client_certificate     = base64decode(yamldecode(file("${path.module}/.kubeconfig"))["users"][0]["user"]["client-certificate-data"])
  client_key             = base64decode(yamldecode(file("${path.module}/.kubeconfig"))["users"][0]["user"]["client-key-data"])
  cluster_ca_certificate = base64decode(yamldecode(file("${path.module}/.kubeconfig"))["clusters"][0]["cluster"]["certificate-authority-data"])
}


