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

# KEY VAULT

resource "azurerm_key_vault" "example" {
  name                        = "${var.base_name}-kv"
  location                    = var.location
  resource_group_name         = azurerm_resource_group.rg.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }

  dynamic access_policy {
    for_each = var.ad_group_read

    contents {
        tenant_id = data.azurerm_client_config.current.tenant_id
        object_id = access_policy.value 
        secret_permissions = [
            "Get",
            "List"
        ]
    }
  }

  dynamic access_policy {
    for_each = var.ad_group_write

    contents {
        tenant_id = data.azurerm_client_config.current.tenant_id
        object_id = access_policy.value 
        secret_permissions = [
            "Get",
            "List",
            "Set",
            "Delete"
        ]
    }
  }


  dynamic access_policy {
    for_each = var.app_service_principal_id

    contents {
        tenant_id = data.azurerm_client_config.current.tenant_id
        object_id = access_policy.value 
        secret_permissions = [
            "Get",
            "List"
        ]
    }

  }
}

# App Config


