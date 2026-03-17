module "storage_private_dns_zone" {
  source = "../../Module/privateDnsZone"
  dns_zone_name       = var.storage_pep.private_dns_zone
  resource_group_name = var.rg_name
  vnet_id             = data.azurerm_virtual_network.vnet.id

  depends_on = [ module.storageAccount ]
}


module "privateEndpoint" {
    source = "../../Module/networkServices/privateEndpoint"

    peName = var.storage_pep.name
    peSubnetId = data.azurerm_subnet.private_endpoint_subnet.id
    location = data.azurerm_resource_group.my_assigned_rg.location
    rgName = data.azurerm_resource_group.my_assigned_rg.name
    
    subresourceNames = var.storage_pep.subresource_names

    privateDnsZoneGroupIds = module.storage_private_dns_zone.dns_zone_id
    privateResourceId = module.storageAccount.sta_id

    depends_on = [ module.storage_private_dns_zone ]

}