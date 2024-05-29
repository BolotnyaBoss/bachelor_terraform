# main.tf
## Overview
The `main.tf` file is a Terraform configuration file that defines the infrastructure components to be provisioned in Microsoft Azure. It uses modules to create an Azure Resource Group, Storage Account, SQL Server, SQL Database, and Data Factory. The file serves as the entry point for configuring and deploying the infrastructure resources for the project.

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Usage](#usage)
3. [Methods](#methods)
4. [Useful details](#properties)

## Prerequisites
This file has a dependency on the `azurerm` provider, which should be configured in the Terraform configuration file. Additionally, the following modules should be present in the specified paths:
- Resource Group module (`./modules/resource-group`)
- Storage Account module (`./modules/storage-account`)
- SQL Server module (`./modules/sql-server`)
- SQL Database module (`./modules/sql-database`)
- Data Factory module (`./modules/data-factory`)

## Usage
To use this `main.tf` file, follow these steps:
1. Configure the Azure provider by adding the following code snippet to your Terraform configuration file:
```terraform
provider "azurerm" {
  features {}
}
```
2. Import the required modules by specifying their paths and providing the necessary input variables. For example, to import the Resource Group module:
```terraform
module "resource-group" {
  source              = "./modules/resource-group"

  resource_group_name = var.resource_group_name
  location            = var.location
}
```
3. Repeat step 2 for each module defined in the `main.tf` file, providing the required input variables.

## Methods
This file does not contain any methods or functions. Instead, it defines the configuration for multiple modules that handle the creation of Azure resources. Each module has its own set of input variables and may have output variables that can be used by other modules.

The methods and configurations provided by the modules are as follows:

### Resource Group module (`./modules/resource-group`)
#### Input Variables
- `resource_group_name` (string): Name of the Resource Group
- `location` (string): Azure region where the Resource Group will be created

### Storage Account module (`./modules/storage-account`)
#### Input Variables
- `resource_group_name` (string): Name of the Resource Group where the Storage Account will be created
- `location` (string): Azure region for the Storage Account
- `storage_account_name` (string): Name of the Storage Account
- `storage_container_name` (string): Name of the Storage Container
- `bacpac_file_name` (string): Name of the BACPAC file for SQL import
- `bacpac_path` (string): Path where the BACPAC file is located

### SQL Server module (`./modules/sql-server`)
#### Input Variables
- `resource_group_name` (string): Name of the Resource Group where the SQL Server will be created
- `location` (string): Azure region for the SQL Server
- `server_name` (string): Name of the SQL Server
- `server_administrator_login` (string): Admin login for the SQL Server
- `server_administrator_login_password` (string): Password for the admin login
- `aad_login_username` (string): Azure Active Directory admin username

### SQL Database module (`./modules/sql-database`)
#### Input Variables
- `server_id` (string): ID of the SQL Server where the database will be created
- `database_name` (string): Name of the SQL Database
- `storage_account_name` (string): Name of the Storage Account for storing BACPAC file
- `storage_container_name` (string): Name of the Storage Container for storing BACPAC file
- `blob_filename` (string): Name of the BACPAC file for SQL import
- `storage_account_primary_key` (string): Primary key for the Storage Account
- `server_administrator_login` (string): Admin login for the SQL Server
- `server_administrator_login_password` (string): Password for the admin login

### Data Factory module (`./modules/data-factory`)
#### Input Variables
- `data_factory_name` (string): Name of the Data Factory
- `linked_service_name` (string): Name of the Data Factory's Linked Service
- `storage_account_name` (string): Name of the Storage Account to be linked with Data Factory
- `resource_group_name` (string): Name of the Resource Group where the Data Factory will be created
- `location` (string): Azure region for the Data Factory

#### Dependencies
- The `Data Factory` module depends on the `Storage Account` module, ensuring that the Data Factory is only created after the Storage Account is available.

## Useful details
- The Azure provider is configured at the beginning of the file using the `azurerm` provider block.
- Each module is defined using the `module` block, specifying the module's source path and input variables.
- The `source` attribute of each module block points to the path where the respective module's code is located.
- The output variables of each module are not explicitly defined in this file but can be accessed by referring to the respective module's output variables. For example, `module.resource-group.name` refers to the output variable `name` of the `resource-group` module.