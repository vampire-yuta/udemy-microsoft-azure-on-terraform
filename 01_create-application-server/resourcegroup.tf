resource "azurerm_resource_group" "resource_group" {
  location = local.location
  name     = local.resource_group_name
}
