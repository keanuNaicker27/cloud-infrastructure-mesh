module "networking" {
  source   = "../../modules/azure_vnet_hub"
  location = "North Europe" # Amsterdam
  environment = "prod"
}

module "compliance_vault" {
  source      = "../../modules/aws_audit_vault"
  environment = "prod"
  # In Prod, we might want 7 years of retention, not 1
  retention_days = 2555 
}
