# variables.tf
## Overview
The 'variables.tf' file is used to define and declare variables that will be used in a software project. It specifies the type and description of each variable. These variables can be used to provide dynamic values to other parts of the project, such as infrastructure provisioning or configuration settings.

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Usage](#usage)
3. [Variables](#variables)
4. [Useful details](#useful-details)

## Prerequisites
No dependencies or prerequisites are required to use this file.

## Usage
To use the variables defined in this file, they need to be instantiated and assigned values. These values can be provided directly in the file or passed in from external sources such as command-line arguments or environment variables. Here's an example of how to instantiate and utilize the variables in a project:

```terraform
# main.tf

# Include the variables defined in variables.tf
variable "resource_group_name" {}
variable "location" {}
variable "data_factory_name" {}
variable "storage_account_name" {}
variable "linked_service_name" {}

# Assign values to the variables
locals {
  my_resource_group_name    = var.resource_group_name
  my_location              = var.location
  my_data_factory_name      = var.data_factory_name
  my_storage_account_name   = var.storage_account_name
  my_linked_service_name    = var.linked_service_name
}

# Use the variables in other parts of the project
resource "azurerm_resource_group" "example" {
  name     = local.my_resource_group_name
  location = local.my_location
}

# ...
```

## Variables
1. `resource_group_name`: Represents the name of the resource group in which to create a storage account. This variable is of type `string`.
2. `location`: Represents the location where the storage account should be created. This variable is of type `string`.
3. `data_factory_name`: Represents the name of the data factory instance. This variable is of type `string`.
4. `storage_account_name`: Represents the name of the storage account. This variable is of type `string`.
5. `linked_service_name`: Represents the name of the linked service in the Azure Data Factory instance. This variable is of type `string`.

## Useful details
- The variables defined in this file can be used to provide dynamic values to various parts of the project, such as resource creation, configuration settings, or conditional logic.
- It is recommended to provide default values for the variables to ensure the project can be executed without external inputs.
- The values of the variables can be overridden using command-line arguments or environment variables when running the project.