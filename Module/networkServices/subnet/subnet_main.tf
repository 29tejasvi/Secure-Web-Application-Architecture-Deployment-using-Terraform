# creating subnets

locals {
  subnet_list = flatten([
    for vnet_key, vnet_value in var.network_environment:[
        for subnet_key, subnet_value in vnet_value.subnets:{
            key = "${vnet_key}-${subnet_key}"
            subnet_name = subnet_key
            vnet_name = vnet_key
            address_prefixes = subnet_value.address_prefixes
            pep_policy = subnet_value.pep_policy
            delegation = subnet_value.delegation
        }
    ]
  ])

  subnets = {
    for subnet in local.subnet_list:
    subnet.key => {
        vnet_name = subnet.vnet_name
        subnet_name = subnet.subnet_name
        address_prefixes = subnet.address_prefixes
        pep_policy = subnet.pep_policy
        delegation = subnet.delegation
    }
  }
}



resource "azurerm_subnet" "subnets" {
  for_each = local.subnets

  name = each.value.subnet_name
  resource_group_name = var.rg_name
  virtual_network_name = each.value.vnet_name

  address_prefixes = [each.value.address_prefixes]
  private_endpoint_network_policies = each.value.pep_policy
  
  # private_endpoint_network_policies = "Disabled" is used in an Azure subnet to allow Private Endpoints to be deployed in that subnet.

  dynamic "delegation" {
    for_each = each.value.delegation != "" ? [each.value.delegation] : []

    content {
      name = "${each.value.subnet_name}-delegation"

      service_delegation {
        name = each.value.delegation == "appservice" ? "Microsoft.Web/serverFarms" : ""
        actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
        "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"
        ]
      }
    }
  }
}