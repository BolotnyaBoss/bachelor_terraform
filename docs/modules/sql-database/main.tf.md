# main.tf
## Overview
The `main.tf` file is a Terraform configuration file that defines and creates an Azure SQL Database resource. It is used as part of an infrastructure-as-code (IaC) approach to manage and provision cloud resources in Azure. This file specifically creates an Azure SQL Database using the `azurerm_mssql_database` resource.

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Usage](#usage)
3. [Methods](#methods)
4. [Useful details](#properties)

## Prerequisites
To use the `main.tf` file, the following prerequisites are required:
- Terraform installed on the local machine
- Appropriate access and permissions to create Azure SQL Database resources

## Usage
To utilize the `main.tf` file in a project, follow these steps:
1. Install Terraform on your local machine if it is not already installed.
2. Set up your Azure credentials and authentication by configuring the Azure CLI or using environment variables.
3. Create a new directory for your Terraform project and navigate into it.
4. Create a new `main.tf` file and copy the code provided into it.
5. Update the variables in the code with the desired values for your Azure SQL Database.
6. Run `terraform init` to initialize the Terraform project.
7. Run `terraform plan` to preview the changes that will be made.
8. Run `terraform apply` to create the Azure SQL Database resource.

## Methods
The `main.tf` file does not contain any methods or functions in the traditional sense. Instead, it defines a Terraform resource block `azurerm_mssql_database` that creates an Azure SQL Database. The resource block takes several parameters and values to configure the database, such as its name, server ID, SKU name, collation, and import details.

### azurerm_mssql_database
This resource block creates an Azure SQL Database. It has the following parameters:
- `name`: The name of the database.
- `server_id`: The ID of the server to associate the database with.
- `sku_name`: The SKU name for the database (e.g., "S0").
- `collation`: The collation setting for the database.
- `import`: An object that defines the import details for the database, including the storage URI, storage key, storage key type, administrator login, administrator login password, and authentication type.

Example:
```terraform
resource "azurerm_mssql_database" "database" {
  name                = var.database_name
  server_id           = var.server_id
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
```

## Useful details
- The `azurerm_mssql_database` resource in `main.tf` creates an Azure SQL Database using the specified parameters and import details.
- The `storage_uri` parameter in the `import` block should be updated with the desired storage URI for importing data into the database.
- The `storage_key` parameter in the `import` block should be updated with the primary key of the storage account.
- The `administrator_login` and `administrator_login_password` parameters in the `import` block should be updated with the desired administrator login credentials for the database.
- The `authentication_type` parameter in the `import` block determines the authentication type used for the administrator login (e.g., "ADPassword" for Azure Active Directory password authentication).