resource "azurerm_resource_group" "app" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_app_service_plan" "app" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.app.location
  resource_group_name = azurerm_resource_group.app.name
  sku {
    tier = var.app_service_plan_sku_tier
    size = var.app_service_plan_sku_size
  }
}

resource "azurerm_app_service" "app" {
  name                = var.app_service_name
  location            = azurerm_resource_group.app.location
  resource_group_name = azurerm_resource_group.app.name
  app_service_plan_id = azurerm_app_service_plan.app.id

  site_config {
    dotnet_framework_version = var.app_service_dotnet_framework_version
    app_command_line         = var.app_service_app_command_line
  }
}
