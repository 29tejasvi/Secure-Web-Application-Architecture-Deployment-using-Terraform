

# fetch the resource group details

data "azurerm_resource_group" "my_assigned_rg" {
  name = var.rg_name
}

data "azurerm_virtual_network" "vnet" {
  name = "vnet"
  resource_group_name = var.rg_name
}

data "azurerm_subnet" "integration_subnet" {
    name = "integration_subnet"
    virtual_network_name = data.azurerm_virtual_network.vnet.name
    resource_group_name = data.azurerm_resource_group.my_assigned_rg.name
}

data "azurerm_subnet" "private_endpoint_subnet" {
  name = "private_endpoint_subnet"
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  resource_group_name = data.azurerm_resource_group.my_assigned_rg.name
}

