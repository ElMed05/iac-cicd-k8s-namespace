# iac-cicd-k8s-namespace
CI/CD-Pipeline für das Deployment eines Kubernetes Namespace via Terraform auf einem Minikube-Cluster – realitätsnah aufgebaut


# IaC + CI/CD: Kubernetes Namespace Deployment

Dieses Projekt zeigt, wie man eine CI/CD-Pipeline für Infrastructure as Code mit Terraform und GitHub Actions umsetzt. Als Zielumgebung dient ein lokaler Minikube-Cluster.

## 🔧 Tech Stack

- Terraform (IaC)
- GitHub Actions (CI/CD)
- Kubernetes (Minikube)
- GitHub Secrets (für Kubeconfig)

## 📁 Struktur

```bash
terraform/
├── main.tf                # Terraform Setup + Provider
├── namespace.tf           # Resource: Kubernetes Namespace
├── variables.tf           # Input Variablen
└── environments/
    ├── staging.tfvars     # Staging-Konfiguration
    └── production.tfvars  # Prod-Konfiguration
.github/workflows/deploy.yml  # CI/CD Pipeline
