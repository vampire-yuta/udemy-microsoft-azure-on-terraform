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

resource "azurerm_resource_group" "example" {
  name     = "module-test-resources"
  location = "japaneast"
}

module "vnet" {
  source = "./modules/vnet"

  vnet_name           = "example-vnet"
  public_subnet_name  = "public"
  private_subnet_name = "private"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}
