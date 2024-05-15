# main.tf
## Overview
The `main.tf` file is a Terraform configuration file that defines a resource for creating an Azure SQL database. It specifies the necessary parameters for creating the database, including the name, server ID, SKU name, collation, and import details.

Terraform is an infrastructure as code tool that allows developers to define and manage infrastructure resources using declarative configuration files. The `main.tf` file plays a crucial role in a software project by defining and provisioning the necessary resources needed for the project's infrastructure.

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Usage](#usage)
3. [Methods](#methods)
4. [Useful details](#properties)

## Prerequisites
To use the `main.tf` file, the following prerequisites are required:
- Terraform installed on the local machine.

## Usage
To utilize the `main.tf` file in a project, follow these steps:
1. Make sure Terraform is installed on your machine.
2. Define the necessary variables required for the resource, such as `database_name`, `server_id`, `storage_account_name`, `storage_container_name`, `blob_filename`, `storage_account_primary_key`, `server_administrator_login`, and `server_administrator_login_password`.
3. Run the Terraform commands to initialize, plan, and apply the configuration:
```bash
terraform init
terraform plan
terraform apply
```

## Methods
The `main.tf` file contains a resource block that defines an Azure SQL database using the `azurerm_mssql_database` resource type. It has the following methods:

### azurerm_mssql_database
This method is used for creating an Azure SQL database. It takes the following parameters:
- `name` (string): The name of the database.
- `server_id` (string): The ID of the Azure SQL server where the database will be created.
- `sku_name` (string): The SKU name of the database. In this example, it is set to "S0".
- `collation` (string): The collation of the database. In this example, it is set to "SQL_Latin1_General_CP1_CI_AS".
- `import` (object): An object containing the import details for the database. It has the following parameters:
  - `storage_uri` (string): The storage URI of the database backup file.
  - `storage_key` (string): The storage key used to access the backup file.
  - `storage_key_type` (string): The type of storage key. In this example, it is set to "StorageAccessKey".
  - `administrator_login` (string): The administrator login for the Azure SQL server.
  - `administrator_login_password` (string): The administrator login password for the Azure SQL server.
  - `authentication_type` (string): The authentication type. In this example, it is set to "ADPassword".

Example usage:
```terraform
resource "azurerm_mssql_database" "database" {
  name                = "my-database"
  server_id           = "my-server-id"
  sku_name            = "S0"
  collation           = "SQL_Latin1_General_CP1_CI_AS"
  import {
    storage_uri                  = "https://my-storage-account.blob.core.windows.net/my-container/my-backup.bak"  
    storage_key                  = "my-storage-key"
    storage_key_type             = "StorageAccessKey"
    administrator_login          = "my-admin-login"
    administrator_login_password = "my-admin-password"
    authentication_type          = "ADPassword"
  }
}
```

## Useful details
- The `name` parameter specifies the name of the database to be created.
- The `server_id` parameter specifies the ID of the Azure SQL server where the database will be created.
- The `sku_name` parameter specifies the SKU name of the database. In this example, it is set to "S0".
- The `collation` parameter specifies the collation of the database. In this example, it is set to "SQL_Latin1_General_CP1_CI_AS".
- The `import` block contains the import details for the database, including the storage URI, storage key, storage key type, administrator login, administrator login password, and authentication type.