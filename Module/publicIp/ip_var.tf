variable "location" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "ip_name" {
  type = string
}

variable "tags" {
  type = map(string)

  default = {
    "costcentre" = "training"
    "workload" = "sandbox"
  }
}