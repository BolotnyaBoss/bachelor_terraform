# main.tf
## Overview
The `main.tf` file is a Terraform configuration file that defines the infrastructure resources to be provisioned in Azure. It includes the creation of an Azure Storage Account, an Azure Data Factory, and a Linked Service for Azure Blob Storage. This file is used as part of a larger project to automate the provisioning and management of Azure resources.

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Usage](#usage)
3. [Methods](#methods)
4. [Useful details](#properties)

## Prerequisites
To use this file, the following prerequisites are required:

- Terraform version 0.12 or later
- Azure CLI installed and authenticated

## Usage
To use this file in a project, follow these steps:

1. Define the required variables for the Azure resources in a separate `variables.tf` file.
2. Initialize the Terraform configuration by running the following command in the project directory:
   ```
   terraform init
   ```
3. Provide values for the variables by creating a `terraform.tfvars` file and setting the variable values.
4. Apply the Terraform configuration to provision the resources by running the following command:
   ```
   terraform apply
   ```

## Methods
This file contains the following methods:

### data "azurerm_storage_account" "example"
This method retrieves information about an existing Azure Storage Account. It takes the following parameters:
- `name`: The name of the storage account.
- `resource_group_name`: The name of the resource group containing the storage account.

Example usage:
```terraform
data "azurerm_storage_account" "example" {
  name                = var.storage_account_name
  resource_group_name = var.resource_group_name
}
```

### resource "azurerm_data_factory" "adf"
This method creates an Azure Data Factory resource. It takes the following parameters:
- `name`: The name of the data factory.
- `location`: The Azure region where the data factory will be created.
- `resource_group_name`: The name of the resource group where the data factory will be created.

Example usage:
```terraform
resource "azurerm_data_factory" "adf" {
  name                = var.data_factory_name
  location            = var.location
  resource_group_name = var.resource_group_name
}
```

### resource "azurerm_data_factory_linked_service_azure_blob_storage" "adf-ls"
This method creates a Linked Service for Azure Blob Storage within the Azure Data Factory. It takes the following parameters:
- `name`: The name of the linked service.
- `data_factory_id`: The ID of the Azure Data Factory resource.
- `connection_string`: The connection string for the Azure Storage Account.

Example usage:
```terraform
resource "azurerm_data_factory_linked_service_azure_blob_storage" "adf-ls" {
  name              = var.linked_service_name
  data_factory_id   = azurerm_data_factory.adf.id
  connection_string = data.azurerm_storage_account.example.primary_connection_string
}
```

## Useful details
- The `var` prefix in variable names indicates that they are defined in a separate `variables.tf` file.
- The `azurerm_data_factory.adf.id` is used to reference the ID of the created Azure Data Factory resource in the `azurerm_data_factory_linked_service_azure_blob_storage.adf-ls` resource.
- The `data.azurerm_storage_account.example.primary_connection_string` is used to reference the primary connection string of the existing Azure Storage Account in the `azurerm_data_factory_linked_service_azure_blob_storage.adf-ls` resource.