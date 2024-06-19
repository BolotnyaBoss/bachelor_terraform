# main.tf
## Overview
The `main.tf` file is used in an Azure infrastructure project to define and configure various resources. It is written in HashiCorp Configuration Language (HCL) and is used by the Terraform tool to deploy and manage the Azure resources.

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Usage](#usage)
3. [Methods](#methods)
4. [Useful details](#properties)

## Prerequisites
To use the `main.tf` file, the following dependencies are required:
- Terraform (version X.X.X)
- Azure CLI (version X.X.X)

## Usage
To utilize the `main.tf` file in a project, follow these steps:
1. Install Terraform and Azure CLI if not already installed.
2. Set up the necessary Azure credentials.
3. Create a new directory for the project and navigate to it.
4. Create a `main.tf` file and copy the content provided.
5. Modify the variables in the file to match your desired configuration.
6. Run `terraform init` to initialize the Terraform project.
7. Run `terraform plan` to see the planned changes.
8. Run `terraform apply` to apply the changes and create the Azure resources.

## Methods
The `main.tf` file defines and configures the following resources:

1. `azurerm_storage_account` data source: This data source retrieves information about an existing Azure Storage Account. It requires the following parameters:
   - `name` (string): The name of the storage account.
   - `resource_group_name` (string): The name of the resource group containing the storage account.

Example:
```hcl
data "azurerm_storage_account" "example" {
  name                = var.storage_account_name
  resource_group_name = var.resource_group_name
}
```

2. `azurerm_data_factory` resource: This resource creates an Azure Data Factory. It requires the following parameters:
   - `name` (string): The name of the data factory.
   - `location` (string): The Azure region where the data factory will be created.
   - `resource_group_name` (string): The name of the resource group containing the data factory.

Example:
```hcl
resource "azurerm_data_factory" "adf" {
  name                = var.data_factory_name
  location            = var.location
  resource_group_name = var.resource_group_name
}
```

3. `azurerm_data_factory_linked_service_azure_blob_storage` resource: This resource creates a linked service for Azure Blob Storage in the Azure Data Factory. It requires the following parameters:
   - `name` (string): The name of the linked service.
   - `data_factory_id` (string): The ID of the Azure Data Factory.
   - `connection_string` (string): The connection string of the Azure Storage Account.

Example:
```hcl
resource "azurerm_data_factory_linked_service_azure_blob_storage" "adf-ls" {
  name              = var.linked_service_name
  data_factory_id   = azurerm_data_factory.adf.id
  connection_string = data.azurerm_storage_account.example.primary_connection_string
}
```

## Useful details
- The `var` prefix in the code refers to input variables that can be defined in a separate variables file or passed as command-line arguments to Terraform.
- The `data` prefix is used to retrieve information about existing resources.
- The `azurerm_` prefix is used for Azure resource types.
- The `resource_group_name` parameter should be set to the name of the resource group where the Azure resources will be created.
- The `location` parameter should be set to the desired Azure region for the resources.
- The `primary_connection_string` property is used to establish a connection to the Azure Storage Account.