variable "name" {
  description = "Specifies the name of the Public IP resource."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the public ip."
  type        = string
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists."
  type        = string
}

variable "sku" {
  description = "The SKU of the Public IP. Accepted values are Basic and Standard."
  type        = string
  default     = "Basic"
}

variable "allocation_method" {
  description = "Defines the allocation method for this IP address. Possible values are Static or Dynamic."
  type        = string
  default     = "Dynamic"
}

variable "ip_version" {
  description = "The IP Version to use, IPv6 or IPv4."
  type        = string
  default     = "IPv4"
}

variable "domain_name_label" {
  description = "Label for the Domain Name. Will be used to make up the FQDN. If a domain name label is specified, an A DNS record is created for the public IP in the Microsoft Azure DNS system."
  type        = string
}