module "keyvault_private_dns_zone"  {
  source = "../../Module/privateDnsZone"


  dns_zone_name       = var.keyvault_pep.private_dns_zone
  resource_group_name = var.rg_name
  vnet_id             = data.azurerm_virtual_network.vnet.id

  depends_on = [ module.keyVault ]
  
}




module "privateEndpoint_keyvault" {
    source = "../../Module/networkServices/privateEndpoint"

    peName = var.keyvault_pep.name
    peSubnetId = data.azurerm_subnet.private_endpoint_subnet.id
    location = data.azurerm_resource_group.my_assigned_rg.location
    rgName = data.azurerm_resource_group.my_assigned_rg.name
    
    subresourceNames = var.keyvault_pep.subresource_names

    privateDnsZoneGroupIds = module.keyvault_private_dns_zone.dns_zone_id
    privateResourceId = module.keyVault.kv_rid[var.keyvault_pep.keyvault_name]

    depends_on = [ module.keyvault_private_dns_zone ]

}