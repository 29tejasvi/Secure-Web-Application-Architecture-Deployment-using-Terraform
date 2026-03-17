

module "vnet" {
  source = "../../Module/networkServices/vnet"
  rg_name = data.azurerm_resource_group.my_assigned_rg.name
  rg_location = data.azurerm_resource_group.my_assigned_rg.location
  network_environment = var.network_environment
  tags = var.tags
}
