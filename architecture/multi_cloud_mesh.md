# High-Level Design: Multi-Cloud Mesh

## Strategic Objective
This repository provides a "Secure Landing Zone" for enterprise data platforms. It is designed to be **consumer-agnostic**—whether the platform running on top is a Python governance engine, a Spark cluster, or a dbt-heavy warehouse, the underlying infrastructure remains hardened and compliant.

## Architectural Pillars
1. **Network-First Security:** Implements a 'Private-Only' posture. No resources are exposed to the public internet; all ingress/egress uses Private Link/VPC Endpoints.
2. **Provider Diversification:** Uses Azure for primary application compute and AWS for immutable, cross-region storage to satisfy DR (Disaster Recovery) and compliance requirements.
3. **Infrastructure as Code (IaC):** 100% Terraform-managed, ensuring that environments (Dev/Prod) are identical and reproducible.

```mermaid
graph TD
    subgraph "Microsoft Azure"
        BC[Source API] -->|Private Link| ADF[Azure Data Factory]
        ADF -->|Validate| Sentinel[Sentinel Engine]
        Sentinel -->|Store| SQL[(Azure SQL)]
    end

    subgraph "AWS (Compliance)"
        IAM[IAM Role / OIDC]
        S3[(S3 Audit Vault)]
    end

    ADF -.->|Federated Auth| IAM
    ADF -.->|Immutable Sync| S3
