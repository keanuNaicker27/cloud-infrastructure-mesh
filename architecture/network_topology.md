```mermaid
graph TD
    subgraph "Microsoft Azure"
        SourceSystem[Source API] -->|Private Link| ADF[Azure Data Factory]
        ADF -->|Validate| Sentinel[Sentinel Engine]
        Sentinel -->|Store| SQL[(Azure SQL)]
    end

    subgraph "AWS (Compliance)"

        IAM[IAM Role / OIDC]
        S3[(S3 Audit Vault)]
    end

    ADF -.->|Federated Auth| IAM
    ADF -.->|Immutable Sync| S3
