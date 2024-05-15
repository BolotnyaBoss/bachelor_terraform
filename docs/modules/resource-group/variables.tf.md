# variables.tf
## Overview
The `variables.tf` file is used to define variables in a Terraform project. These variables can be used to parameterize the Terraform configuration and allow users to customize various aspects of the infrastructure being deployed.

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Usage](#usage)
3. [Variables](#variables)
4. [Useful details](#useful-details)

## Prerequisites
There are no specific dependencies or prerequisites required to use the `variables.tf` file. However, it is assumed that the user has a basic understanding of Terraform and how to use variables in a Terraform configuration.

## Usage
To use the `variables.tf` file, you need to define variables and their properties within the file. These variables can then be referenced and used within the Terraform configuration files.

Here is an example of how to define and use variables in `variables.tf`:

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

In the example above, two variables are defined: `resource_group_name` and `location`. The `type` property specifies the data type of the variable, and the `description` property provides a brief description of the variable.

To use these variables in other Terraform configuration files, you can reference them using the `var` prefix, like this:

```terraform
resource "azurerm_resource_group" "example" {
    name     = var.resource_group_name
    location = var.location
}
```

In this example, the `name` and `location` properties of the `azurerm_resource_group` resource are set to the values of the `resource_group_name` and `location` variables, respectively.

## Variables
- `resource_group_name`: The name of the resource group. (string)
- `location`: The location of the resource group. (string)

## Useful details
- Variables defined in `variables.tf` can be passed values through various methods such as command line flags, environment variables, or input files.
- Variables can be used to make the Terraform configuration more flexible and reusable by allowing users to customize different aspects of the infrastructure being deployed.