output "kv_rid" {
  value = {
    for k, v in azurerm_key_vault.keyvault:
    k => v.id
  }
}