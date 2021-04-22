provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {
    storage_account_name = "stterraformwozorio"
    container_name       = "tfstate"
    key                  = "playground"
  }
}

module "rg_lab" {
  source   = "./modules/resource_group/"
  name     = "rg-lab"
  location = var.location
}

module "vnet_class_a" {
  source              = "./modules/virtual_network/"
  name                = "vnet"
  address_space       = ["10.0.0.0/8"]
  resource_group_name = module.rg_lab.name
  location            = module.rg_lab.location
}

module "snet_vms" {
  source               = "./modules/subnet/"
  name                 = "snet-vms"
  resource_group_name  = module.vnet_class_a.resource_group_name
  virtual_network_name = module.vnet_class_a.name
  address_prefixes     = ["10.0.0.0/24"]
}

module "nic_ubuntu" {
  source                     = "./modules/network_interface/"
  name                       = "nic-ubuntu"
  location                   = module.vnet_class_a.location
  resource_group_name        = module.snet_vms.resource_group_name
  ip_configuration_name      = "private"
  ip_configuration_subnet_id = module.snet_vms.id
}

module "linux_vm_ubuntu" {
  source                = "./modules/linux_virtual_machine/"
  name                  = "vm-ubuntu"
  resource_group_name   = module.nic_ubuntu.resource_group_name
  location              = module.nic_ubuntu.location
  size                  = "Standard_B2s"
  admin_username        = "wozorio"
  admin_password        = var.admin_password
  network_interface_ids = [module.nic_ubuntu.id]
}
