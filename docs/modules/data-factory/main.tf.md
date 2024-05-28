# main.tf
## Overview
The `main.tf` file is a Terraform configuration file that is used to provision and manage resources in Azure. It defines the infrastructure components required for a data factory in Azure, including a storage account and linked service for Azure Blob Storage.

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Usage](#usage)
3. [Methods](#methods)
4. [Useful details](#properties)

## Prerequisites
To use this file, the following prerequisites are required:
- Terraform installed on the local machine
- Azure subscription and appropriate permissions to create resources
- Azure CLI installed and authenticated

## Usage
To use this file in a project:
1. Create a new Terraform project or navigate to an existing project directory.
2. Copy the `main.tf` file into the project directory.
3. Define the required input variables in a separate `variables.tf` file or using the `-var` flag when running Terraform commands.
4. Initialize the Terraform project by running the command `terraform init`.
5. Optionally, review and modify the configuration if needed.
6. Apply the configuration to provision the data factory and associated resources by running the command `terraform apply`.

## Methods
This file defines the following methods and resources:

### data "azurerm_storage_account" "example"
This method retrieves the details of an existing Azure Storage Account. It takes two input variables:
- `name`: The name of the storage account.
- `resource_group_name`: The name of the resource group where the storage account is located.

Example usage:
```hcl
data "azurerm_storage_account" "example" {
  name                = var.storage_account_name
  resource_group_name = var.resource_group_name
}
```

### resource "azurerm_data_factory" "adf"
This resource block defines an Azure Data Factory. It creates a new data factory with the specified name, location, and resource group. It takes three input variables:
- `name`: The name of the data factory.
- `location`: The location where the data factory will be created.
- `resource_group_name`: The name of the resource group where the data factory will be created.

Example usage:
```hcl
resource "azurerm_data_factory" "adf" {
  name                = var.data_factory_name
  location            = var.location
  resource_group_name = var.resource_group_name
}
```

### resource "azurerm_data_factory_linked_service_azure_blob_storage" "adf-ls"
This resource block defines a linked service for Azure Blob Storage in the data factory. It establishes a connection between the data factory and the Azure Blob Storage account. It takes three input variables:
- `name`: The name of the linked service.
- `data_factory_id`: The ID of the data factory.
- `connection_string`: The primary connection string of the Azure Blob Storage account.

Example usage:
```hcl
resource "azurerm_data_factory_linked_service_azure_blob_storage" "adf-ls" {
  name              = var.linked_service_name
  data_factory_id   = azurerm_data_factory.adf.id
  connection_string = data.azurerm_storage_account.example.primary_connection_string
}
```

## Useful details
- The `main.tf` file is used to define the infrastructure components required for a data factory in Azure.
- The file uses Azure provider for Terraform to interact with Azure resources.
- Input variables for the file should be defined in a separate `variables.tf` file or using the `-var` flag.
- The `terraform init` command should be run in the project directory before applying the configuration.
- The `terraform apply` command is used to apply the configuration and provision the data factory and associated resources.