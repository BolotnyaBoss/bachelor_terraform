# variables.tf
## Overview
The `variables.tf` file is used to define and configure variables that will be used in a software project. These variables can be used to customize and parameterize various aspects of the project, such as resource names, locations, and service names. The file serves as a central location for managing and updating these variables, making it easier to maintain and modify the project.

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Usage](#usage)
3. [Variables](#variables)
4. [Useful details](#useful-details)

## Prerequisites
There are no specific dependencies or prerequisites required to use the `variables.tf` file.

## Usage
To utilize the `variables.tf` file in a project, follow these steps:

1. Create a new file named `variables.tf` in the project directory.
2. Copy the code from the example below into the `variables.tf` file.
3. Modify the variable values according to your project requirements.

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
```

## Variables
The `variables.tf` file defines the following variables:

1. `resource_group_name`: The name of the resource group in which to create the storage account. This variable is of type `string`.
2. `location`: The location where the storage account should be created. This variable is of type `string`.
3. `data_factory_name`: The name of the data factory instance. This variable is of type `string`.
4. `storage_account_name`: The name of the storage account. This variable is of type `string`.
5. `linked_service_name`: The name of the linked service in the data factory instance. This variable is of type `string`.

These variables can be customized and used throughout the project to provide flexibility and adaptability.

## Useful details
- The `description` field for each variable provides a brief explanation of its purpose and usage.
- The `type` field specifies the data type of each variable.
- Additional variables can be added to the `variables.tf` file as needed, following the same structure and conventions as the existing variables.