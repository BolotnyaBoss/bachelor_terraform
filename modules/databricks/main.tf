provider "azurerm" {
  features {}
}

module "databricks" {
  source = "./modules/databricks"

  # Add variables as necessary
}