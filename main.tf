
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "example-rg"
  location = "eastus"  # ✅ Correct casing from your az CLI output
}

resource "azurerm_storage_account" "storage" {
  name                     = "vinstorageacctdemo"   # Must be globally unique
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "container" {
  name                  = "vin-container"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"
}
