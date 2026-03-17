variable "rg_name" {
  type = string
}

variable "rg_location" {
  type = string
}

variable "vm_name" {
  type = string
}

variable "nic_id" {
  type = string
}

variable "size" {
  type = string
}

variable "tags" {
  type = map(string)

  default = {
    "costcentre" = "training"
    "workload" = "sandbox"
  }
}