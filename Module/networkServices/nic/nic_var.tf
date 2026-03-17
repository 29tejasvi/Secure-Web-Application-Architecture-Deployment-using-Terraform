variable "rg_name" {
  type = string
}

variable "rg_location" {
  type = string
}

variable "nic_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "public_ip_id" {
  type = string
}

variable "tags" {
  type = map(string)

  default = {
    "costcentre" = "training"
    "workload" = "sandbox"
  }
}