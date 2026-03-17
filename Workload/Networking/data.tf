
# fetch the resource group details

data "azurerm_resource_group" "my_assigned_rg" {
  name = var.rg_name
}