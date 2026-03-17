module "keyVault" {
  source = "../../Module/keyVault/keyVault"
  rg_location = data.azurerm_resource_group.my_assigned_rg.location
  rg_name = data.azurerm_resource_group.my_assigned_rg.name
  tenent_id = data.azurerm_client_config.current.tenant_id
  wapp_tenant_id = data.azurerm_linux_web_app.webapp1.identity[0].tenant_id
  wapp_object_id = data.azurerm_linux_web_app.webapp1.identity[0].principal_id
  keyVault = var.keyVault
  tags = var.tags
}

# module "keyvault_secret" {
#   source = "../../Module/keyVault/secret"
#   keyvault_id = module.keyVault.kv_rid[var.keyvault_secret.kv_name]
#   keyvault_secret = var.keyvault_secret
#   depends_on = [ module.keyVault ]
# }