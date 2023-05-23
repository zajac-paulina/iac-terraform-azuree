resource "azurerm_resource_group" "bobl" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_storage_account" "bobl" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.bobl.name
  location                 = azurerm_resource_group.bobl.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
}

resource "azurerm_storage_container" "bobl" {
  name                  = var.storage_container_name
  storage_account_name  = azurerm_storage_account.bobl.name
  container_access_type = var.storage_container_access_type
}

resource "azurerm_storage_blob" "bobl" {
  name                   = var.storage_blob_name
  storage_account_name   = azurerm_storage_account.bobl.name
  storage_container_name = azurerm_storage_container.bobl.name
  type                   = var.storage_blob_type
  source                 = var.storage_blob_source
}
