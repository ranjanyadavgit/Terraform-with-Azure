terraform {
  
     required_providers {
       azurerm = {
             source = "hashicorp/azurerm"
             version = "~>4.8.0"
       }
     }
     required_version = ">=1.9.0"
}

provider "azurerm" {
    features {
      
    }
  
}




resource "azurerm_resource_group" "example" {
 name = "example-resource"
 location = "West Europe"
  
}

resource "azurerm_storage_account" "example" {
    name = "storageaccounts2"
    resource_group_name = azurerm_resource_group.example.name
    location = azurerm_resource_group.example.location
    account_replication_type = "GRS"
    account_tier = "Standard"

    tags = {
        environment = "staging"
    }

}
