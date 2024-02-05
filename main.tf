provider "azurerm" {
  features {}
}

data "azurerm_client_config" "this" {
}

module "resource-group" {
  source              = "./modules/resource-group"

  resource_group_name = var.resource_group_name
  location            = var.location
}

module "storage-account" {
  source                = "./modules/storage-account"

  resource_group_name    = module.resource-group.name
  location               = module.resource-group.location
  storage_account_name   = var.storage_account_name
  storage_container_name = var.storage_container_name
  bacpac_file_name       = var.bacpac_file_name
  bacpac_path            = var.bacpac_path
}

module "sql-server" {
  source                              = "./modules/sql-server"

  resource_group_name                 = module.resource-group.name
  location                            = module.resource-group.location
  server_name                         = var.server_name
  server_administrator_login          = var.server_administrator_login
  server_administrator_login_password = var.server_administrator_login_password
  aad_login_username                  = var.aad_login_username
  object_id                           = data.azurerm_client_config.this.object_id
}


module "sql-database" {
  source                              = "./modules/sql-database"

  server_id                           = module.sql-server.id
  database_name                       = var.database_name
  storage_account_name                = var.storage_account_name
  storage_container_name              = var.storage_container_name
  blob_filename                       = var.bacpac_file_name
  storage_account_primary_key         = module.storage-account.primary_key
  server_administrator_login          = var.server_administrator_login
  server_administrator_login_password = var.server_administrator_login_password
}

# The data-factory module block has been removed as per requirement.