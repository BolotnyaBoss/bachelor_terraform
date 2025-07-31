# main.tf
## Overview
This Terraform configuration file orchestrates the provisioning of core Azure infrastructure components as part of a larger Infrastructure-as-Code (IaC) project. It sets up an Azure environment by creating a Resource Group, Storage Account, SQL Server and Database, and a Data Factory, using reusable modules for clean separation and modularity. The file acts as the central composition that wires together these modules with necessary variable inputs and dependencies, enabling automated and repeatable deployment of the cloud environment.

## Table of Contents
1. [Prerequisites](#prerequisites)  
2. [Usage](#usage)  
3. [Methods](#methods)  
4. [Useful details](#useful-details)  

## Prerequisites
- Terraform CLI installed (v0.12+ recommended for module support)
- Azure CLI or Service Principal credentials for Terraform authentication  
- Azure provider plugin (specified by `provider "azurerm"`)
- Local modules stored in `./modules` folder:  
  - `resource-group`  
  - `storage-account`  
  - `sql-server`  
  - `sql-database`  
  - `data-factory`  
- Variables defined externally (likely in `variables.tf` or passed at plan/apply time) such as:
  - `resource_group_name`  
  - `location`  
  - `storage_account_name`  
  - `storage_container_name`  
  - `bacpac_file_name`  
  - `bacpac_path`  
  - `server_name`  
  - `server_administrator_login`  
  - `server_administrator_login_password`  
  - `aad_login_username`  
  - `database_name`  
  - `data_factory_name`  
  - `linked_service_name`  

## Usage
To deploy the Azure infrastructure described by this configuration, follow these steps:

1. Ensure all required variables are set either through a `.tfvars` file or environment variables.
2. Initialize Terraform in this directory to download providers and modules:
    ```bash
    terraform init
    ```
3. Preview the planned deployment:
    ```bash
    terraform plan
    ```
4. Apply the configuration to create resources:
    ```bash
    terraform apply
    ```
This will provision all defined Azure resources in the correct order, respecting dependencies such as the Data Factory waiting for the Storage Account.

## Methods
This file uses the following main Terraform constructs:

- `provider "azurerm"`: Configures the AzureRM provider for resource provisioning.
- `data "azurerm_client_config"`: Fetches current Azure client details, e.g., tenant and user object ID.
- `module "resource-group"`: Creates an Azure Resource Group.
  - Inputs: `resource_group_name`, `location`
- `module "storage-account"`: Creates an Azure Storage Account and a container for storing artifacts like BACPAC files.
  - Inputs: `resource_group_name`, `location`, `storage_account_name`, `storage_container_name`, `bacpac_file_name`, `bacpac_path`
- `module "sql-server"`: Provisions an Azure SQL Server with admin login and Azure AD integration.
  - Inputs: `resource_group_name`, `location`, `server_name`, `server_administrator_login`, `server_administrator_login_password`, `aad_login_username`, `object_id`
- `module "sql-database"`: Creates an SQL Database on the provisioned SQL Server and imports data using BACPAC artifacts stored in the Storage Account.
  - Inputs: `server_id`, `database_name`, `storage_account_name`, `storage_container_name`, `blob_filename`, `storage_account_primary_key`, `server_administrator_login`, `server_administrator_login_password`
- `module "data-factory"`: Deploys an Azure Data Factory linked to the Storage Account with defined dependencies.
  - Inputs: `data_factory_name`, `linked_service_name`, `storage_account_name`, `resource_group_name`, `location`
  - Dependency: `depends_on` ensures it is created only after Storage Account creation.

## Useful details
- Uses modular design pattern: each Azure resource type is encapsulated in a dedicated module, encouraging reuse and easier maintenance.
- References outputs from one module to another (e.g., `module.resource-group.name`) maintain correct resource linkage.
- Manages sensitive information such as SQL passwords as variables (best practice is to encrypt and not hardcode).
- `depends_on` directive for Data Factory module guarantees the Storage Account is ready first.
- Can be part of a larger Terraform project that deploys full Azure application infrastructure including compute and networking.  
- Storing BACPAC files in the Storage Account enables automated database import during SQL Database creation.  

Example snippet to pass variables (usually in `terraform.tfvars`):
```hcl
resource_group_name             = "my-resource-group"
location                      = "eastus"
storage_account_name          = "mystorageacct01"
storage_container_name        = "bacpac-container"
bacpac_file_name              = "database.bacpac"
bacpac_path                   = "./bacpac_files"
server_name                   = "my-sql-server"
server_administrator_login    = "sqladmin"
server_administrator_login_password = "P@ssword1234!"
aad_login_username            = "aad-admin@domain.com"
database_name                 = "mydatabase"
data_factory_name             = "mydatafactory"
linked_service_name           = "mylinkedservice"
```
This configuration establishes a full Azure environment foundation for hosting data-centric workloads with SQL and Data Factory integration.