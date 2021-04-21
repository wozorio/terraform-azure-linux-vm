variable "location" {
  description = "The Azure Region where the resources should exist"
  type        = string
}

variable "admin_password" {
  description = "The Password which should be used for the local-administrator on the Virtual Machine"
  type        = string
  sensitive   = true
}