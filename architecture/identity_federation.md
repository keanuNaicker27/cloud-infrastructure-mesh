# Cross-Cloud Identity Federation (OIDC)

## The Problem
How do we allow an application in Azure to write data to AWS without storing static, high-risk IAM keys?

## The Solution: OIDC Trust Bridge
This mesh establishes a Federated Trust. 
* **The Azure Side:** Provides a User-Assigned Managed Identity.
* **The AWS Side:** Provides an OIDC Identity Provider (IdP) config and an IAM Role.

### Implementation Detail
Any application (the 'Consumer') running within the Azure VNet can be granted permission to assume the AWS IAM Role. This creates a **Secretless Bridge**, significantly reducing the attack surface of the multi-cloud environment.
