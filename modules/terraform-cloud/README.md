## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | ~> 0.33 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | ~> 0.33 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tfe_variable.azure_landing_zone_service_principal_id](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.azure_landing_zone_service_principal_secret](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.azure_subscription_id](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.azure_tenant_id](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_workspace.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace) | resource |
| [tfe_organization.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/data-sources/organization) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azure_landing_zone_service_principal"></a> [azure\_landing\_zone\_service\_principal](#input\_azure\_landing\_zone\_service\_principal) | n/a | <pre>object({<br>    client_id       = string<br>    client_secret   = string<br>    subscription_id = string<br>    tenant_id       = string<br>  })</pre> | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | n/a | yes |
| <a name="input_github"></a> [github](#input\_github) | n/a | <pre>object({<br>    repository_full_name = optional(string)<br>    branch               = optional(string, "master")<br>    ingress_submodules   = optional(bool, false)<br>    oauth_token_id       = optional(string)<br>  })</pre> | n/a | yes |
| <a name="input_is_vcs_enabled"></a> [is\_vcs\_enabled](#input\_is\_vcs\_enabled) | n/a | `bool` | `false` | no |
| <a name="input_organization"></a> [organization](#input\_organization) | n/a | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
