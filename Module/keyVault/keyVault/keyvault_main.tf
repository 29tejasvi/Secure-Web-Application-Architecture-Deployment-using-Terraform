data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "keyvault" {
  for_each = var.keyVault

  name                = each.key
  location            = var.rg_location
  resource_group_name = var.rg_name
  tenant_id           = var.tenent_id
  sku_name            = each.value.sku_name

  public_network_access_enabled = false
 
  access_policy { 
    tenant_id = var.wapp_tenant_id
    object_id = "cae7e1b0-6ca8-4c98-9fa9-8f8be9590676"
    
    
    secret_permissions = ["Get", "List"]
    } 

  access_policy {
  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = data.azurerm_client_config.current.object_id

  secret_permissions = [
    "Get",
    "List",
    "Set"
  ]
}

tags = var.tags
}

