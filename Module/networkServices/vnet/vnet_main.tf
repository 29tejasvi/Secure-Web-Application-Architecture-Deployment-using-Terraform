# creating virtual network

resource "azurerm_virtual_network" "vnet" {
  for_each = var.network_environment

  name = each.key
  resource_group_name = var.rg_name
  location = var.rg_location
  address_space = [each.value.address_space]
  tags = var.tags
}
# creating subnets
module "subnet" {
 source = "../subnet"
 rg_name = var.rg_name
 network_environment = var.network_environment
 
 depends_on = [ azurerm_virtual_network.vnet ]
}