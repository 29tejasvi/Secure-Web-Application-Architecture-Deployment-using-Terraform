data "azurerm_virtual_machine" "vm" {
  name = "jump-host-vm"
  resource_group_name = var.rg_name
}

data "azurerm_linux_web_app" "webapp" {
  name = "tfasp1stwebapp"
  resource_group_name = "Tejasvi-RG"
}

resource "null_resource" "webapp_deploy" {
  
  connection {
    type     = "ssh"
    host     = data.azurerm_virtual_machine.vm.public_ip_address
    user     = "azureuser"
    password = "Password123!"
  }

  # Install tools
  provisioner "remote-exec" {

  inline = [

    "sleep 60",

    "sudo DEBIAN_FRONTEND=noninteractive apt-get update -y",

    "sudo DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs npm zip curl",

    "curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash",

    "mkdir -p /home/azureuser/webapp"

  ]

}


  # Upload app files
  provisioner "file" {

    source      = "${path.module}/app/server.js"
    destination = "/home/azureuser/webapp/server.js"

  }

  provisioner "file" {

    source      = "${path.module}/app/package.json"
    destination = "/home/azureuser/webapp/package.json"

  }

  # Upload publish profile
  provisioner "file" {

    source      = "${path.module}/tfasp1stwebapp.PublishSettings"
    destination = "/home/azureuser/webapp/publishprofile.PublishSettings"

  }

  # Deploy application
 provisioner "remote-exec" {

  inline = [

    "cd /home/azureuser/webapp",

    "npm install",

    "zip -r app.zip . -x '*.zip'",

    # Extract credentials from publish profile
    "USER=$(grep userName publishprofile.PublishSettings | sed -n 's/.*userName=\"\\([^\"]*\\)\".*/\\1/p')",

    "PASS=$(grep userPWD publishprofile.PublishSettings | sed -n 's/.*userPWD=\"\\([^\"]*\\)\".*/\\1/p')",

    # Deploy using Kudu API
    "curl -X POST -u $USER:$PASS https://${data.azurerm_linux_web_app.webapp.name}.scm.azurewebsites.net/api/zipdeploy --data-binary @app.zip",

    "rm publishprofile.PublishSettings"
  ]

}

}