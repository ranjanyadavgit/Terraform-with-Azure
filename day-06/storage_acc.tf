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




    
