variable "rg_name" {
  type = string
}

variable "keyVault" {
  type = map(object({
    sku_name = string
    webapp_name = string
  }))
}


variable "storage_account" {
    type = map(object({
      account_tier = string
      account_replication_type = string

    }))
}

variable "keyvault_pep" {
  type = object({
    keyvault_name = string
    name                = string
    subresource_names   = string
    private_dns_zone    = string
    resource_group_name = string
    location            = string
  })
}

variable "storage_pep" {
  type = object({
    name                = string
    subresource_names   = string
    private_dns_zone    = string
    resource_group_name = string
    location            = string
  })
}


# variable "keyvault_secret" {
#   type = object({
#     kv_name = string
#     name = string
#     value = string
#   })
#   sensitive = true
# }

variable "tags" {
  type = map(string)

  default = {
    "costcentre" = "training"
    "workload" = "sandbox"
  }
}