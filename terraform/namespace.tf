resource "kubernetes_namespace" "this" {
  metadata {
    name = var.namespace
    labels = {
      environment = var.environment
    }
  }

  lifecycle {
    prevent_destroy = true
  }
}
