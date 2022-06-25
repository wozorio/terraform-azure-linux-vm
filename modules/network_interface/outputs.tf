output "id" {
  description = "The ID of the network interface"
  value       = azurerm_network_interface.this.id
}

output "resource_group_name" {
  description = "The resource group where the network interface exists"
  value       = azurerm_network_interface.this.resource_group_name
}

output "location" {
  description = "The location where the network interface exists"
  value       = azurerm_network_interface.this.location
}
