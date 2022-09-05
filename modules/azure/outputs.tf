output "service_principal" {
  sensitive = true
  
  value = {
    client_id = azuread_service_principal.this.object_id
    client_secret = azuread_service_principal_password.this.value
    subscription_id = data.azurerm_client_config.current.subscription_id
    tenant_id = data.azurerm_client_config.current.tenant_id
  }
}