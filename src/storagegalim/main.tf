resource "azurerm_storage_account" "tfsorage" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  allow_nested_items_to_be_public = false


  tags = {
    environment = "prod"
  }
}

resource "azurerm_storage_container" "tfsorage" {
  name                  = "tfsorage"
  container_access_type = var.access_type
  storage_account_name  = var.storage_account_name
}