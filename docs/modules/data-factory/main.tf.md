# main.tf
## Overview
The `main.tf` file is used in an Azure infrastructure project and is responsible for defining the resources and their configurations. It uses the Terraform language to describe the desired state of the infrastructure.

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Usage](#usage)
3. [Methods](#methods)
4. [Useful details](#properties)

## Prerequisites
To use the `main.tf` file, the following prerequisites are required:
- Terraform installed (version X.X.X)
- Azure CLI installed (version X.X.X)
- Azure subscription

## Usage
To utilize the `main.tf` file in a project, follow these steps:
1. Set up Azure credentials by running `az login` command.
2. Initialize the Terraform project by running `terraform init` command.
3. Modify the variables defined in the `variables.tf` file to match your desired configuration.
4. Run `terraform plan` to review the changes that will be applied to the infrastructure.
5. Run `terraform apply` to apply the changes and create/update the resources.

## Methods
The `main.tf` file defines several resources using Azure provider blocks and their corresponding resource blocks. Here are the methods used in this file:

### data "azurerm_storage_account"
This method retrieves the details of an Azure storage account. It takes the following parameters:
- `name`: The name of the storage account.
- `resource_group_name`: The name of the resource group where the storage account is located.

Example usage:
```terraform
data "azurerm_storage_account" "example" {
  name                = var.storage_account_name
  resource_group_name = var.resource_group_name
}
```

### resource "azurerm_data_factory"
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

### resource "azurerm_data_factory_linked_service_azure_blob_storage"
This method creates a linked service for Azure Blob Storage in an Azure Data Factory. It takes the following parameters:
- `name`: The name of the linked service.
- `data_factory_id`: The ID of the Azure Data Factory resource.
- `connection_string`: The connection string of the Azure storage account.

Example usage:
```terraform
resource "azurerm_data_factory_linked_service_azure_blob_storage" "adf-ls" {
  name              = var.linked_service_name
  data_factory_id   = azurerm_data_factory.adf.id
  connection_string = data.azurerm_storage_account.example.primary_connection_string
}
```

## Useful details
- The `main.tf` file is just one part of a larger Terraform project that may include other files such as `variables.tf` and `outputs.tf`.
- The variables used in the `main.tf` file are typically defined in a separate `variables.tf` file.
- The `terraform init` command should be run in the same directory as the `main.tf` file to initialize the project.
- The Azure provider and version used in the `main.tf` file can be specified in a `provider.tf` file or in the project configuration.
- The `terraform plan` command allows you to review the changes that will be applied to the infrastructure before actually applying them.