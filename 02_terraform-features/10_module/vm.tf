locals {
  vms = {
    app01 = "app_01"
    app02 = "app_02"
    db01  = "db_01"
  }
}

module "vm" {
  for_each = local.vms
  source   = "./modules/vm"

  network_interface_name = "${each.key}-vm-interface"
  location               = azurerm_resource_group.example.location
  resource_group_name    = azurerm_resource_group.example.name
  vm_name                = "${each.key}-vm"
  vm_size                = "Standard_F2"
  subnet_id              = module.vnet.private_subnet_id
}
