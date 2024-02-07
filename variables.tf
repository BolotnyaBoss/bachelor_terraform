variable "resource_group_name" {
    type        = string
    description = "The name of resource group in which to create storage account"
}

variable "location" {
    type        = string
    description = "The location where create storage account"
}

variable "storage_account_name" {
    type        = string
    description = "The name of storage account"
}

variable "storage_container_name" {
    type        = string
    description = "The name of storage container"
}

variable "bacpac_file_name" {
    type        = string
    description = "The file name of bacpac for database"
}

variable "bacpac_path" {
    type        = string
    description = "The path where located bacpac file for database"
}

variable "server_name" {
    type        = string
    description = "The name of server"
}

variable "database_name" {
    type        = string
    description = "The name of the database which need to create"
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

