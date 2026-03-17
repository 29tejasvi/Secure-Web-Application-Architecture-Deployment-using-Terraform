


# resource "azurerm_linux_virtual_machine" "jump_vm" {
#   name                = var.vm_name
#   resource_group_name = var.rg_name
#   location            = var.rg_location
#   size                = var.size
#   admin_username      = "azureuser"

#   network_interface_ids = [
#     var.nic_id
#   ]

#   admin_password                  = "Password123!"
#   disable_password_authentication = false

#   # Enable Managed Identity
#   identity {
#     type = "SystemAssigned"
#   }

#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }

#   source_image_reference {
#     publisher = "Canonical"
#     offer     = "0001-com-ubuntu-server-jammy"
#     sku       = "22_04-lts"
#     version   = "latest"
#   }

#   connection {
#     type     = "ssh"
#     user     = "azureuser"
#     password = "Password123!"
#     host     = self.public_ip_address
#   }

#   # Install required tools
#   provisioner "remote-exec" {
#     inline = [
#       "sudo apt update",
#       "sudo apt install -y nodejs npm zip",
#       "curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash",
#       "mkdir -p /home/azureuser/webapp"
#     ]
#   }

#   # Upload application files
#   provisioner "file" {
#     source      = "${path.module}/app/server.js"
#     destination = "/home/azureuser/webapp/server.js"
#   }

#   provisioner "file" {
#     source      = "${path.module}/app/package.json"
#     destination = "/home/azureuser/webapp/package.json"
#   }

#   # Deploy application

#  provisioner "remote-exec" {
#   inline = [
#     "cd /home/azureuser/webapp",

#     # install node dependencies
#     "npm install",

#     # create deployment zip
#     "zip -r app.zip . -x '*.zip'",

#     # login using VM managed identity
#     "az login --identity",

#     # deploy code
#     "az webapp deployment source config-zip --resource-group ${var.rg_name} --name ${var.webapp_name} --src app.zip"
#   ]
# }
# }


resource "azurerm_linux_virtual_machine" "jump_vm" {

  name                = var.vm_name
  resource_group_name = var.rg_name
  location            = var.rg_location
  size                = var.size

  admin_username = "azureuser"
  admin_password = "Password123!"

  disable_password_authentication = false

  network_interface_ids = [
    var.nic_id
  ]

  identity {
    type = "SystemAssigned"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
 
  tags = var.tags
  
}