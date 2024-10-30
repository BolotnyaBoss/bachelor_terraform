# variables.tf
## Overview
The `variables.tf` file is used to define the variables that will be used in the project. It specifies the type and the description of each variable. This file plays a crucial role in configuring the project and allows for easy customization and parameterization.

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Usage](#usage)
3. [Methods](#methods)
4. [Useful details](#properties)

## Prerequisites
There are no specific dependencies or prerequisites required to use the `variables.tf` file.

## Usage
To utilize the `variables.tf` file in a project, you need to follow these steps:

1. Create a new file named `variables.tf` in your project directory.
2. Copy the code from the example below into the `variables.tf` file.
3. Modify the variables as per your project requirements.

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

## Methods
There are no methods or functions in this file. It contains only variable definitions.

## Useful details
- Each variable is defined using the `variable` keyword, followed by the variable name in quotes.
- The `type` attribute specifies the data type of the variable (in this case, all variables are of type `string`).
- The `description` attribute provides a brief description of the purpose of each variable.
- These variables can be used in other Terraform files within the project using interpolation syntax, such as `${var.resource_group_name}` to reference the value of the `resource_group_name` variable.