terraform {
  #backend "azurerm" {} # Settings come from backend.hcl

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.25.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 3.2.0"
    }
  }
}

provider "azurerm" {
  #storage_use_azuread = true
  subscription_id = var.subscription_id
  features {}
}

provider "azuread" {
  # configuration options
}