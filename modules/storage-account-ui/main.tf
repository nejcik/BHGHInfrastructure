
resource "azurerm_storage_account" "storageui" {
  name                     = "examplestoracc"
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "container" {
  name                  = "web"
  storage_account_name  = azurerm_storage_account.storageui.name
  container_access_type = "private"
}