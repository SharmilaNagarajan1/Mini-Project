module "storageacc" {
  source            = "app.terraform.io/Sharmila/storageacc/azurerm"
  version           = "1.0.0"
  name_prefix       =  var.name_prefix
  location          = var.location
  account_replication_type = var.account_replication_type
}