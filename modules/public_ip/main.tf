resource "azurerm_public_ip" "pip" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = var.allocation_method
  sku                 = var.sku
  ip_version          = var.ip_version
  domain_name_label   = var.domain_name_label
}