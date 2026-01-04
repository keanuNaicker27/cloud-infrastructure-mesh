resource "azurerm_virtual_network" "hub" {
  name                = "vnet-sentinel-hub"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.rg_name
}

# Subnet for Data Services (Isolated)
resource "azurerm_subnet" "data" {
  name                 = "snet-data-services"
  virtual_network_name = azurerm_virtual_network.hub.name
  resource_group_name  = var.rg_name
  address_prefixes     = ["10.0.1.0/24"]
  
  # Crucial for Private Endpoints
  enforce_private_link_endpoint_network_policies = true
}
