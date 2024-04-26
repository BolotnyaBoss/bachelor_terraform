provider "azurerm" {
  features {}
}

# Configuration for the Azure provider
data "azurerm_client_config" "this" {
  # Retrieves information about the Azure account which is used by the provider
}

# Module for creating an Azure Resource Group
module "resource-group" {
  source              = "./modules/resource-group"  # Path to the Resource Group module

  resource_group_name = var.resource_group_name    # Name of the Resource Group
  location            = var.location               # Azure region where the Resource Group will be created
}

# Module for creating an Azure Storage Account
module "storage-account" {
  source                = "./modules/storage-account"  # Path to the Storage Account module

  resource_group_name    = module.resource-group.name  # Name of the Resource Group where the Storage Account will be created
  location               = module.resource-group.location  # Azure region for the Storage Account
  storage_account_name   = var.storage_account_name       # Name of the Storage Account
  storage_container_name = var.storage_container_name     # Name of the Storage Container
  bacpac_file_name       = var.bacpac_file_name           # Name of the BACPAC file for SQL import
  bacpac_path            = var.bacpac_path                # Path where the BACPAC file is located
}

# Module for creating an Azure SQL Server
module "sql-server" {
  source                              = "./modules/sql-server"  # Path to the SQL Server module

  resource_group_name                 = module.resource-group.name  # Name of the Resource Group where the SQL Server will be created
  location                            = module.resource-group.location  # Azure region for the SQL Server
  server_name                         = var.server_name                # Name of the SQL Server
  server_administrator_login          = var.server_administrator_login  # Admin login for the SQL Server
  server_administrator_login_password = var.server_administrator_login_password  # Password for the admin login
  aad_login_username                  = var.aad_login_username          # Azure Active Directory admin username
  object_id                           = data.azurerm_client_config.this.object_id  # Azure Active Directory object ID
}

# Module for creating an Azure SQL Database
module "sql-database" {
  source                              = "./modules/sql-database"  # Path to the SQL Database module

  server_id                           = module.sql-server.id                   # ID of the SQL Server where the database will be created
  database_name                       = var.database_name                      # Name of the SQL Database
  storage_account_name                = var.storage_account_name               # Name of the Storage Account for storing BACPAC file
  storage_container_name              = var.storage_container_name             # Name of the Storage Container for storing BACPAC file
  blob_filename                       = var.bacpac_file_name                   # Name of the BACPAC file for SQL import
  storage_account_primary_key         = module.storage-account.primary_key     # Primary key for the Storage Account
  server_administrator_login          = var.server_administrator_login         # Admin login for the SQL Server
  server_administrator_login_password = var.server_administrator_login_password  # Password for the admin login
}

# Module for creating an Azure Data Factory
module "data-factory" {
  source = "./modules/data-factory"  # Path to the Data Factory module

  data_factory_name    = var.data_factory_name    # Name of the Data Factory
  linked_service_name  = var.linked_service_name  # Name of the Data Factory's Linked Service
  storage_account_name = var.storage_account_name # Name of the Storage Account to be linked with Data Factory
  resource_group_name  = var.resource_group_name  # Name of the Resource Group where the Data Factory will be created
  location             = var.location             # Azure region for the Data Factory

  # Ensures that the Data Factory is only created after the Storage Account is available
  depends_on = [
    module.storage-account
  ]
}