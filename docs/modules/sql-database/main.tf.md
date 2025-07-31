# main.tf

## Overview
This Terraform configuration file defines an Azure SQL database resource (`azurerm_mssql_database`) with an import mechanism for initializing the database from a BACPAC file stored in an Azure Blob Storage container. It is used to provision and set up a SQL database on an existing Azure SQL Server with specific SKU and collation settings while automating the database import process.

## Table of Contents
1. [Prerequisites](#prerequisites)  
2. [Usage](#usage)  
3. [Methods](#methods)  
4. [Useful details](#useful-details)  

## Prerequisites
- Terraform installed (v0.12+ recommended).
- AzureRM provider configured.
- An existing Azure SQL Server (`server_id`) to deploy the database to.
- Azure Storage Account with Blob container holding the `.bacpac` file for import.
- Proper access keys and administrator credentials for Azure SQL Server.
- Set variables:
  - `database_name`
  - `server_id`
  - `storage_account_name`
  - `storage_container_name`
  - `blob_filename`
  - `storage_account_primary_key`
  - `server_administrator_login`
  - `server_administrator_login_password`

## Usage
1. Define or import the required variables with your infrastructure details.
2. Apply this Terraform configuration to create the Azure SQL Database and import data into it from the specified BACPAC file in blob storage.

Example snippet of variables file (`terraform.tfvars`):
```hcl
database_name                 = "exampledb"
server_id                    = "/subscriptions/xxx/resourceGroups/rg/providers/Microsoft.Sql/servers/sqlserver01"
storage_account_name          = "mystorageaccount"
storage_container_name       = "bacpacs"
blob_filename                = "mydb.bacpac"
storage_account_primary_key  = "accountKeyHere"
server_administrator_login    = "sqladmin"
server_administrator_login_password = "SecurePassword123!"
```

Run:
```bash
terraform init
terraform apply
```

## Methods
Terraform does not contain typical "methods" but the key properties of the `azurerm_mssql_database` resource configured here are:

- `name` (string): The name of the SQL database.
- `server_id` (string): The resource ID of the SQL server where the database will be hosted.
- `sku_name` (string): The compute and storage size tier, here set to `"S0"`.
- `collation` (string): The database collation setting.
- `import` block:
  - `storage_uri` (string): URI to the BACPAC file stored in Azure Blob storage.
  - `storage_key` (string): Storage account key for accessing the blob.
  - `storage_key_type` (string): The type of key used, e.g., `"StorageAccessKey"`.
  - `administrator_login` (string): SQL Server administrator login.
  - `administrator_login_password` (string): Password for the admin login.
  - `authentication_type` (string): Type of authentication, here `"ADPassword"` indicating Azure AD authentication with password.

## Useful details
- This resource automates provisioning a new Azure SQL Database and imports an existing database backup in one Terraform apply run.
- Use the correct permissions on storage account and SQL server to avoid import failures.
- The SKU `"S0"` is a basic service tier suitable for development or small workloads; it can be changed per requirements.
- The import functionality is valuable for migrating databases or setting up environments with seeded data.