module "storageacc" {
  source            = "app.terraform.io/Sharmila/storageacc/azurerm"
  version           = "1.0.0"
  name_prefix       = "06112025"  
  location          = var.location
  account_replication_type = "LRS"
}