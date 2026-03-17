variable "keyvault_secret" {
  type = object({
    kv_name = string
    name = string
    value = string
  })
}

variable "keyvault_id" {
  type = string
}