output "name" {
  description = "The name of the virtual network"
  value       = azurerm_virtual_network.this.name
}

output "resource_group_name" {
  description = "The resource group where the virtual network exists"
  value       = azurerm_virtual_network.this.resource_group_name
}

output "location" {
  description = "The location where the virtual network exists"
  value       = azurerm_virtual_network.this.location
}
