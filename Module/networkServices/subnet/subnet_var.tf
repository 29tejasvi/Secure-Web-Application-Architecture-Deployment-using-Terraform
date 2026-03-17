variable "network_environment" {
  type = map(object({
    address_space = string
    subnets       = map(object({
        address_prefixes = string
        pep_policy = string
        delegation = string
    }))
  }))
}

variable "rg_name" {
    type = string  
}
