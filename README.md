## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | ~> 2.15.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | =3.0.0 |
| <a name="requirement_github"></a> [github](#requirement\_github) | ~> 4.0 |
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | ~> 0.33 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_azure_landing_zone"></a> [azure\_landing\_zone](#module\_azure\_landing\_zone) | ./modules/azure | n/a |
| <a name="module_github"></a> [github](#module\_github) | ./modules/github | n/a |
| <a name="module_global"></a> [global](#module\_global) | ./modules/global | n/a |
| <a name="module_terraform_workspace"></a> [terraform\_workspace](#module\_terraform\_workspace) | ./modules/terraform-cloud | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environments"></a> [environments](#input\_environments) | (Optional)  Environments to provision for the landing zone.<br><br>    [Default: '["dev", "stg", "prd"]'] | `list(string)` | <pre>[<br>  "dev",<br>  "stg",<br>  "prd"<br>]</pre> | no |
| <a name="input_location"></a> [location](#input\_location) | (Optional)  The location where the landing zone will be produced.<br><br>    [Default: 'australieast'] | `string` | `"australiaeast"` | no |
| <a name="input_project"></a> [project](#input\_project) | (Required)  The project acronym to use for the landing zone(s). This should be no longer than<br>    4 characters.<br><br>    Example: 'blt' | `string` | n/a | yes |
| <a name="input_users"></a> [users](#input\_users) | (Required)  Map of users and their role to provision access to the landing zone this should be<br>    the users GitHub username. Valid roles are:<br>      'maintainer'<br>      'member'<br><br>    Example: `{"BrendanThompson" = "member"}` | `map(string)` | n/a | yes |

## Outputs

No outputs.
