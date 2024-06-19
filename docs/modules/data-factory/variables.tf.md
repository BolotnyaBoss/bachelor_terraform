# variables.tf

## Overview
This file is a Terraform configuration file used for defining variables. It provides a way to interact with the Terraform environment and pass values into the infrastructure provisioning process. The variables defined in this file can be used to configure various aspects of the infrastructure and customize deployments.

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Usage](#usage)
3. [Variables](#variables)
4. [Useful details](#useful-details)

## Prerequisites
There are no specific dependencies or prerequisites required to use this file.

## Usage
To use this file in a project, you need to create a Terraform configuration file (e.g., main.tf) and reference the variables defined in this file. For example:

```terraform
resource "azurerm_storage_account" "example" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_data_factory" "example" {
  name                = var.data_factory_name
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_data_factory_linked_service_azure_blob_storage" "example" {
  name                   = var.linked_service_name
  resource_group_name    = var.resource_group_name
  data_factory_name      = azurerm_data_factory.example.name
  storage_account_name   = azurerm_storage_account.example.name
  storage_account_key    = azurerm_storage_account.example.primary_access_key
  container_name         = "example-container"
  linked_service_enabled = true
}
```

## Variables
- `resource_group_name`: The name of the resource group in which to create the storage account.
- `location`: The location where the storage account will be created.
- `data_factory_name`: The name of the data factory instance.
- `storage_account_name`: The name of the storage account.
- `linked_service_name`: The name of the linked service in the Azure Data Factory instance.

## Useful details
- The `type` attribute for all variables is set to `string`, indicating that the expected input values should be of string type.
- The `description` attribute for each variable provides a brief explanation of its purpose.
- These variables can be used in conjunction with other Terraform resources and modules to provision and configure infrastructure in Azure.