# Compliance & Governance Mapping

This Mesh is designed to satisfy requirements for **ISO 27001 (Section A.12.6)** and **SOC 2 (Trust Services Criteria)**.

| Control Category | Technical Implementation | Compliance Value |
| :--- | :--- | :--- |
| **Data Sovereignty** | Regional pinning (EU-West / EU-Central) | Ensures GDPR compliance for financial data residency. |
| **Encryption** | CMK (Customer Managed Keys) & TLS 1.2+ | Meets "Encryption in Transit & Rest" requirements. |
| **Audit Trail** | AWS S3 Object Lock (WORM) | Satisfies financial regulations regarding non-repudiation of records. |
| **Least Privilege** | IAM Roles + Managed Identities | Minimizes "Blast Radius" in the event of a credential compromise. |
| **Network Isolation** | Private Endpoints / No Public IP | Protects against external brute-force and DDoS attacks. |
