module "vnet" {
  source   = "../../modules/azure_vnet_hub"
  location = var.azure_location
  env      = var.environment
}

module "adf" {
  source   = "../../modules/azure_data_factory"
  location = var.azure_location
  rg_name  = module.vnet.resource_group_name
  env      = var.environment
}

module "aws_vault" {
  source   = "../../modules/aws_audit_vault"
  env      = var.environment
}
