terraform {
  required_version = ">= 0.15"
  required_providers {
    # https://github.com/terraform-providers/terraform-provider-azurerm/blob/master/CHANGELOG.md
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.82.0"
    }
  }
}