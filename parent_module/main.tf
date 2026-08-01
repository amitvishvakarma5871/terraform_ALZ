module "resource_group" {
  source = "../azurerm_resource_group"
  rgn    = var.rgn
}
module "virtual_network" {
  depends_on = [module.resource_group]
  source     = "../azurerm_virtual_network"
  vnet       = var.vnet
}
module "subnet" {
  depends_on = [module.virtual_network]
  source     = "../azurerm_subnet"
  subnet     = var.subnet
}
module "public_ip" {
  depends_on = [module.resource_group]
  source     = "../azurerm_public_ip"
  pip        = var.pip
}
module "virtual_machine" {
  depends_on = [module.subnet, module.public_ip]
  source     = "../azurerm_virtual_machine"
  machine    = var.machine
}