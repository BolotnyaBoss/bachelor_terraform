# main.tf
## Overview
The `main.tf` file is a Terraform configuration file used to define and provision Azure resources. It is part of a larger project that aims to create an Azure Data Factory and link it to an Azure Blob Storage account.

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Usage](#usage)
3. [Methods](#methods)
4. [Useful details](#properties)

## Prerequisites
In order to use this `main.tf` file, you will need the following:
- Terraform installed on your machine.
- Azure CLI installed and authenticated with your Azure account.
- Azure Storage Account created with the necessary permissions.
- Azure Data Factory created with the necessary permissions.

## Usage
To use this `main.tf` file, follow these steps:
1. Set the required input variables in a separate `variables.tf` file or by passing them directly to Terraform.
2. Initialize the Terraform configuration by running `terraform init` in the directory containing the `main.tf` file.
3. Preview the changes that Terraform will make by running `terraform plan`.
4. Apply the changes and provision the Azure resources by running `terraform apply`.

## Methods
This `main.tf` file defines the following resources and data sources:

### Data Source: azurerm_storage_account.example
This data source retrieves information about an existing Azure Storage Account. It requires the following parameters:
- `name`: The name of the storage account.
- `resource_group_name`: The name of the resource group containing the storage account.

Example usage:
```hcl
data "azurerm_storage_account" "example" {
  name                = var.storage_account_name
  resource_group_name = var.resource_group_name
}
```

### Resource: azurerm_data_factory.adf
This resource creates an Azure Data Factory. It requires the following parameters:
- `name`: The name of the data factory.
- `location`: The Azure region where the data factory will be created.
- `resource_group_name`: The name of the resource group where the data factory will be created.

Example usage:
```hcl
resource "azurerm_data_factory" "adf" {
  name                = var.data_factory_name
  location            = var.location
  resource_group_name = var.resource_group_name
}
```

### Resource: azurerm_data_factory_linked_service_azure_blob_storage.adf-ls
This resource creates a linked service in the Azure Data Factory, specifically for Azure Blob Storage. It requires the following parameters:
- `name`: The name of the linked service.
- `data_factory_id`: The ID of the Azure Data Factory.
- `connection_string`: The primary connection string of the Azure Storage Account.

Example usage:
```hcl
resource "azurerm_data_factory_linked_service_azure_blob_storage" "adf-ls" {
  name              = var.linked_service_name
  data_factory_id   = azurerm_data_factory.adf.id
  connection_string = data.azurerm_storage_account.example.primary_connection_string
}
```

## Useful details
- This `main.tf` file uses the Azure provider for Terraform. Make sure you have the latest version of the Azure provider installed.
- Ensure that the necessary permissions are in place for the Azure account used to authenticate Terraform.
- Input variables can be passed to the `main.tf` file either through a separate `variables.tf` file or by passing them directly to Terraform using the `-var` flag.