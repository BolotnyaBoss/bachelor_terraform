provider "azurerm" {
  features {}
}

resource "azurerm_key_vault" "key_vault" {
  name                = var.key_vault_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id           = data.azurerm_client_config.this.tenant_id
  sku_name            = var.sku_name
}
