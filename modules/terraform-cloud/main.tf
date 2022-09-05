data "tfe_organization" "this" {
  name = var.organization
}

resource "tfe_workspace" "this" {
  name              = format("%s-%s-app", var.project, var.environment)
  organization      = data.tfe_organization.this.name
  terraform_version = "~> 1.0.0"

  working_directory = "terraform/"

  dynamic "vcs_repo" {
    for_each = var.is_vcs_enabled ? { enabled = true} : {}

    content {
      identifier = var.github.repository_full_name
      branch = var.github.branch
      ingress_submodules = var.github.ingress_submodules
      oauth_token_id = var.github.oauth_token_id
    }
  }

  tag_names = [
    format("environment:%s", var.environment),
    format("project:%s", var.project)
  ]
}

resource "tfe_variable" "azure_subscription_id" {
  workspace_id = tfe_workspace.this.id
  category     = "env"

  key   = "ARM_SUBSCRIPTION_ID"
  value = var.azure_landing_zone_service_principal.subscription_id
}

resource "tfe_variable" "azure_tenant_id" {
  workspace_id = tfe_workspace.this.id
  category     = "env"

  key   = "ARM_TENANT_ID"
  value = var.azure_landing_zone_service_principal.tenant_id
}

resource "tfe_variable" "azure_landing_zone_service_principal_id" {
  workspace_id = tfe_workspace.this.id
  category     = "env"

  key   = "ARM_CLIENT_ID"
  value = var.azure_landing_zone_service_principal.client_id
}

resource "tfe_variable" "azure_landing_zone_service_principal_secret" {
  workspace_id = tfe_workspace.this.id
  category     = "env"

  key   = "ARM_CLIENT_SECRET"
  value = var.azure_landing_zone_service_principal.client_secret
}
