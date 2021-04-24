terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

provider "azurerm" {
  features {}
}


data "azurerm_virtual_network" "vnet" {
  name                = "example-network"
  resource_group_name = "example-resources"
}

resource "azurerm_subnet" "subnet" {
  name                 = "public"
  resource_group_name  = data.azurerm_virtual_network.vnet.resource_group_name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}
