locals {
  ubuntu_vm_network_security_rules = [
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

  tags = {
    creator     = "terraform"
    environment = "playground"
  }
}

resource "azurerm_resource_group" "playground" {
  name     = "rg-playground"
  location = var.location

  tags = local.tags
}

resource "azurerm_virtual_network" "this" {
  name                = "vnet"
  address_space       = ["10.0.0.0/26"]
  location            = azurerm_resource_group.playground.location
  resource_group_name = azurerm_resource_group.playground.name

  tags = local.tags
}

resource "azurerm_subnet" "this" {
  name                 = "snet"
  resource_group_name  = azurerm_virtual_network.this.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = ["10.0.0.0/28"]
}

resource "azurerm_public_ip" "ubuntu_vm" {
  name                = "pip-ubuntu"
  resource_group_name = azurerm_resource_group.playground.name
  location            = azurerm_resource_group.playground.location
  allocation_method   = "Dynamic"
  sku                 = "Basic"
  ip_version          = "IPv4"
  domain_name_label   = "vm-ubuntu"

  tags = local.tags
}

resource "azurerm_network_interface" "ubuntu_vm" {
  name                = "nic-ubuntu"
  location            = azurerm_virtual_network.this.location
  resource_group_name = azurerm_subnet.this.resource_group_name

  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = azurerm_subnet.this.id
    private_ip_address_version    = "IPv4"
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.0.0.10"
    public_ip_address_id          = azurerm_public_ip.ubuntu_vm.id
  }

  tags = local.tags
}

module "ubuntu_vm" {
  source = "./modules/linux_virtual_machine/"

  name                  = "vm-ubuntu"
  resource_group_name   = azurerm_network_interface.ubuntu_vm.resource_group_name
  location              = azurerm_network_interface.ubuntu_vm.location
  size                  = "Standard_B2s"
  admin_username        = "wozorio"
  network_interface_ids = [azurerm_network_interface.ubuntu_vm.id]

  tags = local.tags
}

resource "azurerm_network_security_group" "ubuntu_vm" {
  name                = "nsg-ubuntu"
  location            = azurerm_resource_group.playground.location
  resource_group_name = azurerm_resource_group.playground.name

  dynamic "security_rule" {
    for_each = local.ubuntu_vm_network_security_rules

    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = security_rule.value.source_port_range
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = security_rule.value.source_address_prefix
      destination_address_prefix = security_rule.value.destination_address_prefix
    }
  }

  tags = local.tags
}

resource "azurerm_network_interface_security_group_association" "ubuntu_vm" {
  network_interface_id      = azurerm_network_interface.ubuntu_vm.id
  network_security_group_id = azurerm_network_security_group.ubuntu_vm.id
}
