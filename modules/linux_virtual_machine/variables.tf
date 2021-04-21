variable "name" {
  description = "The Name which should be used for this Resource Group"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group in which the Linux Virtual Machine should be exist"
  type        = string
}

variable "location" {
  description = "The Azure location where the Linux Virtual Machine should exist"
  type        = string
}

variable "size" {
  description = "The SKU which should be used for this Virtual Machine, such as Standard_F2"
  type        = string
}

variable "disable_password_authentication" {
  description = "Should Password Authentication be disabled on this Virtual Machine"
  type        = bool
  default     = false
}

variable "admin_username" {
  description = "The username of the local administrator used for the Virtual Machine"
  type        = string
  sensitive   = true
}

variable "admin_password" {
  description = "The Password which should be used for the local-administrator on this Virtual Machine"
  type        = string
  sensitive   = true
}

variable "network_interface_ids" {
  description = "A list of Network Interface ID's which should be attached to this Virtual Machine. The first Network Interface ID in this list will be the Primary Network Interface on the Virtual Machine"
  type        = list(string)
}

variable "os_disk_caching" {
  description = "The Type of Caching which should be used for the Internal OS Disk. Possible values are None, ReadOnly and ReadWrite"
  type        = string
  default     = "ReadWrite"
}

variable "os_disk_storage_account_type" {
  description = "The Type of Storage Account which should back this the Internal OS Disk. Possible values are Standard_LRS, StandardSSD_LRS and Premium_LRS"
  type        = string
  default     = "StandardSSD_LRS"
}

variable "source_image_reference_publisher" {
  description = "Specifies the publisher of the image used to create the virtual machines"
  type        = string
  default     = "Canonical"
}

variable "source_image_reference_offer" {
  description = "Specifies the offer of the image used to create the virtual machines"
  type        = string
  default     = "UbuntuServer"
}

variable "source_image_reference_sku" {
  description = "Specifies the SKU of the image used to create the virtual machines"
  type        = string
  default     = "18.04-LTS"
}

variable "source_image_reference_version" {
  description = "Specifies the version of the image used to create the virtual machines"
  type        = string
  default     = "latest"
}