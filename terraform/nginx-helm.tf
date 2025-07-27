resource "helm_release" "nginx" {
  name       = var.nginx_release_name
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "nginx"
  #version    = "21.0.8"
  namespace  = var.namespace

  values = [
    file("${path.module}/${var.nginx_values_file}")
  ]

  depends_on = [kubernetes_namespace.this]
}
