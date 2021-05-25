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

module "resource_group" {
  source   = "./modules/resource_group/"
  name     = "rg-playground"
  location = var.location
}

module "virtual_network" {
  source              = "./modules/virtual_network/"
  name                = "vnet-playground"
  address_space       = ["10.0.0.0/8"]
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
}

module "subnet" {
  source               = "./modules/subnet/"
  name                 = "snet-playground"
  resource_group_name  = module.virtual_network.resource_group_name
  virtual_network_name = module.virtual_network.name
  address_prefixes     = ["10.0.0.0/24"]
}

module "public_ip" {
  source              = "./modules/public_ip/"
  name                = "pip-ubuntu"
  domain_name_label   = "ubuntu-vm"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
}

module "network_interface" {
  source                                         = "./modules/network_interface/"
  name                                           = "nic-ubuntu"
  location                                       = module.virtual_network.location
  resource_group_name                            = module.subnet.resource_group_name
  ip_configuration_name                          = "ipconfig"
  ip_configuration_subnet_id                     = module.subnet.id
  ip_configuration_private_ip_address_allocation = "Static"
  ip_configuration_private_ip_address            = "10.0.0.10"
  ip_configuration_public_ip_address_id          = module.public_ip.id
}

module "ubuntu_vm" {
  source                = "./modules/linux_virtual_machine/"
  name                  = "vm-ubuntu"
  resource_group_name   = module.network_interface.resource_group_name
  location              = module.network_interface.location
  size                  = "Standard_B2s"
  admin_username        = "wozorio"
  network_interface_ids = [module.network_interface.id]
}

module "network_security_group" {
  source              = "./modules/network_security_group/"
  name                = "nsg-ubuntu"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name

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

module "network_security_group_association" {
  source                    = "./modules/network_interface_security_group_association/"
  network_interface_id      = module.network_interface.id
  network_security_group_id = module.network_security_group.id
}