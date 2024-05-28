# main.tf
## Overview
The `main.tf` file is a Terraform configuration file that is used to define and provision Azure resources. It contains code to create an Azure Storage Account, an Azure Data Factory, and a linked service for Azure Blob Storage. The file plays a crucial role in provisioning and managing the infrastructure components of a software project.

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Usage](#usage)
3. [Methods](#methods)
4. [Useful details](#properties)

## Prerequisites
To use this file, you need to have the following dependencies installed:
- Terraform (version 0.12 or above)
- Azure CLI (logged in with appropriate permissions)

## Usage
To use the `main.tf` file in your project, follow these steps:

1. Create a new Terraform project and initialize it:
   ```shell
   terraform init
   ```

2. Create a `variables.tf` file and define the required variables:
   ```hcl
   variable "storage_account_name" {
     type        = string
     description = "Name of the Azure Storage Account"
   }

   variable "resource_group_name" {
     type        = string
     description = "Name of the Azure Resource Group"
   }

   variable "data_factory_name" {
     type        = string
     description = "Name of the Azure Data Factory"
   }

   variable "location" {
     type        = string
     description = "Location of the Azure resources"
   }

   variable "linked_service_name" {
     type        = string
     description = "Name of the Azure Blob Storage linked service"
   }
   ```

3. Populate the `main.tf` file with the code provided.

4. Run the following command to provision the Azure resources:
   ```shell
   terraform apply
   ```

## Methods
The `main.tf` file defines the following resources and data blocks:

### Data Block: azurerm_storage_account.example
This data block retrieves the details of an existing Azure Storage Account. It takes the following parameters:
- `name`: The name of the Azure Storage Account.
- `resource_group_name`: The name of the Azure Resource Group.

Example usage:
```hcl
data "azurerm_storage_account" "example" {
  name                = var.storage_account_name
  resource_group_name = var.resource_group_name
}
```

### Resource Block: azurerm_data_factory.adf
This resource block creates an Azure Data Factory. It takes the following parameters:
- `name`: The name of the Azure Data Factory.
- `location`: The location of the Azure Data Factory.
- `resource_group_name`: The name of the Azure Resource Group.

Example usage:
```hcl
resource "azurerm_data_factory" "adf" {
  name                = var.data_factory_name
  location            = var.location
  resource_group_name = var.resource_group_name
}
```

### Resource Block: azurerm_data_factory_linked_service_azure_blob_storage.adf-ls
This resource block creates a linked service for Azure Blob Storage within the Azure Data Factory. It takes the following parameters:
- `name`: The name of the Azure Blob Storage linked service.
- `data_factory_id`: The ID of the Azure Data Factory.
- `connection_string`: The connection string of the Azure Storage Account.

Example usage:
```hcl
resource "azurerm_data_factory_linked_service_azure_blob_storage" "adf-ls" {
  name              = var.linked_service_name
  data_factory_id   = azurerm_data_factory.adf.id
  connection_string = data.azurerm_storage_account.example.primary_connection_string
}
```

## Useful details
- The `main.tf` file uses the Azure provider for Terraform (`azurerm`) to interact with Azure resources.
- It retrieves the connection string of the Azure Storage Account using the `data.azurerm_storage_account.example.primary_connection_string` attribute.
- You can modify the values of the variables defined in the `variables.tf` file to customize the resource names and locations.
- Ensure that you have the necessary permissions and credentials to create and manage Azure resources.