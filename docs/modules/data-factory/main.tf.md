# main.tf
## Overview
The `main.tf` file is a Terraform configuration file that defines the infrastructure resources for an Azure Data Factory project. It creates a storage account, a data factory, and a linked service for Azure Blob Storage. This file plays a role in provisioning and managing the necessary infrastructure resources for the data integration and orchestration tasks in the project.

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Usage](#usage)
3. [Methods](#methods)
4. [Useful details](#properties)

## Prerequisites
To use this file, the following prerequisites are required:
- Terraform installed on the system
- Azure subscription and credentials
- Azure provider plugin installed in Terraform

## Usage
To utilize this file in a project, follow these steps:
1. Create a new Terraform configuration file and name it `main.tf`.
2. Copy the code from this file into the `main.tf` file.
3. Modify the values of the input variables (`var.storage_account_name`, `var.resource_group_name`, etc.) according to your project requirements.
4. Run `terraform init` to initialize the Terraform project.
5. Run `terraform plan` to review the planned changes.
6. Run `terraform apply` to create the infrastructure resources in Azure.

## Methods
This file defines the following methods and resources:

### data "azurerm_storage_account" "example"
This method retrieves information about an existing Azure Storage Account. It requires the following parameters:
- `name`: The name of the storage account.
- `resource_group_name`: The name of the resource group where the storage account resides.

Example usage:
```hcl
data "azurerm_storage_account" "example" {
  name                = var.storage_account_name
  resource_group_name = var.resource_group_name
}
```

### resource "azurerm_data_factory" "adf"
This resource block creates an Azure Data Factory. It requires the following parameters:
- `name`: The name of the data factory.
- `location`: The Azure region where the data factory should be created.
- `resource_group_name`: The name of the resource group where the data factory should be created.

Example usage:
```hcl
resource "azurerm_data_factory" "adf" {
  name                = var.data_factory_name
  location            = var.location
  resource_group_name = var.resource_group_name
}
```

### resource "azurerm_data_factory_linked_service_azure_blob_storage" "adf-ls"
This resource block creates a linked service for Azure Blob Storage within the data factory. It requires the following parameters:
- `name`: The name of the linked service.
- `data_factory_id`: The ID of the data factory where the linked service should be created.
- `connection_string`: The connection string for the Azure Blob Storage account.

Example usage:
```hcl
resource "azurerm_data_factory_linked_service_azure_blob_storage" "adf-ls" {
  name              = var.linked_service_name
  data_factory_id   = azurerm_data_factory.adf.id
  connection_string = data.azurerm_storage_account.example.primary_connection_string
}
```

## Useful details
- This code uses input variables (`var.storage_account_name`, `var.resource_group_name`, etc.) to make it customizable and reusable across different environments.
- The code retrieves the primary connection string of the storage account using the `data.azurerm_storage_account.example.primary_connection_string` reference.
- Additional resources and configuration can be added to this file as per project requirements.