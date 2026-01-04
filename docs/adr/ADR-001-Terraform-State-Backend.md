# ADR-001: Remote State Management and Locking

## Status
Accepted

## Context
Terraform state files contain the current mapping of our code to real-world resources. If two engineers run `terraform apply` simultaneously, or if a state file is lost, the infrastructure becomes corrupted. State files also contain sensitive metadata.

## Decision
We will use **Azure Blob Storage** with **Lease Locking** as our primary backend. 
- **Encryption:** State will be encrypted at rest using AES-256.
- **Locking:** We utilize a Blob Lease to prevent concurrent execution.
- **Versioning:** Blob versioning is enabled to allow recovery from accidental state corruption.

## Consequences
- **Pros:** Collaborative development is safe; state is secure and backed up.
- **Cons:** Requires a "Bootstrap" phase to create the storage account before the rest of the mesh can be deployed.
