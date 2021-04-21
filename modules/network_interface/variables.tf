variable "name" {
  description = "The name of the Network Interface"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group in which to create the Network Interface"
  type        = string
}

variable "location" {
  description = "The location where the Network Interface should exist"
  type        = string
}

variable "ip_configuration_name" {
  description = "A name used for this IP Configuration"
  type        = string
}

variable "ip_configuration_subnet_id" {
  description = "The ID of the Subnet where this Network Interface should be located in"
  type        = string
}

variable "ip_configuration_private_ip_address_allocation" {
  description = "The IP Version to use. Possible values are IPv4 or IPv6. Defaults to IPv4"
  type        = string
  default     = "Dynamic"
}