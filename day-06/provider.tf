terraform {

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.8.0"
    }
  }

  required_version = ">= 1.9.0"
}
provider "azurerm" {
  features {}
  subscription_id = "3b4e8ad6-c386-4898-a9c7-a427b44c7c9d"
    }
    
