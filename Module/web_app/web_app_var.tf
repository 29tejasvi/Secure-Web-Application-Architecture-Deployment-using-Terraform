variable "web_app" {
  description = "Configuration for Linux Web App"

  type = map(object({
    service_plan_name             = string
    https_only                    = bool
    public_network_access_enabled = bool
    integration_subnet            = string
  }))
}

variable "rg_location" {
    type = string
}

variable "rg_name" {
  type = string
}

variable "asp_ids" {
    type = map(string)
  
}

variable "tags" {
  type = map(string)

}