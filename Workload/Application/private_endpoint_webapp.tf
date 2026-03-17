resource "azurerm_private_dns_zone" "webapp_dns" {
  name                = "privatelink.azurewebsites.net"
  resource_group_name = var.rg_name
  depends_on = [ module.web_app ]
  tags = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "webapp_dns_link" {
  name                  = "webapp-dns-link"
  resource_group_name   = data.azurerm_resource_group.my_assigned_rg.name
  private_dns_zone_name = azurerm_private_dns_zone.webapp_dns.name
  virtual_network_id    = data.azurerm_virtual_network.vnet.id

  depends_on = [ azurerm_private_dns_zone.webapp_dns ]
  tags = var.tags
}


resource "azurerm_private_endpoint" "webapp_pe" {

  for_each = var.web_app

  name                = "${each.key}-pe"
  location            = data.azurerm_resource_group.my_assigned_rg.location
  resource_group_name = data.azurerm_resource_group.my_assigned_rg.name
  subnet_id           = data.azurerm_subnet.private_endpoint_subnet.id

  private_service_connection {
    name                           = "webapp-connection"
    private_connection_resource_id = module.web_app.webApp_ids[each.key]
    subresource_names              = ["sites"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
  name                 = "webapp-dns-zone-group"
  private_dns_zone_ids = [azurerm_private_dns_zone.webapp_dns.id]
}

  depends_on = [ azurerm_private_dns_zone_virtual_network_link.webapp_dns_link ]

  tags = var.tags
}