variable "environment" {
  type = string
}

variable "is_vcs_enabled" {
  type    = bool
  default = false
}

variable "github" {
  type = object({
    repository_full_name = optional(string)
    branch               = optional(string, "master")
    ingress_submodules   = optional(bool, false)
    oauth_token_id       = optional(string)
  })

  nullable = true

  # default = null
}

variable "project" {
  type = string
}

variable "organization" {
  type = string
}

variable "azure_landing_zone_service_principal" {
  type = object({
    client_id       = string
    client_secret   = string
    subscription_id = string
    tenant_id       = string
  })
}
