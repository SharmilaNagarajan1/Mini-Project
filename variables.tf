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
  default = "06112025"
}

variable "account_replication_type" {
  type = string
  default = "LRS"
}