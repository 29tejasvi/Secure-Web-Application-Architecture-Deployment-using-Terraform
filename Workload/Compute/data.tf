data "azurerm_resource_group" "assigned_rg" {
    name = var.jump_vm.rg_name
}

data "azurerm_virtual_network" "vnet" {
  name = var.jump_vm.vnet_name
  resource_group_name = data.azurerm_resource_group.assigned_rg.name
}

data "azurerm_subnet" "jump_host_subnet" {
  name = var.jump_vm.subnet_name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  resource_group_name = data.azurerm_resource_group.assigned_rg.name
}

data "azurerm_linux_web_app" "webapp" {
  name = "tfasp1stwebapp"
  resource_group_name = "Tejasvi-RG"
}

data "azurerm_key_vault" "kv" {
  name = "demo-tf-kv1234"
  resource_group_name = "Tejasvi-RG"
}

