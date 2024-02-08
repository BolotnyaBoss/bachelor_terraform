provider "azurerm" {
  features {}
}

module "resource-group" {
  source              = "./modules/resource-group"

  resource_group_name = var.resource_group_name
  location            = var.location
}

module "key-vault" {
  source = "./modules/key-vault"

  name                = var.key_vault_name
  resource_group_name = module.resource-group.name
  location            = module.resource-group.location
}