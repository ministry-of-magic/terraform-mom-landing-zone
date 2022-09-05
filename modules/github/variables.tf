variable "project" {
  type = string
}

variable "organization" {
  type = string
}

variable "members" { 
  type = map(string)
}

variable "azure_landing_zone_service_principal" {
  type = map(object({
    client_id       = string
    client_secret   = string
    subscription_id = string
    tenant_id       = string
  }))
}