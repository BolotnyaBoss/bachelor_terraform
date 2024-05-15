# main.tf
## Overview
The `main.tf` file is used to define and configure Azure resources in a Terraform project. It contains Terraform configuration code written in HashiCorp Configuration Language (HCL). This file is responsible for creating a data factory and configuring a linked service to an Azure Blob Storage account in the project.

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Usage](#usage)
3. [Methods](#methods)
4. [Useful details](#properties)

## Prerequisites
To use the code in `main.tf`, the following prerequisites are required:
- [Terraform](https://www.terraform.io/) installed on the machine.
- Azure CLI or credentials with access to an Azure subscription.

## Usage
To use this file in a Terraform project, follow these steps:
1. Install Terraform on your machine.
2. Set up your Azure credentials or Azure CLI login.
3. Create a new `.tf` file in your Terraform project directory, e.g., `main.tf`.
4. Copy the code from `main.tf` into the new file.
5. Modify the values of the variables (`var.storage_account_name`, `var.resource_group_name`, etc.) according to your project requirements.
6. Run `terraform init` to initialize the Terraform project.
7. Run `terraform apply` to create the data factory and configure the linked service in Azure.

## Methods
### data "azurerm_storage_account" "example"
This block defines a Terraform data resource of type `azurerm_storage_account`. It retrieves the details of an existing Azure Storage Account based on the provided `storage_account_name` and `resource_group_name` variables.

Example:
```terraform
data "azurerm_storage_account" "example" {
  name                = var.storage_account_name
  resource_group_name = var.resource_group_name
}
```

### resource "azurerm_data_factory" "adf"
This block defines a Terraform resource of type `azurerm_data_factory`. It creates a new Azure Data Factory with the specified `name`, `location`, and `resource_group_name` variables.

Example:
```terraform
resource "azurerm_data_factory" "adf" {
  name                = var.data_factory_name
  location            = var.location
  resource_group_name = var.resource_group_name
}
```

### resource "azurerm_data_factory_linked_service_azure_blob_storage" "adf-ls"
This block defines a Terraform resource of type `azurerm_data_factory_linked_service_azure_blob_storage`. It configures a linked service to an Azure Blob Storage account within the Azure Data Factory. The linked service is associated with the data factory specified by the `data_factory_id` variable, and the connection string is fetched from the `primary_connection_string` of the `azurerm_storage_account.example` data resource.

Example:
```terraform
resource "azurerm_data_factory_linked_service_azure_blob_storage" "adf-ls" {
  name              = var.linked_service_name
  data_factory_id   = azurerm_data_factory.adf.id
  connection_string = data.azurerm_storage_account.example.primary_connection_string
}
```

## Useful details
- The `name` parameter in each resource block represents the name of the resource being created.
- The `location` parameter in the `azurerm_data_factory.adf` resource block specifies the Azure region where the data factory will be created.
- The `connection_string` parameter in the `azurerm_data_factory_linked_service_azure_blob_storage.adf-ls` resource block is used to establish a connection between the data factory and the Azure Blob Storage account.