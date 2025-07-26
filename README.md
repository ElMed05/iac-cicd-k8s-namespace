# iac-cicd-k8s-namespace

**CI/CD-Pipeline für das Deployment eines Kubernetes Namespace via Terraform auf einem Minikube-Cluster**  
Dieses Projekt implementiert Infrastructure-as-Code (IaC) mit GitHub Actions, Terraform und Kubernetes (Minikube) in einer produktionsnahen Umgebung. Es zeigt einen vollständigen CI/CD-Workflow für Kubernetes-IaC – lokal entwickelbar, teamtauglich und leicht erweiterbar.

---

## 🔧 Tech Stack

- **Terraform** – Infrastruktur als Code
- **GitHub Actions** – Automatisierte CI/CD Workflows
- **Kubernetes (Minikube)** – Zielumgebung
- **Checkov** – Sicherheitsprüfung der Terraform-Konfiguration
- **TFLint** – Linter für Terraform
- **GitHub Secrets** – Speicherung der Base64-kodierten Kubeconfig

---
## 📁 GitHub Branch-Strategie

- **main für Produktion:** -Führt zu Terraform Apply auf Namespace in PROD.
- **staging für Entwicklung**  
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
```


# CI/CD-Workflow für Terraform + Kubernetes Namespace

```mermaid

flowchart TD
    A[Push nach staging oder main<br>oder manuell via workflow_dispatch] --> B[🧰 setup<br>- Tools installieren<br>- kubeconfig aus Secret<br>- Umgebung bestimmen]

    B --> C[🔐 checkov<br>Sicherheitsprüfung]
    B --> D[🧹 tflint<br>Syntax-/Styleprüfung]

    B --> E[✅ validate<br>- tfvars generieren<br>- terraform init<br>- terraform validate]

    E --> F[📐 plan<br>- tfvars erneut generieren<br>- terraform plan]

    F --> G{Branch == main?}
    G -- Ja --> H[Namespace importieren falls nötig  terraform import]
    H --> I[Apply = terraform apply auf production, Smoke Test]
    G -- Nein --> J[Kein Apply = nur Plan]

    style A fill:,stroke:#aaa
    style B fill:,stroke:#999
    style C fill:,stroke:#aaa
    style D fill:,stroke:#aaa
    style E fill:,stroke:#999
    style F fill:,stroke:#999
    style G fill:,stroke:#999
    style H fill:,stroke:#7c7
    style I fill:,stroke:#7c7
    style J fill:,stroke:#d77
    

```





