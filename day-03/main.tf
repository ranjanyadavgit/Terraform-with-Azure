terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.37.0"
    }
  }
required_version = ">=1.9.0"
}

provider "azurerm" {
  # Configuration options
  features {}
  
}
resource "azurerm_resource_group" "example" {
  name     = "example-resourcy"
  location = "West Europe"
}



  resource "azurerm_storage_account" "example" {
    name = "ranjan111"
    resource_group_name = azurerm_resource_group.example.name
    location = azurerm_resource_group.example.location
    account_replication_type = "LRS"
    account_tier = "Standard"

    tags = {
        environment = "prod"
    }

}
