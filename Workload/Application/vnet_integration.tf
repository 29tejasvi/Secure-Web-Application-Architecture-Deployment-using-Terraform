resource "azurerm_app_service_virtual_network_swift_connection" "webapp_vnet" {
  for_each = var.web_app

  app_service_id = module.web_app.webApp_ids[each.key]
  subnet_id      = data.azurerm_subnet.integration_subnet.id

  depends_on = [ module.web_app ]
  
}



