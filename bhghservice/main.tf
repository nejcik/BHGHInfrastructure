terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.18.0"
    }
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
  app_service_name = "${var.base_name}-svc"
  location = var.location
  rg_name = azurerm_resource_group.rg.name 
}

module "storage_ui" {
  source = "../modules/storage-account-ui"
  storage_name = "${var.storage_base_name}ui"
  location = var.location
  rg_name = azurerm_resource_group.rg.name 
}
