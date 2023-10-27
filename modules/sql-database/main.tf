resource "azurerm_mssql_database" "database" {
  name                = var.database_name
  server_id         = var.server_id
  sku_name            = "S0"
  collation           = "SQL_Latin1_General_CP1_CI_AS"
  
}