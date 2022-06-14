variable "network_interface_id" {
  description = "The ID of the Network Interface"
  type        = string
}

variable "network_security_group_id" {
  description = "The ID of the Network Security Group which should be attached to the Network Interface"
  type        = string
}
