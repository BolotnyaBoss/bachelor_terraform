# variables.tf
## Overview
The `variables.tf` file is used in a project to define and declare variables that will be used throughout the project. These variables can be used to configure and customize different aspects of the project, such as resource group names, locations, data factory names, storage account names, and linked service names. The file provides a centralized location to define and manage these variables, making it easier to maintain and update them as needed.

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Usage](#usage)
3. [Methods](#methods)
4. [Useful details](#properties)

## Prerequisites
There are no specific dependencies or prerequisites required to use the `variables.tf` file.

## Usage
To use the `variables.tf` file in a project, you need to define the values for each variable declared in the file. These values can be provided directly in the file itself or passed in as input during the execution of the project.

Example usage in a Terraform project:
```terraform
variable "resource_group_name" {
    type        = string
    description = "The name of resource group in which to create storage account"
}

variable "location" {
    type        = string
    description = "The location where create storage account"
}

variable "data_factory_name" {
    type        = string
    description = "The name of data factory instance"
}

variable "storage_account_name" {
    type        = string
    description = "The name of storage account"
}

variable "linked_service_name" {
    type        = string
    description = "The name of linked service in adf instance"
}

resource "azurerm_storage_account" "example" {
    name                     = var.storage_account_name
    location                 = var.location
    resource_group_name      = var.resource_group_name
    account_tier             = "Standard"
    account_replication_type = "LRS"
}
```

In the above example, the variables defined in `variables.tf` are referenced using the `var` prefix, and their values are used to configure the creation of an Azure Storage Account using the `azurerm_storage_account` resource.

## Methods
There are no methods or functions in the `variables.tf` file. It only contains variable declarations.

## Useful details
- The `type` attribute of each variable declaration specifies the data type of the variable.
- The `description` attribute provides a brief description of what the variable is used for.
- The values of these variables can be accessed and utilized in other parts of the project by referencing them using the `var` prefix.