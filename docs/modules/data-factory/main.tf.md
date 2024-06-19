# main.tf
## Overview
The `main.tf` file is a Terraform configuration file that defines and provisions Azure resources for a data factory. It creates a storage account, a data factory, and a linked service for Azure Blob Storage. This file is used as part of the larger project to set up the necessary infrastructure for data processing and storage in Azure.

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Usage](#usage)
3. [Methods](#methods)
4. [Useful details](#properties)

## Prerequisites
To use this file, you need the following dependencies:

- Terraform: version 0.12 or later
- Azure CLI: version 2.0 or later

## Usage
To use this file in a project, follow these steps:

1. Install Terraform and Azure CLI if you haven't already.
2. Set up your Azure credentials by logging in with Azure CLI: `az login`.
3. Create a `main.tf` file in your project directory and copy the code provided into it.
4. Define the required variables in a separate `variables.tf` file or through environment variables.
5. Initialize Terraform in the project directory: `terraform init`.
6. Validate the configuration: `terraform validate`.
7. Provision the resources: `terraform apply`.

## Methods
This file defines the following resources:

### data "azurerm_storage_account" "example"
This data block retrieves information about an existing Azure storage account. It requires the following parameters:

- `name`: The name of the storage account.
- `resource_group_name`: The name of the resource group containing the storage account.

Example usage:
```hcl
data "azurerm_storage_account" "example" {
  name                = var.storage_account_name
  resource_group_name = var.resource_group_name
}
```

### resource "azurerm_data_factory" "adf"
This resource block creates an Azure data factory. It requires the following parameters:

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
- `data_factory_id`: The ID of the data factory.
- `connection_string`: The connection string for the Azure storage account.

Example usage:
```hcl
resource "azurerm_data_factory_linked_service_azure_blob_storage" "adf-ls" {
  name              = var.linked_service_name
  data_factory_id   = azurerm_data_factory.adf.id
  connection_string = data.azurerm_storage_account.example.primary_connection_string
}
```

## Useful details
- This configuration file uses Terraform's Azure provider to interact with the Azure APIs.
- The `var` keyword is used to reference variables defined in a separate `variables.tf` file.
- The `data` block is used to fetch information about an existing resource without creating it.
- The `resource` block is used to create a new resource in Azure.
- The values for the variables referenced in the code should be provided either through a `variables.tf` file or through environment variables.