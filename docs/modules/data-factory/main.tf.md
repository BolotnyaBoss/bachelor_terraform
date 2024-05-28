# main.tf
## Overview
The `main.tf` file is a Terraform configuration file that is used to define and provision Azure resources. This file specifically focuses on creating an Azure Data Factory and linking it to an Azure Blob Storage account. 

In a software project, this file plays a crucial role in setting up the necessary infrastructure for data integration and orchestration tasks. It allows developers to automate the creation of data pipelines, data movement, and data transformation activities within Azure.

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Usage](#usage)
3. [Methods](#methods)
4. [Useful details](#properties)

## Prerequisites
To use this file, the following prerequisites must be met:
- Terraform installed on the machine with the required version compatible with the configuration file.
- Azure subscription and appropriate permissions to create resources.

## Usage
To use this file in a project, follow these steps:

1. Set the required variables in a separate `variables.tf` file or through Terraform command-line arguments. For example:
```terraform
variable "storage_account_name" {
  description = "The name of the Azure Storage Account."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Azure Resource Group."
  type        = string
}

variable "data_factory_name" {
  description = "The name of the Azure Data Factory."
  type        = string
}

variable "location" {
  description = "The Azure region where the resources will be provisioned."
  type        = string
}

variable "linked_service_name" {
  description = "The name of the linked service to Azure Blob Storage."
  type        = string
}

```

2. Initialize the Terraform working directory by running the following command:
```
terraform init
```

3. Verify the execution plan by running the following command:
```
terraform plan
```

4. Apply the configuration to create the Azure resources by running the following command:
```
terraform apply
```

## Methods
This file does not contain any methods or functions. It defines Terraform resources using the Azure provider.

## Useful details
- The `data "azurerm_storage_account" "example"` block retrieves the necessary details of an existing Azure Storage Account. It uses the values provided in the `var.storage_account_name` and `var.resource_group_name` variables.
- The `resource "azurerm_data_factory" "adf"` block creates an Azure Data Factory using the specified name, location, and resource group.
- The `resource "azurerm_data_factory_linked_service_azure_blob_storage" "adf-ls"` block links the created Data Factory to an Azure Blob Storage account. It uses the `var.linked_service_name` variable and references the previously created Data Factory using `azurerm_data_factory.adf.id`.
- The `connection_string` parameter in the `azurerm_data_factory_linked_service_azure_blob_storage` block is populated with the primary connection string of the Azure Storage Account retrieved in the `data "azurerm_storage_account" "example"` block.