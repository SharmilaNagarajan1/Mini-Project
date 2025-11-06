variable "storage_account_name" {
  type = string
  default = ""
}

variable "location" {
  type = string
  default = "westus"
}

variable name_prefix {
  type = string
  default = "sa061125"
}

variable "account_replication_type" {
  type = string
  default = "LRS"
}