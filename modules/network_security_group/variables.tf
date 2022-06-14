variable "name" {
  description = "Specifies the name of the network security group"
  type        = string
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the network security group"
  type        = string
}

variable "security_rules" {
  description = "Set of objects representing security rules"
  type = set(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
  default = null
}
