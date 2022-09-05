## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_github"></a> [github](#requirement\_github) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | ~> 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [github_actions_environment_secret.client_id](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/actions_environment_secret) | resource |
| [github_actions_environment_secret.client_secret](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/actions_environment_secret) | resource |
| [github_actions_environment_secret.subscription_id](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/actions_environment_secret) | resource |
| [github_actions_environment_secret.tenant_id](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/actions_environment_secret) | resource |
| [github_actions_secret.azure_landing_zone_service_principal_id](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/actions_secret) | resource |
| [github_actions_secret.azure_landing_zone_service_principal_secret](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/actions_secret) | resource |
| [github_actions_secret.azure_subscription_id](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/actions_secret) | resource |
| [github_actions_secret.azure_tenant_id](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/actions_secret) | resource |
| [github_branch_protection_v3.this](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/branch_protection_v3) | resource |
| [github_repository.this](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/repository) | resource |
| [github_repository_environment.this](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/repository_environment) | resource |
| [github_repository_file.codeowners](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/repository_file) | resource |
| [github_repository_file.terraform](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/repository_file) | resource |
| [github_team.this](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/team) | resource |
| [github_team_members.this](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/team_members) | resource |
| [github_team_repository.this](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/team_repository) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azure_landing_zone_service_principal"></a> [azure\_landing\_zone\_service\_principal](#input\_azure\_landing\_zone\_service\_principal) | n/a | <pre>map(object({<br>    client_id       = string<br>    client_secret   = string<br>    subscription_id = string<br>    tenant_id       = string<br>  }))</pre> | n/a | yes |
| <a name="input_members"></a> [members](#input\_members) | n/a | `map(string)` | n/a | yes |
| <a name="input_organization"></a> [organization](#input\_organization) | n/a | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_repository_full_name"></a> [repository\_full\_name](#output\_repository\_full\_name) | n/a |
