variable "rg_name" {
    type = string  
}

variable "rg_location" {
    type = string
}


variable "app_service_plan" {
    type = map(object({
      os_type = string
      sku_name = string 
    }))
}

variable "tags" {
  type = map(string)

  default = {
    "costcentre" = "training"
    "workload" = "sandbox"
  }
}