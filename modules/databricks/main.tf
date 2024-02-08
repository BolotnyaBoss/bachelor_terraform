provider "azurerm" {
  features {}
}

module "resource-group" {
  source              = "./modules/resource-group"

  resource_group_name = var.resource_group_name
  location            = var.location
}

module "databricks" {
  source = "./modules/databricks"

  workspace_name      = var.databricks_workspace_name
  resource_group_name = module.resource-group.name
  location            = module.resource-group.location
}