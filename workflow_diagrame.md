
## Workflow-Diagramm

```mermaid

flowchart TD
    A[Push nach staging oder main<br>oder manuell via workflow_dispatch] --> B[🧰 setup<br>- Tools installieren<br>- kubeconfig aus Secret<br>- Umgebung bestimmen]

    B --> C[🔐 checkov<br>Sicherheitsprüfung]
    B --> D[🧹 tflint<br>Syntax-/Styleprüfung]

    B --> E[✅ validate<br>- tfvars generieren<br>- terraform init<br>- terraform validate]

    E --> F[📐 plan<br>- tfvars erneut generieren<br>- terraform plan]

    F --> G{Branch == main?}
    G -- Ja --> H[🚀 apply<br>terraform apply für production]
    G -- Nein --> I[❌ apply wird nicht ausgeführt]

    style A fill:,stroke:#aaa
    style B fill:,stroke:#999
    style C fill:,stroke:#aaa
    style D fill:,stroke:#aaa
    style E fill:,stroke:#999
    style F fill:,stroke:#999
    style G fill:,stroke:#999
    style H fill:,stroke:#7c7
    style I fill:,stroke:#d77



```
## Hinweise
.  Die KUBECONFIG wird aus einem Secret (KUBECONFIG_B64) zur Laufzeit generiert.

. terraform apply wird nur auf dem main-Branch automatisch ausgeführt.

. Die Umgebung staging dient rein zu Testzwecken (Plan & Validate).