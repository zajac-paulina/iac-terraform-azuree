# Zasób azurerm_resource_group
resource "azurerm_resource_group" "azur" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

# Zasób azurerm_storage_account
variable "storage_account_tier" {
  default = ""
}
variable "storage_account_replication_type" {
  default = ""
}
resource "azurerm_storage_account" "azur" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.azur.name
  location                 = azurerm_resource_group.azur.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
}

# Zasób azurerm_app_service_plan
variable "app_service_plan_name" {
  default = ""
}
variable "app_service_plan_kind" {
  default = ""
}
variable "app_service_plan_sku_tier" {
  default = ""
}
variable "app_service_plan_sku_size" {
  default = ""
}
resource "azurerm_app_service_plan" "azur" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.azur.location
  resource_group_name = azurerm_resource_group.azur.name
  kind                = var.app_service_plan_kind
  sku {
    tier = var.app_service_plan_sku_tier
    size = var.app_service_plan_sku_size
  }
}

# Zasób azurerm_linux_function_app
variable "function_app_name" {
  default = ""
}
resource "azurerm_linux_function_app" "azur" {
  name                      = var.function_app_name
  location                  = azurerm_resource_group.azur.location
  resource_group_name       = azurerm_resource_group.azur.name
  app_service_plan_id       = azurerm_app_service_plan.azur.id
  storage_account_name      = azurerm_storage_account.azur.name
  storage_account_access_key = azurerm_storage_account.azur.primary_access_key
  service_plan_id = ""
  site_config {}
}

# Zasób azurerm_function_app_function
variable "function_name" {
  default = ""
}
variable "function_script_root_path" {
  default = ""
}
variable "function_script_file" {
  default = ""
}
variable "function_storage_account_share" {
  default = ""
}
resource "azurerm_function_app_function" "azur" {
  name                  = var.function_name
  function_app_id       = azurerm_linux_function_app.azur.id
  resource_group_name   = azurerm_resource_group.azur.name
  script_root_path      = var.function_script_root_path
  script_file           = var.function_script_file
  storage_account_name  = azurerm_storage_account.azur.name
  storage_account_key   = azurerm_storage_account.azur.primary_access_key
  storage_account_share = var.function_storage_account_share
  config_json           = ""
}
