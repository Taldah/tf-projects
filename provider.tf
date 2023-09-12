# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.42.0"
    }
  }


  required_version = ">= 1.1.0"
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
  }
  subscription_id = null
}

# resource "azurerm_resource_group" "GalimPro-Prod" {
#   name     = "Myrg-Prod"
#   location = "westeurope"

#   tags = {
#     Environment = "prod"

#   }
# }
#resource "azurerm_resource_group" "Prod" {
#  name     = "Prod"
#  location = "westeurope"
#}
