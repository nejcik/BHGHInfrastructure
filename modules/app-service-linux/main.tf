resource "azurerm_service_plan" "svc_plan" {
  name                = "svc_plan"
  resource_group_name = var.rg_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_web_app" "webapp" {
  name                = var.name
  resource_group_name = var.rg_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.svc_plan.id

  site_config {}
}