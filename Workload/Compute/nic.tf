

module "jum_vm_nic" {
  source = "../../Module/networkServices/nic"
  nic_name = "${var.jump_vm.name}-nic"
  rg_location = data.azurerm_resource_group.assigned_rg.location
  rg_name = data.azurerm_resource_group.assigned_rg.name
  subnet_id = data.azurerm_subnet.jump_host_subnet.id
  public_ip_id = module.vm_public_ip.public_ip_id

}

resource "azurerm_network_security_group" "nsg" {
    name = "jump-host-nsg"
    resource_group_name = data.azurerm_resource_group.assigned_rg.name
    location = data.azurerm_resource_group.assigned_rg.location

    security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }
}


resource "azurerm_network_interface_security_group_association" "nsg-association" {
  network_security_group_id = azurerm_network_security_group.nsg.id
  network_interface_id = module.jum_vm_nic.nic_id
}