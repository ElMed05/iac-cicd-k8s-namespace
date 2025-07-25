# iac-cicd-k8s-namespace
Dieses Projekt demonstriert einen vollständigen CI/CD-Workflow für Kubernetes-IaC – lokal entwickelbar, teamfähig und sofort erweiterbar.

**CI/CD-Pipeline für das Deployment eines Kubernetes Namespace via Terraform auf einem Minikube-Cluster**  
Dieses Projekt zeigt eine produktionsnahe Umsetzung von Infrastructure-as-Code (IaC) mit GitHub Actions, Terraform und Kubernetes (Minikube).  

---

## 🔧 Tech Stack

- **Terraform** – Infrastruktur als Code
- **GitHub Actions** – Automatisierte CI/CD Workflows
- **Kubernetes (Minikube)** – Zielumgebung
- **Checkov** – Sicherheitsprüfung der Terraform-Konfiguration
- **TFLint** – Linter für Terraform
- **GitHub Secrets** – Speicherung der Base64-kodierten Kubeconfig

---

## 📁 Projektstruktur

```bash
terraform/
├── main.tf                # Provider-Definition & Terraform-Setup
├── namespace.tf           # Kubernetes Namespace Resource
├── variables.tf           # Input-Variablen
└── environments/
    ├── staging.tfvars     # Staging-Konfiguration
    └── production.tfvars  # Production-Konfiguration

.github/workflows/
└── deploy.yml             # GitHub Actions Workflow für CI/CD
---




