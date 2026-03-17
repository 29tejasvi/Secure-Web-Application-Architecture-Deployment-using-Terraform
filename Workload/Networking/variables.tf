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
  default = "Tejasvi-RG"
}

variable "tags" {
  type = map(string)

  default = {
    "costcentre" = "training"
    "workload" = "sandbox"
  }
}