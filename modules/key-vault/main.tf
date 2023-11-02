resource "azurerm_key_vault" "kv" {
  name                        = var.key_vault_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = true

  sku_name = "standard"

  tenant_id = data.azurerm_client_config.this.tenant_id

  access_policy {
    tenant_id = data.azurerm_client_config.this.tenant_id
    object_id = data.azurerm_client_config.this.object_id

    key_permissions = [
      "get",
    ]

    secret_permissions = [
      "get",
    ]
  }
}
