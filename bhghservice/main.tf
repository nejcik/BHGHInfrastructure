terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.18.0"
    }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.base_name}-rg"
  location = var.location
}

module "app_service" {
    source = "../modules/app-service-linux"
    name = "${var.base_name}-svc"
    location = var.location
    resource_group_name = azurerm_resource_group.rg.name 
}

