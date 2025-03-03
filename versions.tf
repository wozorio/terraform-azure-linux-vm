terraform {
  required_version = ">= 1.5.6"
  required_providers {
    # https://github.com/terraform-providers/terraform-provider-azurerm/blob/master/CHANGELOG.md
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.21.1"
    }
  }
}
