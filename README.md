# Cloud-Infrastructure-Mesh

**Multi-Cloud Foundation for Enterprise Financial Platforms**

## Overview

This repository manages the **Infrastructure as Code (IaC)** for a hardened, multi-cloud landing zone. It provides a secure "vessel" for financial data operations, bridging **Microsoft Azure** (for ERP-proximal processing) and **Amazon Web Services (AWS)** (for immutable compliance storage).

### Business Value

* **Compliance-Ready:** Designed to meet SOC2 and ISO 27001 standards for data isolation and auditability.
* **Risk Mitigation:** Eliminates single-cloud provider dependency for critical financial audit trails.
* **Cost Governance:** Built-in tagging and resource sizing logic to support FinOps accountability.

---

## Architecture & Security

The mesh is built on a **Zero-Trust** philosophy. No resource is exposed to the public internet, and no static credentials (keys/passwords) are used for cross-cloud communication.

### Key Pillars:

1. **Network Isolation:** Utilizes Azure Private Links and AWS VPC Endpoints. Data movement stays within the cloud provider backbones.
2. **Secretless Identity:** Implements **OIDC (OpenID Connect)** Federation. Azure Managed Identities assume AWS IAM Roles via temporary, short-lived tokens.
3. **Immutable Audit Vault:** Leverages **AWS S3 Object Lock (WORM)** to ensure financial records cannot be deleted or altered for a defined retention period (e.g., 7 years).

---

## Repository Structure

* **`/terraform/modules`**: Reusable, hardened components (Networking, Data Factory, S3 Vault).
* **`/terraform/environments`**: Distinct configurations for `dev` (cost-optimized) and `prod` (high-availability).
* **`/architecture`**: Design records (ADRs) and Mermaid diagrams explaining the "Why" behind the "How."
* **`/.github/workflows`**: Automated DevSecOps pipeline including `tfsec` security scanning and `tflint`.

---

## Getting Started

### Prerequisites

* Terraform `v1.5.0+`
* Azure CLI & AWS CLI
* `make` (optional, for Developer Experience)

### Quick Start (Local Dev)

```bash
# Initialize the environment
make init

# Run security scans and linting
make validate

# Preview infrastructure changes
make plan

```

---

## Tech Stack

* **IaC:** Terraform
* **Cloud 1:** Microsoft Azure (Data Factory, Azure SQL, Private Link)
* **Cloud 2:** Amazon Web Services (S3 Object Lock, IAM OIDC)
* **CI/CD:** GitHub Actions (with OIDC Integration)
* **Security:** `tfsec` (Static Analysis), `checkov` (Compliance)

---

## Related Projects

This infrastructure is part of a larger ecosystem designed for automated financial governance:

* **[Sentinel-Governance-Engine]**: The logic layer that runs on this mesh to enforce data contracts.
* **[Financial-Semantic-Core]**: The RGS-mapped data models that reside within the secure SQL instances.
