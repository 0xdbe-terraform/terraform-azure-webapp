output "managed_identity_id" {
  value = azurerm_app_service.main.identity[0].principal_id
}

