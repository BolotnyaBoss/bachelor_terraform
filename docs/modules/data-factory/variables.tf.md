# variables.tf
## Overview
The `variables.tf` file is used to define variables that can be utilized throughout a software project. It serves as a centralized location to store and manage variable definitions, making it easier to update and maintain the project.

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Usage](#usage)
3. [Variables](#variables)
4. [Useful details](#useful-details)

## Prerequisites
There are no specific dependencies or prerequisites required to use the `variables.tf` file.

## Usage
To use the variables defined in the `variables.tf` file, you can reference them in other parts of your project by using the syntax `var.<variable_name>`. For example, to access the value of the `resource_group_name` variable, you would use `var.resource_group_name`.

## Variables
The `variables.tf` file defines the following variables:

1. `resource_group_name`: The name of the resource group in which to create a storage account. It is of type `string`.

2. `location`: The location where the storage account should be created. It is of type `string`.

3. `data_factory_name`: The name of the data factory instance. It is of type `string`.

4. `storage_account_name`: The name of the storage account. It is of type `string`.

5. `linked_service_name`: The name of the linked service in the ADF (Azure Data Factory) instance. It is of type `string`.

Example usage of the variables in other parts of the project:

```terraform
resource "azurerm_storage_account" "example" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
```

## Useful details
- The variables defined in the `variables.tf` file can be used across multiple modules or files within the project.
- The values of the variables can be overridden at runtime using input variables or environment variables.