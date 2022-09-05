terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.15.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
    github = {
      source  = "hashicorp/github"
      version = "~> 4.0"
    }
    tfe = {
      version = "~> 0.33"
    }
  }
}
