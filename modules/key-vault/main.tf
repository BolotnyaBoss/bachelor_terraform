provider "azurerm" {
  features {}
}

resource "azurerm_key_vault" "main" {
  name                = var.key_vault_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = var.sku_name

  tenant_id = data.azurerm_client_config.current.tenant_id

  soft_delete_enabled        = true
  purge_protection_enabled   = false
}
