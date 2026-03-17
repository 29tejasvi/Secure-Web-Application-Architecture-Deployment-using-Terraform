variable "rg_name" {
  type = string
}

variable "rg_location" {
  type = string
}

variable "storage_account" {
    type = map(object({
      account_tier = string
      account_replication_type = string
    }))
}

variable "tags" {
  type = map(string)

  default = {
    "costcentre" = "training"
    "workload" = "sandbox"
  }
}