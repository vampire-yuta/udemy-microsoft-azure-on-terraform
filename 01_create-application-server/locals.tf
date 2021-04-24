locals {
  location            = "japaneast"
  resource_group_name = "udemy-resource-group"

  vnet_name           = "udemy-virtual-network"
  public_subnet_name  = "public"
  private_subnet_name = "private"

  vm_network_interface_name = "udemy-network-interface"
  vm_security_group         = "udemy-security-group"
  vm_name                   = "udemy-vm"
  vm_admin_username         = "adminuser"
  vm_admin_password         = "P@$$w0rd1234!"

  bastion_public_ip_name = "udemy-bastion-public-ip"
  bastion_host_name      = "udemy-bastion"

  lb_public_ip_name    = "udemy-lb-public-ip"
  lb_name              = "udemy-lb"
  lb_backend_pool_name = "udemy-lb-backend-pool"
  lb_rule_name         = "udemy-lb-rule-name"
  lb_domain_name       = "udemy-lb"

  sql_server_name                         = "udemy-sql-server"
  sql_server_administrator_login          = "sqladministrator"
  sql_server_administrator_login_password = "P@$$w0rd1234!"
  sql_server_firewall_rule_name           = "udemy-sql-server-firewall-rule"
  sql_server_virtual_network_rule_name    = "udemy-sql-server-virtual-network-rule"
  sql_server_db_name                      = "udemy-database"

  dns_zone_domain_name = "blackroom-666.xyz"
}
