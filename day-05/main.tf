terraform {
  required_version = ">= 1.9.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.8.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "tfstate-day04"
    storage_account_name = "day0415732"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "3b4e8ad6-c386-4898-a9c7-a427b44c7c9d"
  
}

variable "environment" {
    type = string
    description = "environment value"
    default = "staging"
}

locals {
  common_tags = {
    environment = "dev"
    lob = "banking"
    stage = "alpha"
  }
}




variable "location" {
  type = string
  description = "location"
  default = "West Europe"
}    
  

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = var.location
}

resource "azurerm_storage_account" "example" {
  name                     = "storageaccountsv1"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_replication_type = "GRS"
  account_tier             = "Standard"

  tags = {
    environment = local.common_tags.environment
  }
}
output "azurerm_storage_account" {
    value = azurerm_resource_group.example.id
  
}
