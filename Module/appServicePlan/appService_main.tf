
# creating app service plan

resource "azurerm_service_plan" "app_service_plan" {
  for_each = var.app_service_plan

  name                = each.key
  resource_group_name = var.rg_name
  location            = var.rg_location 
  os_type             = each.value.os_type
  sku_name            = each.value.sku_name
  tags = var.tags
}

