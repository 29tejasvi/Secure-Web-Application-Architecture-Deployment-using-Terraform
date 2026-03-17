data "azurerm_client_config" "current" {}

data "azurerm_resource_group" "my_assigned_rg" {
    name = var.rg_name
}

data "azurerm_linux_web_app" "webapp1" {
  name = "tfasp1stwebapp"
  resource_group_name = data.azurerm_resource_group.my_assigned_rg.name
}

data "azurerm_subnet" "private_endpoint_subnet" {
  name = "private_endpoint_subnet"
  virtual_network_name = "vnet"
  resource_group_name = var.rg_name
}

data "azurerm_virtual_network" "vnet" {
  name = "vnet"
  resource_group_name = var.rg_name
}

