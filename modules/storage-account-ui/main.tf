resource "azurerm_storage_account" "storageui" {
  name                     = var.storage_name
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_account_static_website" "ui" {
  storage_account_id = azurerm_storage_account.storageui.id
  error_404_document = "not_found.html"
  index_document     = "index.html"
}