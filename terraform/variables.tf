variable "namespace" {
  type        = string
  description = "Name of the namespace to deploy"
}

variable "environment" {
  type        = string
  description = "Environment tag for namespace (staging/production)"
}

variable "nginx_release_name" {
  type        = string
  description = "Name des Helm Releases für nginx"
}

variable "nginx_values_file" {
  type        = string
  description = "Pfad zur values.yaml für nginx Helm Chart"
}
