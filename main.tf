provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "example-rg"
  location = "East US"
}
resource "azurerm_storage_account" "storage" {
  name                     = "vinstorageacctdemo"        # must be globally unique, 3–24 lowercase letters/numbers
  resource_group_name      = example-rg
  location                 = East US
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
resource "azurerm_storage_container" "container" {
  name                  = "vin-container"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"   # or "blob" for public read
}
