resource "azurerm_data_factory" "adf" {
  name                = "adf-${var.project_name}-${var.environment}"
  location            = var.location
  resource_group_name = var.rg_name

  # STAFF MOVE: Enable Managed Identity for passwordless auth
  identity {
    type = "SystemAssigned"
  }
}

# Managed VNet to ensure data never leaves the private backbone
resource "azurerm_data_factory_managed_virtual_network" "vnet" {
  name            = "default"
  data_factory_id = azurerm_data_factory.adf.id
}

# Self-hosted / Managed Integration Runtime
resource "azurerm_data_factory_integration_runtime_azure" "ir" {
  name                    = "ir-secure-transport"
  data_factory_id         = azurerm_data_factory.adf.id
  location                = var.location
  virtual_network_enabled = true
}
