resource "azurerm_key_vault_secret" "secret" {
  name         = var.keyvault_secret.name
  value        = var.keyvault_secret.value
  key_vault_id = var.keyvault_id
}