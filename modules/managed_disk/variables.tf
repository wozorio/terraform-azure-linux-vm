variable "name" {
  description = "Specifies the name of the Managed Disk"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group where the Managed Disk should exist"
  type        = string
}

variable "location" {
  description = "Specified the supported Azure location where the resource exists"
  type        = string
}

variable "storage_account_type" {
  description = "The type of storage to use for the managed disk. Possible values are Standard_LRS, Premium_LRS, StandardSSD_LRS or UltraSSD_LRS"
  type        = string
  default     = "Standard_LRS"
}

variable "create_option" {
  description = "The method to use when creating the managed disk"
  type        = string
  default     = "Empty"
}

variable "disk_size_gb" {
  description = "Specifies the size of the managed disk to create in gigabytes"
  type        = number
}
