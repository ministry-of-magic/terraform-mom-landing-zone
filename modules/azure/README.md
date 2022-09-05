## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | ~> 2.15.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | =3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | ~> 2.15.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | =3.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azuread_application.this](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application) | resource |
| [azuread_service_principal.this](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/service_principal) | resource |
| [azuread_service_principal_password.this](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/service_principal_password) | resource |
| [azurerm_key_vault.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/key_vault) | resource |
| [azurerm_key_vault_access_policy.landing_zone_service_principal](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/key_vault_access_policy) | resource |
| [azurerm_key_vault_access_policy.manage_service_principal](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/key_vault_access_policy) | resource |
| [azurerm_key_vault_secret.service_principal_id](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.service_principal_secret](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/key_vault_secret) | resource |
| [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/resource_group) | resource |
| [azurerm_role_assignment.landing_zone_service_principal](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/resources/role_assignment) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.0/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service_principal"></a> [service\_principal](#output\_service\_principal) | n/a |
