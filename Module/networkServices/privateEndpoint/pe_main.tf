resource "azurerm_private_endpoint" "pep" {
  name                          = var.peName
  location                      = var.location
  resource_group_name           = var.rgName
  subnet_id                     = var.peSubnetId
  

  private_service_connection {
    name                           = "psc-${var.peName}"
    private_connection_resource_id = var.privateResourceId
    subresource_names              = [var.subresourceNames]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "${var.subresourceNames}-dns-zone-group"
    private_dns_zone_ids = [var.privateDnsZoneGroupIds]
  }

  tags = var.tags
}

