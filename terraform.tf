terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.15.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.21"
    }
    github = {
      source  = "hashicorp/github"
      version = "~> 4.31"
    }
    tfe = {
      version = "~> 0.33"
    }
  }
}
