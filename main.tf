provider "azurerm" {
  features {}
}

module "rg_lab" {
  source   = "../modules/resource_group"
  name     = "rg-lab"
  location = "west europe"
}
