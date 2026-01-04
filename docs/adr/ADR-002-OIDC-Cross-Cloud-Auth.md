# ADR-002: OIDC-Based Cross-Cloud Authentication

## Status
Accepted

## Context
Applications running in the Azure Hub need to write compliance data to AWS S3. We must choose between static IAM Access Keys or Identity Federation.

## Decision
We will implement **OpenID Connect (OIDC)**. 
- AWS will be configured with an OIDC Identity Provider (IdP) pointing to the Azure AD (Entra ID) tenant.
- An AWS IAM Role will be created with a **Trust Relationship** allowing only specific Azure Managed Identities to assume it.

## Consequences
- **Pros:** Zero-secret architecture. No keys to leak, rotate, or steal.
- **Cons:** Increased initial configuration complexity compared to simple access keys.
