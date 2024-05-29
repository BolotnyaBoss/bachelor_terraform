# main.tf
## Overview
The `main.tf` file is a Terraform configuration file used to create and manage Azure resources. It defines the infrastructure for an Azure project, including resource groups, storage accounts, SQL servers, SQL databases, and data factories. This file plays a crucial role in provisioning and managing the necessary Azure resources for the project.

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Usage](#usage)
3. [Methods](#methods)
4. [Useful details](#properties)

## Prerequisites
To use the `main.tf` file, the following prerequisites are required:
- Terraform installed on the local machine
- Azure subscription and account credentials
- Azure CLI or Azure PowerShell installed and authenticated

## Usage
To use the `main.tf` file in a project, follow these steps:
1. Install Terraform on your local machine.
2. Authenticate with your Azure account using Azure CLI or Azure PowerShell.
3. Create a new directory for your Terraform project.
4. Copy the `main.tf` file into the project directory.
5. Customize the variables in the `main.tf` file according to your project requirements.
6. Open a terminal or command prompt and navigate to the project directory.
7. Run the following commands to initialize and apply the Terraform configuration:
   ```shell
   terraform init
   terraform apply
   ```

## Methods
The `main.tf` file includes several modules that define the creation of Azure resources. Each module has its own set of variables that can be customized. Here is a brief description of the methods used in the file:

### Provider
The `azurerm` provider is configured to connect Terraform with Azure. It enables the creation and management of Azure resources.

### Data Sources
- `azurerm_client_config` retrieves information about the Azure account used by the provider. No parameters are required.

### Modules
#### Resource Group (`module "resource-group"`)
Creates an Azure Resource Group.
- `source`: Path to the Resource Group module.
- `resource_group_name`: Name of the Resource Group.
- `location`: Azure region where the Resource Group will be created.

#### Storage Account (`module "storage-account"`)
Creates an Azure Storage Account.
- `source`: Path to the Storage Account module.
- `resource_group_name`: Name of the Resource Group where the Storage Account will be created.
- `location`: Azure region for the Storage Account.
- `storage_account_name`: Name of the Storage Account.
- `storage_container_name`: Name of the Storage Container.
- `bacpac_file_name`: Name of the BACPAC file for SQL import.
- `bacpac_path`: Path where the BACPAC file is located.

#### SQL Server (`module "sql-server"`)
Creates an Azure SQL Server.
- `source`: Path to the SQL Server module.
- `resource_group_name`: Name of the Resource Group where the SQL Server will be created.
- `location`: Azure region for the SQL Server.
- `server_name`: Name of the SQL Server.
- `server_administrator_login`: Admin login for the SQL Server.
- `server_administrator_login_password`: Password for the admin login.
- `aad_login_username`: Azure Active Directory admin username.
- `object_id`: Azure Active Directory object ID.

#### SQL Database (`module "sql-database"`)
Creates an Azure SQL Database.
- `source`: Path to the SQL Database module.
- `server_id`: ID of the SQL Server where the database will be created.
- `database_name`: Name of the SQL Database.
- `storage_account_name`: Name of the Storage Account for storing the BACPAC file.
- `storage_container_name`: Name of the Storage Container for storing the BACPAC file.
- `blob_filename`: Name of the BACPAC file for SQL import.
- `storage_account_primary_key`: Primary key for the Storage Account.
- `server_administrator_login`: Admin login for the SQL Server.
- `server_administrator_login_password`: Password for the admin login.

#### Data Factory (`module "data-factory"`)
Creates an Azure Data Factory.
- `source`: Path to the Data Factory module.
- `data_factory_name`: Name of the Data Factory.
- `linked_service_name`: Name of the Data Factory's Linked Service.
- `storage_account_name`: Name of the Storage Account to be linked with Data Factory.
- `resource_group_name`: Name of the Resource Group where the Data Factory will be created.
- `location`: Azure region for the Data Factory.
- `depends_on`: Ensures that the Data Factory is only created after the Storage Account is available.

## Useful details
- The `provider` block configures the Azure provider and enables specific features.
- The `data` block retrieves information about the Azure account used by the provider.
- The `module` blocks define the creation of Azure resources using separate modules.
- Each module has its own set of variables that can be customized according to the project requirements.
- The `depends_on` attribute ensures that the Data Factory module is only created after the Storage Account module has been provisioned.