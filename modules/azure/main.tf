locals {
  location = {
    "australiaeast" = "aue",
  }

  prefix = format("%s-%s-%s", local.location[var.location], var.environment, var.project)
}

data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "this" {
  name     = format("mrg-%s", local.prefix)
  location = var.location
}

resource "azurerm_key_vault" "this" {
  name                = format("mkv-%s", local.prefix)
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  tenant_id           = data.azurerm_client_config.current.tenant_id

  sku_name = "standard"
}

resource "azuread_application" "this" {
  display_name = format("sp-%s-%s", var.project, var.environment)
  owners       = [data.azurerm_client_config.current.object_id]
}

resource "azuread_service_principal" "this" {
  application_id               = azuread_application.this.application_id
  app_role_assignment_required = false
  owners                       = [data.azurerm_client_config.current.object_id]
}

resource "azuread_service_principal_password" "this" {
  service_principal_id = azuread_service_principal.this.object_id
}

resource "azurerm_key_vault_secret" "service_principal_id" {
  name         = "service-principal-id"
  value        = azuread_service_principal.this.object_id
  key_vault_id = azurerm_key_vault.this.id

  depends_on = [
    azurerm_key_vault_access_policy.manage_service_principal
  ]
}

resource "azurerm_key_vault_secret" "service_principal_secret" {
  name         = "service-principal-secret"
  value        = azuread_service_principal_password.this.value
  key_vault_id = azurerm_key_vault.this.id

  depends_on = [
    azurerm_key_vault_access_policy.manage_service_principal
  ]
}

resource "azurerm_key_vault_access_policy" "manage_service_principal" {
  key_vault_id = azurerm_key_vault.this.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

  secret_permissions = [
    "Backup", "Delete", "Get", "List", "Purge", "Recover", "Restore", "Set"
  ]
}

resource "azurerm_key_vault_access_policy" "landing_zone_service_principal" {
  key_vault_id = azurerm_key_vault.this.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azuread_service_principal.this.object_id

  secret_permissions = [
    "List", "Get"
  ]
}

resource "azurerm_role_assignment" "landing_zone_service_principal" {
  scope                = azurerm_resource_group.this.id
  role_definition_name = "Contributor"
  principal_id         = azuread_service_principal.this.object_id
}