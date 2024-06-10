terraform {
  backend "azurerm" {
    storage_account_name = "stterraformwozorio"
    container_name       = "tfstate"
    key                  = "playground.tfstate"
  }
}

provider "azurerm" {
  features {}
}
