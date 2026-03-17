
module "jump_vm" {
  source = "../../Module/networkServices/virtualMachine/Linux"
  rg_location = data.azurerm_resource_group.assigned_rg.location
  rg_name = data.azurerm_resource_group.assigned_rg.name
  nic_id = module.jum_vm_nic.nic_id
  size = var.jump_vm.size
  vm_name = var.jump_vm.name

  depends_on = [ module.jum_vm_nic ]
}

