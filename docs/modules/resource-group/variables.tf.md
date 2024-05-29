# variables.tf
## Overview
The `variables.tf` file is used to define and declare variables that will be used in a Terraform project. It is a configuration file that allows users to define the values for these variables, which can then be referenced in other Terraform files. This file plays a crucial role in providing flexibility and customization to a Terraform project by allowing users to easily modify the values of variables without changing the underlying infrastructure code.

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Usage](#usage)
3. [Methods](#methods)
4. [Useful details](#properties)

## Prerequisites
There are no specific dependencies or prerequisites required to use the `variables.tf` file. However, it is typically used in conjunction with other Terraform configuration files to define and manage infrastructure resources.

## Usage
To use the `variables.tf` file, follow these steps:

1. Create a new Terraform project or navigate to an existing project directory.
2. Create a file named `variables.tf` and place it in the project directory.
3. Define the variables and their properties in the `variables.tf` file using the following syntax:

```terraform
variable "<variable_name>" {
    type        = <variable_type>
    description = "<variable_description>"
}
```

4. Replace `<variable_name>` with the desired name for the variable.
5. Replace `<variable_type>` with the desired type for the variable (e.g., string, number, bool, list, etc.).
6. Replace `<variable_description>` with a brief description of the variable's purpose.

Example usage:

```terraform
variable "resource_group_name" {
    type        = string
    description = "The name of resource group"
}

variable "location" {
    type        = string
    description = "The location of resource group"
}
```

7. Save the `variables.tf` file.

## Methods
The `variables.tf` file does not contain any methods or functions. It is used solely for declaring and defining variables.

## Useful details
- Variables defined in the `variables.tf` file can be referenced and used in other Terraform files within the same project.
- The `type` attribute of a variable determines the data type of the variable. It can be set to `string`, `number`, `bool`, `list`, `map`, etc.
- The `description` attribute provides a brief description of the variable's purpose, making it easier for other users to understand its usage.
- Variables can be assigned default values using the `default` attribute. If a variable has a default value and is not provided a value during runtime, the default value will be used.
- Variable values can be overridden when running Terraform commands by using the `-var` flag followed by the variable name and value. For example: `terraform apply -var="resource_group_name=my-rg"`.