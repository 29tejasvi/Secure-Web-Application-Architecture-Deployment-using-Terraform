variable "rg_location" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "tenent_id" {
  type = string
}

variable "keyVault" {
  type = map(object({
    sku_name = string
    webapp_name = string
  }))
}

variable "wapp_tenant_id" {
  type = string
}

variable "wapp_object_id" {
  type = string
}

variable "tags" {
  type = map(string)

  default = {
    "costcentre" = "training"
    "workload" = "sandbox"
  }
}