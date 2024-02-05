variable "resource_group_name" {
    type        = string
    description = "The name of resource group"
}

variable "location" {
    type        = string
    description = "The location of resource group"
}
variable "resource_group_name" {
    type        = string
    description = "The name of resource group in which to create server"
}

variable "location" {
    type        = string
    description = "The location where create server"
}

variable "server_name" {
    type        = string
    description = "The name of server"
}

variable "server_administrator_login" {
    type        = string
    description = "The administrator login of server"
}

variable "server_administrator_login_password" {
    type        = string
    description = "The administrator login password of server"
}

variable "aad_login_username" {
    type        = string
    description = "The name login username of AAD administrator"
}

variable "object_id" {
    type        = string
    description = "The object id of client config"
}
module "data-factory" {
  source = "./modules/data-factory"

  data_factory_name    = var.data_factory_name
  linked_service_name  = var.linked_service_name
  storage_account_name = var.storage_account_name
  resource_group_name  = var.resource_group_name
  location             = var.location

  depends_on = [
    module.storage-account
  ]
}
variable "server_id" {
    type        = string
    description = "The id of the server in which to create the database"
}

variable "database_name" {
    type        = string
    description = "The name of the database which need to create"
}

variable "storage_account_name" {
    type        = string
    description = "The name of the storage account where stored bacpac file"
}

variable "storage_container_name" {
    type        = string
    description = "The name of the storage container where stored bacpac file"
}

variable "blob_filename" {
    type        = string
    description = "The name of the bacpac file"
}

variable "storage_account_primary_key" {
    type        = string
    description = "The storage account primary access key"
}

variable "server_administrator_login" {
    type        = string
    description = "The administrator login of server"
}

variable "server_administrator_login_password" {
    type        = string
    description = "The administrator login password of server"
}
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

module "data-factory" {
  source = "./modules/data-factory"
}