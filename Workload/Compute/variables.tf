variable "jump_vm" {
  type = object({
    name = string
    size = string
    rg_name = string
    vnet_name = string
    subnet_name = string
  })
}


