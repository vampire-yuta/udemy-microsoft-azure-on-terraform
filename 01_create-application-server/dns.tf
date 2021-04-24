resource "azurerm_dns_zone" "dns_zone" {
  name                = local.dns_zone_domain_name
  resource_group_name = azurerm_resource_group.resource_group.name
}

output "azure_dns_nameservers" {
  value = azurerm_dns_zone.dns_zone.name_servers
}
