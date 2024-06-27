# main.tf
## Overview
The `main.tf` file is used for configuring and provisioning Azure resources using Terraform. It is part of a larger project that aims to create and manage resources in Azure. This file specifically focuses on creating an Azure Data Factory and linking it to an Azure Blob Storage account.

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Usage](#usage)
3. [Methods](#methods)
4. [Useful details](#properties)

## Prerequisites
To use this file, you need to have the following dependencies:
- Terraform version 0.12 or later
- Azure CLI installed and authenticated

## Usage
To use this file, follow these steps:
1. Ensure you have the prerequisites mentioned above.
2. Create a new Terraform configuration file (e.g. `main.tf`).
3. Copy the code provided in this file to your `main.tf` file.
4. Modify the variables `var.storage_account_name`, `var.resource_group_name`, `var.data_factory_name`, `var.location`, and `var.linked_service_name` according to your desired values.
5. Run `terraform init` to initialize the working directory.
6. Run `terraform plan` to see the execution plan for the resources to be created.
7. Run `terraform apply` to create the Azure Data Factory and link it to the Azure Blob Storage account.

## Methods
This file contains the following methods:
1. `data "azurerm_storage_account" "example"`: Retrieves information about an existing Azure Storage Account. It takes the `storage_account_name` and `resource_group_name` variables as input and returns the storage account details.
   
   Example usage:
   ```terraform
   data "azurerm_storage_account" "example" {
     name                = var.storage_account_name
     resource_group_name = var.resource_group_name
   }
   ```

2. `resource "azurerm_data_factory" "adf"`: Creates an Azure Data Factory. It takes the `data_factory_name`, `location`, and `resource_group_name` variables as input and returns the created data factory details.

   Example usage:
   ```terraform
   resource "azurerm_data_factory" "adf" {
     name                = var.data_factory_name
     location            = var.location
     resource_group_name = var.resource_group_name
   }
   ```

3. `resource "azurerm_data_factory_linked_service_azure_blob_storage" "adf-ls"`: Creates a linked service in the Azure Data Factory that connects to an Azure Blob Storage account. It takes the `linked_service_name`, `data_factory_id`, and `connection_string` variables as input and returns the created linked service details.

   Example usage:
   ```terraform
   resource "azurerm_data_factory_linked_service_azure_blob_storage" "adf-ls" {
     name              = var.linked_service_name
     data_factory_id   = azurerm_data_factory.adf.id
     connection_string = data.azurerm_storage_account.example.primary_connection_string
   }
   ```

## Useful details
- This file uses Azure provider for Terraform to interact with Azure resources.
- The `var.storage_account_name`, `var.resource_group_name`, `var.data_factory_name`, `var.location`, and `var.linked_service_name` variables need to be defined before using this file.