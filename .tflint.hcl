config {
  module = true
}

# Enforces naming conventions
rule "terraform_naming_convention" {
  enabled = true
}

plugin "azurerm" {
  enabled = true
  version = "0.17.0"
  source  = "github.com/terraform-linters/tflint-ruleset-azurerm"
}
