# main.tf
## Overview
The `main.tf` file is a Terraform configuration file that is used to define and provision resources in Microsoft Azure. It includes the configuration for creating an Azure Storage Account, an Azure Data Factory, and a linked service to Azure Blob Storage. This file plays a crucial role in the project as it sets up the necessary infrastructure components required for data processing and storage in Azure.

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Usage](#usage)
3. [Methods](#methods)
4. [Useful details](#properties)

## Prerequisites
To use this file, the following dependencies are required:
- Terraform (version 0.13 or higher)
- Azure CLI
- Azure subscription

## Usage
To utilize this file in a project, follow these steps:

1. Install Terraform and Azure CLI if not already installed.
2. Set up authentication with your Azure subscription using Azure CLI.
3. Create a file named `variables.tf` in the same directory as `main.tf` and define the required variables. For example:
```hcl
variable "storage_account_name" {
  description = "Name of the Azure Storage Account"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
}

variable "data_factory_name" {
  description = "Name of the Azure Data Factory"
  type        = string
}

variable "location" {
  description = "Azure region where the resources will be deployed"
  type        = string
}

variable "linked_service_name" {
  description = "Name of the Azure Blob Storage linked service"
  type        = string
}
```
4. Run `terraform init` to initialize the Terraform project.
5. Run `terraform plan` to see the planned changes.
6. Run `terraform apply` to provision the Azure resources defined in `main.tf`.

## Methods
This file defines the following resources and data blocks:

### Data Block: `azurerm_storage_account.example`
This data block retrieves the details of an existing Azure Storage Account. It requires the following parameters:
- `name`: Name of the Azure Storage Account (provided through `var.storage_account_name`)
- `resource_group_name`: Name of the Azure Resource Group (provided through `var.resource_group_name`)

Example usage:
```hcl
data "azurerm_storage_account" "example" {
  name                = var.storage_account_name
  resource_group_name = var.resource_group_name
}
```

### Resource Block: `azurerm_data_factory.adf`
This resource block creates an Azure Data Factory. It requires the following parameters:
- `name`: Name of the Azure Data Factory (provided through `var.data_factory_name`)
- `location`: Azure region where the Azure Data Factory will be deployed (provided through `var.location`)
- `resource_group_name`: Name of the Azure Resource Group (provided through `var.resource_group_name`)

Example usage:
```hcl
resource "azurerm_data_factory" "adf" {
  name                = var.data_factory_name
  location            = var.location
  resource_group_name = var.resource_group_name
}
```

### Resource Block: `azurerm_data_factory_linked_service_azure_blob_storage.adf-ls`
This resource block creates a linked service to Azure Blob Storage within the Azure Data Factory. It requires the following parameters:
- `name`: Name of the Azure Blob Storage linked service (provided through `var.linked_service_name`)
- `data_factory_id`: ID of the Azure Data Factory (retrieved from `azurerm_data_factory.adf.id`)
- `connection_string`: Connection string of the Azure Storage Account (retrieved from `data.azurerm_storage_account.example.primary_connection_string`)

Example usage:
```hcl
resource "azurerm_data_factory_linked_service_azure_blob_storage" "adf-ls" {
  name              = var.linked_service_name
  data_factory_id   = azurerm_data_factory.adf.id
  connection_string = data.azurerm_storage_account.example.primary_connection_string
}
```

## Useful details
- The `var` prefix used with variable names refers to the values provided through the `variables.tf` file.
- The `data` prefix used with data block names refers to the retrieved data from existing Azure resources.
- The resources created by this configuration file can be destroyed using the `terraform destroy` command.