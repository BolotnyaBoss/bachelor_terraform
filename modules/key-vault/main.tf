provider "azurerm" {
  features {}
}

module "key-vault" {
  source = "./modules/key-vault"

  # Add variables as necessary
}