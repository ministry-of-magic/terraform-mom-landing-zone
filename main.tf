module "global" {
  source = "./modules/global"
}

module "azure_landing_zone" {
  for_each = toset(var.environments)

  source = "./modules/azure"

  environment = each.value
  project     = var.project
  location    = var.location
}

module "github" {
  source = "./modules/github"

  project                              = var.project
  organization                         = module.global.github.organization
  azure_landing_zone_service_principal = {
    for e in var.environments:
    e => module.azure_landing_zone[e].service_principal
  }
  members = var.users
}

module "terraform_workspace" {
  for_each = toset(var.environments)

  source = "./modules/terraform-cloud"

  environment                          = each.value
  project                              = var.project
  organization                         = module.global.terraform.organization
  azure_landing_zone_service_principal = module.azure_landing_zone[each.value].service_principal
  is_vcs_enabled                       = each.value == "dev" ? true : false

  github = each.value == "dev" ? {
    repository_full_name = module.github.repository_full_name
    oauth_token_id       = module.global.terraform.oauth_token_id
  } : null
}
