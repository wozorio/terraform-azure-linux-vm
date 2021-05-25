provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {
    storage_account_name = "stterraformwozorio"
    container_name       = "tfstate"
    key                  = "playground.tfstate"
  }
}

module "rg_playground" {
  source   = "./modules/resource_group/"
  name     = "rg-playground"
  location = var.location
}

module "vnet_class_a" {
  source              = "./modules/virtual_network/"
  name                = "vnet"
  address_space       = ["10.0.0.0/8"]
  resource_group_name = module.rg_playground.name
  location            = module.rg_playground.location
}

module "snet_vms" {
  source               = "./modules/subnet/"
  name                 = "snet-vms"
  resource_group_name  = module.vnet_class_a.resource_group_name
  virtual_network_name = module.vnet_class_a.name
  address_prefixes     = ["10.0.0.0/24"]
}

module "pip_ubuntu" {
  source              = "./modules/public_ip/"
  name                = "pip-ubuntu"
  domain_name_label   = "vm-ubuntu"
  resource_group_name = module.rg_playground.name
  location            = module.rg_playground.location
}

module "nic_ubuntu" {
  source                                         = "./modules/network_interface/"
  name                                           = "nic-ubuntu"
  location                                       = module.vnet_class_a.location
  resource_group_name                            = module.snet_vms.resource_group_name
  ip_configuration_name                          = "ipconfig"
  ip_configuration_subnet_id                     = module.snet_vms.id
  ip_configuration_private_ip_address_allocation = "Static"
  ip_configuration_private_ip_address            = "10.0.0.10"
  ip_configuration_public_ip_address_id          = module.pip_ubuntu.id
}

module "linux_vm_ubuntu" {
  source                = "./modules/linux_virtual_machine/"
  name                  = "vm-ubuntu"
  resource_group_name   = module.nic_ubuntu.resource_group_name
  location              = module.nic_ubuntu.location
  size                  = "Standard_B2s"
  admin_username        = "wozorio"
  network_interface_ids = [module.nic_ubuntu.id]
}

module "nsg_vm_ubuntu" {
  source              = "./modules/network_security_group/"
  name                = "nsg-ubuntu"
  location            = module.rg_playground.location
  resource_group_name = module.rg_playground.name

  security_rules = [
    {
      name                       = "Allow-HTTP-From-Internet-To-VM"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = 80
      source_address_prefix      = "Internet"
      destination_address_prefix = "10.0.0.10/32"
    },
    {
      name                       = "Allow-SSH-From-Internet-To-VM"
      priority                   = 200
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = 22
      source_address_prefix      = "Internet"
      destination_address_prefix = "10.0.0.10/32"
    }
  ]
}

module "nsg_association_vm_ubuntu" {
  source                    = "./modules/network_interface_security_group_association/"
  network_interface_id      = module.nic_ubuntu.id
  network_security_group_id = module.nsg_vm_ubuntu.id
}