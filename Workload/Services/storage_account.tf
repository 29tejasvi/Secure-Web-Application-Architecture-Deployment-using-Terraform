
module "storageAccount" {
  source = "../../Module/storageAccount"
  rg_location = data.azurerm_resource_group.my_assigned_rg.location
  rg_name = data.azurerm_resource_group.my_assigned_rg.name
  storage_account = var.storage_account
  tags = var.tags
}
