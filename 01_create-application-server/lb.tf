resource "azurerm_public_ip" "lb_public_ip" {
  name                = local.lb_public_ip_name
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  allocation_method   = "Static"
}

resource "azurerm_lb" "lb" {
  name                = local.lb_name
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name

  frontend_ip_configuration {
    name                 = "lb_public_ip_configuration"
    public_ip_address_id = azurerm_public_ip.lb_public_ip.id
  }
}

resource "azurerm_lb_backend_address_pool" "lb_backend_pool" {
  loadbalancer_id = azurerm_lb.lb.id
  name            = local.lb_backend_pool_name
}

resource "azurerm_network_interface_backend_address_pool_association" "lb_backend_address_pool_association" {
  network_interface_id    = azurerm_network_interface.vm_network_interface.id
  ip_configuration_name   = "vm_ip_configuration"
  backend_address_pool_id = azurerm_lb_backend_address_pool.lb_backend_pool.id
}

resource "azurerm_lb_probe" "lb_probe" {
  resource_group_name = azurerm_resource_group.resource_group.name
  loadbalancer_id     = azurerm_lb.lb.id
  name                = "http-running-probe"
  port                = 80
}

resource "azurerm_lb_rule" "lb_rule" {
  resource_group_name            = azurerm_resource_group.resource_group.name
  loadbalancer_id                = azurerm_lb.lb.id
  name                           = local.lb_rule_name
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  backend_address_pool_id        = azurerm_lb_backend_address_pool.lb_backend_pool.id
  frontend_ip_configuration_name = "lb_public_ip_configuration"
  probe_id                       = azurerm_lb_probe.lb_probe.id
}

resource "azurerm_dns_a_record" "lb_dns_record" {
  name = local.lb_domain_name
  zone_name = azurerm_dns_zone.dns_zone.name
  resource_group_name = azurerm_resource_group.resource_group.name
  ttl = 300
  target_resource_id = azurerm_public_ip.lb_public_ip.id
}
