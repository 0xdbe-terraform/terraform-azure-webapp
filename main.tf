resource "azurerm_app_service_plan" "main" {

  name                = "plan-${var.application_short_name}-${var.application_environment}"
  location            = var.azure_location
  resource_group_name = var.resource_group_name
  kind                = "Linux"
  reserved            = true
  
  sku {
    tier = "Free"
    size = "F1"
  }

} 

resource "azurerm_app_service" "main" {

  name                = "app-${var.application_short_name}-${var.application_environment}"
  location            = var.azure_location
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.main.id
  https_only          = true
  
  identity {
    type = "SystemAssigned"
  }
  
  site_config {
    linux_fx_version          = "NODE|12-lts"
    scm_type                  = "LocalGit"
    use_32_bit_worker_process = true
  }
  
}