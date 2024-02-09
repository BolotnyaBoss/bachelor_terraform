provider "azurerm" {
  features {}
}

resource "azurerm_databricks_workspace" "main" {
  name                = var.databricks_workspace_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
}
