provider "azurerm" {
  features {}
}

locals {
  azure_location          = "eastus"
  application_full_name   = "Hello World"
  application_short_name  = "HW"
  application_environment = "dev"
}

module "azure_ressource_group" {
  source                  = "git::https://github.com/0xdbe-terraform/terraform-azure-resource-group.git?ref=v2.0.1"
  azure_location          = local.azure_location
  application_full_name   = local.application_full_name
  application_short_name  = local.application_short_name
  application_environment = local.application_environment
}

module "azure_web_app" {
  source                  = "git::https://github.com/0xdbe-terraform/terraform-azure-webapp.git?ref=v0.0.2"
  azure_location          = local.azure_location
  application_short_name  = local.application_short_name
  application_environment = local.application_environment
  resource_group_name     = module.azure_ressource_group.name
}
