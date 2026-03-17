variable "peName" {
  description = "The name of the Azure Private Endpoint."
  type        = string
}
variable "location" {
  description = "The Azure region where the Private Endpoint will be created."
  type        = string
}
variable "rgName" {
  description = "The name of the resource group in which to create the Azure Private Endpoint."
  type        = string
}
variable "peSubnetId" {
  description = "The ID of the subnet in which to place the Private Endpoint."
  type        = string
}

variable "privateResourceId" {
  description = "The resource ID of the private resource to connect to."
  type        = string
}

variable "subresourceNames" {
  description = "A list of subresource names associated with the private connection."
  type        = string
}



variable "privateDnsZoneGroupIds" {
  description = "A list of private DNS zones associated with the Private Endpoint."
  type        = string
}

variable "tags" {
  type = map(string)

  default = {
    "costcentre" = "training"
    "workload" = "sandbox"
  }
}

