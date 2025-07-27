resource "helm_release" "nginx" {
  name       = "nginx"
  namespace  = var.namespace
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "nginx"
  version    = "15.5.3"

  values = [file("${path.module}/helm/nginx-values.yaml")]

  depends_on = [kubernetes_namespace.this]
}
