variable "rg_name" {
  type = string
}

variable "app_service_plan" {
    type = map(object({
      os_type = string
      sku_name = string 
    }))

}

variable "web_app" {
  description = "Configuration for Linux Web App"

  type = map(object({
    service_plan_name             = string
    https_only                    = bool
    public_network_access_enabled = bool
    integration_subnet            = string
  }))
}

variable "tags" {
  type = map(string)

  default = {
    "costcentre" = "training"
    "workload" = "sandbox"
  }
}