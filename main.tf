provider "azurerm" {
  features {}
}

resource "azurerm_storage_account" "storage" {
  name                     = "vinstorageacctdemo"  # must be globally unique, lowercase, 3-24 chars
  resource_group_name       = "terraazure"         # your existing resource group name
  location                 = "eastus"              # location of the existing resource group
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "container" {
  name                  = "vin-container"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"  # or "blob" for public read
}
