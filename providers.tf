terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.92.0"
    }
  }
    backend "azurerm" {
    resource_group_name  = "tf-state-rg"
    storage_account_name = "tfstatenoah"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
   skip_provider_registration = true
  features {
    resource_group {
       prevent_deletion_if_contains_resources = false
    }
}
  subscription_id = var.subscription_id
  client_id = var.client_id
  client_secret = var.client_secret
  tenant_id = var.tenant_id
}