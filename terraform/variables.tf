variable "namespace" {
  type        = string
  description = "Name of the namespace to deploy"
}

variable "environment" {
  type        = string
  description = "Environment tag for namespace (staging/production)"
}
