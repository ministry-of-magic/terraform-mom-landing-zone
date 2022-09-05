resource "github_repository" "this" {
  name        = var.project
  description = ""

  visibility = "public"
  auto_init  = true
}

resource "github_team" "this" {
  name = var.project
}

resource "github_team_repository" "this" {
  team_id    = github_team.this.id
  repository = github_repository.this.name
  permission = "maintain"
}

resource "github_team_members" "this" {
  team_id = github_team.this.id

  dynamic "members" {
    for_each = var.members

    content {
      username = members.key
      role     = members.value
    }
  }
}

resource "github_branch_protection_v3" "this" {
  repository     = github_repository.this.name
  branch         = "master"
  enforce_admins = true

  required_pull_request_reviews {
    require_code_owner_reviews = true
  }

  depends_on = [
    //NOTE: Depends on files being written to prevent the initial files being subjected to PR
    github_repository_file.codeowners,
    github_repository_file.terraform
  ]
}

resource "github_repository_file" "codeowners" {
  repository = github_repository.this.name
  branch     = "master"
  file       = ".github/CODEOWNERS"
  content = templatefile(
    format("%s/templates/codeowners.tftpl", path.module),
    {
      team         = github_team.this.slug,
      organization = var.organization
    }
  )

  commit_message      = "feat: add codeowners"
  commit_author       = "Terraform"
  commit_email        = "terraform@ministry-of-magic.com"
  overwrite_on_create = true
}

resource "github_repository_file" "terraform" {
  for_each = {
    for file in fileset(
      path.module,
      "templates/terraform/*.tftpl"
    ) :
    basename(file) => file
  }

  repository = github_repository.this.name
  branch     = "master"
  file = format(
    "terraform/%s",
    replace(each.key, "tftpl", "tf")
  )
  content = templatefile(
    format("%s/%s", path.module, each.value),
    {}
  )

  commit_message      = "feat: default terraform files"
  commit_author       = "Terraform"
  commit_email        = "terraform@ministry-of-magic.com"
  overwrite_on_create = true
}

//NOTE: The below implementation is for non-GHE instances
resource "github_actions_secret" "azure_tenant_id" {
  for_each = var.azure_landing_zone_service_principal

  repository      = github_repository.this.name
  secret_name     = format("ARM_TENANT_ID_%s", upper(each.key))
  plaintext_value = each.value.tenant_id
}

resource "github_actions_secret" "azure_subscription_id" {
  for_each = var.azure_landing_zone_service_principal

  repository      = github_repository.this.name
  secret_name     = format("ARM_SUBSCRIPTION_ID_%s", upper(each.key))
  plaintext_value = each.value.subscription_id
}

resource "github_actions_secret" "azure_landing_zone_service_principal_id" {
  for_each = var.azure_landing_zone_service_principal

  repository      = github_repository.this.name
  secret_name     = format("ARM_CLIENT_ID_%s", upper(each.key))
  plaintext_value = each.value.client_id
}

resource "github_actions_secret" "azure_landing_zone_service_principal_secret" {
  for_each = var.azure_landing_zone_service_principal

  repository      = github_repository.this.name
  secret_name     = format("ARM_CLIENT_SECRET_%s", upper(each.key))
  plaintext_value = each.value.client_secret
}

//NOTE: The following implementation requires GHE
resource "github_repository_environment" "this" {
  for_each = var.azure_landing_zone_service_principal

  environment = each.key
  repository  = github_repository.this.name
}

resource "github_actions_environment_secret" "tenant_id" {
  for_each = github_repository_environment.this

  repository      = github_repository.this.name
  environment     = each.value.environment
  secret_name     = "ARM_TENANT_ID"
  plaintext_value = var.azure_landing_zone_service_principal[each.value.environment].tenant_id

}

resource "github_actions_environment_secret" "subscription_id" {
  for_each = github_repository_environment.this

  repository      = github_repository.this.name
  environment     = each.value.environment
  secret_name     = "ARM_SUBSCRIPTION_ID"
  plaintext_value = var.azure_landing_zone_service_principal[each.value.environment].subscription_id

}

resource "github_actions_environment_secret" "client_id" {
  for_each = github_repository_environment.this

  repository      = github_repository.this.name
  environment     = each.value.environment
  secret_name     = "ARM_CLIENT_ID"
  plaintext_value = var.azure_landing_zone_service_principal[each.value.environment].client_id

}

resource "github_actions_environment_secret" "client_secret" {
  for_each = github_repository_environment.this

  repository      = github_repository.this.name
  environment     = each.value.environment
  secret_name     = "ARM_CLIENT_SECRET"
  plaintext_value = var.azure_landing_zone_service_principal[each.value.environment].client_secret

}

//TODO: GH repo main branch build DEV
