# iac-cicd-k8s-namespace

**CI/CD-Pipeline für das Deployment eines Kubernetes Namespace via Terraform auf einem Minikube-Cluster**  
Dieses Projekt implementiert Infrastructure-as-Code (IaC) mit GitHub Actions, Terraform und Kubernetes (Minikube) in einer produktionsnahen Umgebung. Es zeigt einen vollständigen CI/CD-Workflow für Kubernetes-IaC – lokal entwickelbar, teamtauglich und leicht erweiterbar.

---

##  Tech Stack

- **Terraform** – Infrastruktur als Code
- **GitHub Actions** – Automatisierte CI/CD Workflows
- **Kubernetes (Minikube)** – Zielumgebung
- **Checkov** – Sicherheitsprüfung der Terraform-Konfiguration
- **TFLint** – Linter für Terraform
- **GitHub Secrets** – Speicherung der Base64-kodierten Kubeconfig

---
##  GitHub Branch-Strategie 

- **main für Produktion:** Führt zu Terraform Apply auf Namespace in PROD.
- **staging für Entwicklung**  löst Sicherheits- und Syntaxprüfungen + Terraform Plan aus.
- **workflow_dispatch**  Manueller Trigger mit Umgebungswahl (z.B staging, production)

---
##  Projektstruktur

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
```


# CI/CD-Workflow für Terraform + Kubernetes Namespace

```mermaid
flowchart TD
    A[Push nach staging oder main\noder manuell via workflow_dispatch] --> B[ Setup\n- Tools installieren\n- kubeconfig aus Secret\n- Umgebung bestimmen]
    

    B --> C[ Checkov\nSicherheitsprüfung]
    B --> D[ TFLint\nSyntax-/Styleprüfung]
    B --> E[ Validate\n- tfvars generieren\n- terraform init\n- terraform validate]

    E --> F[ Plan\n- terraform plan mit tfvars]

    F --> G{Branch == main oder staging?}

    G -- main --> H[ Namespace-Import via terraform]
    H --> I[ Apply auf production Umgebung]
    I --> K[ Smoke Test\nLabel-Check via kubectl]

    G -- staging --> J[  Namespace-Import via terraform]
    J --> R[ Apply auf Dev Umgebung]

    R --> L[ Smoke Test\nLabel-Check via kubectl]

    style A fill:#,stroke:#aaa
    style B fill:#,stroke:#aaa
    style C fill:#,stroke:#aaa
    style D fill:#,stroke:#aaa
    style E fill:#,stroke:#aaa
    style F fill:#,stroke:#aaa
    style G fill:#,stroke:#888
    style H fill:#,stroke:#4a4
    style I fill:#,stroke:#4a4
    style K fill:#,stroke:#06b
    style J fill:#,stroke:#d77
    style R fill:#,stroke:#d77
    style L fill:#,stroke:#06b
```


- **setup** – Tools installieren, kubeconfig schreiben, Umgebung auslesen
- **checkov** – Sicherheits-Scan via Checkov
- **lint** – Terraform Linting via TFLint
- **validate** – Terraform init & validate
- **plan** – Terraform plan mit .tfvars aus Umgebung
- **apply** – auf `main` für `Prod umgebung`und auf `staging` für `staging umgebung`', mit optionalem terraform import (wenn Namespace bereits vorhanden)

## Besonderheiten

- .kubeconfig wird Base64-kodiert über GitHub Secret bereitgestellt
- Wenn Namespace bereits existiert, wird er automatisch importiert (terraform import)
- Bei staging erfolgt  Apply, nur auf Dev umgebung
- tfvars-Dateien werden dynamisch generiert

## Optional erweiterbar um

- Unit-Tests
- Rollout von Kubernetes Deployments
- Helm-Charts / ArgoCD / Tekton

## CI/CD-Pipeline für IaC (Terraform + GitHub Actions)

![Deploy Status](https://github.com/ElMed05/iac-cicd-k8s-namespace/actions/workflows/deploy.yml/badge.svg)
