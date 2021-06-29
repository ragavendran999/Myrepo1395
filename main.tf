terraform {
 required_providers {
  azurerm = {
   source = "hashicorp/azurerm"
    version = "2.65.0"
    }
  }
}

provider "azurerm" {
    subscription_id = "677bcc02-a3a7-468e-b9ce-5f51cdc6a6c7"
    client_id       = "d30b974a-c058-42ac-bb6b-646fbff00496"
    client_secret   = "1za8G-7j_eX1h8DP-4hb-Gxbs.GEwmWYr~"
    tenant_id       = "b36ac463-b379-4752-9185-dcb045b3bea2"
    features{}
    }

resource "azurerm_resource_group" "test" {
  name     = "terratest-resources"
  location = "west us"
}

resource "azurerm_storage_account" "test" {
name                     = "testsg1395"
resource_group_name      = azurerm_resource_group.test.name
location                 = azurerm_resource_group.test.location
account_tier             = "Standard"
account_replication_type = "GRS"
}

tags = {
    environment = "testing"
   }

}

resource "azurerm_storage_container" "test" {
    name =  "container-01"
    storage_account_name = azurerm_storage_account.test.name
    container_access_type = "private"
}


