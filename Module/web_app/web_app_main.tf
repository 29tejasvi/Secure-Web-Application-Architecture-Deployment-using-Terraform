resource "azurerm_linux_web_app" "webapp" {
  for_each = var.web_app

  name                = each.key
  resource_group_name = var.rg_name
  location            = var.rg_location
  service_plan_id     = var.asp_ids[each.value.service_plan_name]

  https_only = each.value.https_only

  public_network_access_enabled = each.value.public_network_access_enabled

  tags = var.tags
  

  identity {
    type = "SystemAssigned"
  }

  site_config {
    application_stack {
      node_version = "20-lts"
    }
  }

  app_settings = {
    DEMO_SECRET = "@Microsoft.KeyVault(SecretUri=https://demo-tf-kv1234.vault.azure.net/secrets/my-secrettf)"
  }

}


# Web App
#    ↓
# Managed Identity
#    ↓
# Key Vault access policy
#    ↓
# Fetch secret