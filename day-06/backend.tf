terraform {
  

backend "azurerm" {
  resource_group_name  = "tfstate-day05"
  storage_account_name = "day0421617"
  container_name       = "tfstate"
  key                  = "dev.terraform.tfstate"
}
}
