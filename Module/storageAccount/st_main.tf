resource "azurerm_storage_account" "storage" {
  name                     = "tejasvistorage123"
  resource_group_name      = var.rg_name
  location                 = var.rg_location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  public_network_access_enabled = false

  tags = var.tags
}