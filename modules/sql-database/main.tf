resource "azurerm_mssql_database" "database" {
  name                = var.database_name
  
  sku_name            = "S0"
  collation           = "SQL_Latin1_General_CP1_CI_AS"
  import {
    storage_uri                  = "https://${var.storage_account_name}.blob.core.windows.net/${var.storage_container_name}/${var.blob_filename}"  
    storage_key                  = var.storage_account_primary_key
    storage_key_type             = "StorageAccessKey"
    administrator_login          = var.server_administrator_login
    administrator_login_password = var.server_administrator_login_password
    authentication_type          = "ADPassword"
  }
}