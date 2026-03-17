module "vm_public_ip" {
  
  source = "../../Module/publicIp"
  rg_name = data.azurerm_resource_group.assigned_rg.name
  ip_name = "${var.jump_vm.name}-pbIp"
  location = data.azurerm_resource_group.assigned_rg.location
}
