# variables.tf
## Overview
The `variables.tf` file is used to define the variables that will be used in a Terraform project. It allows users to specify the values of these variables when running the project, providing flexibility and customization.

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Usage](#usage)
3. [Variables](#variables)
4. [Useful details](#useful-details)

## Prerequisites
There are no specific dependencies or prerequisites required to use the `variables.tf` file. However, it is typically used in conjunction with other Terraform files that define resources and configurations.

## Usage
To use the `variables.tf` file in a Terraform project, follow these steps:

1. Create a new Terraform project or navigate to an existing project.
2. Open the `variables.tf` file.
3. Define the variables by specifying their type and description using the following format:
   ```
   variable "<variable_name>" {
       type        = <variable_type>
       description = "<variable_description>"
   }
   ```
   For example:
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
4. Save the `variables.tf` file.

When running the Terraform project, the values of these variables can be provided either through command-line arguments or through a separate `.tfvars` file.

## Variables
The `variables.tf` file defines the following variables:

1. `resource_group_name`: This variable represents the name of the resource group. It has a type of `string` and a description of "The name of resource group".

2. `location`: This variable represents the location of the resource group. It has a type of `string` and a description of "The location of resource group".

## Useful details
- The variables defined in the `variables.tf` file can be referenced in other Terraform files using the `var.<variable_name>` syntax. For example, to reference the `resource_group_name` variable, use `var.resource_group_name`.

- The values of these variables can be provided when running the Terraform project using command-line arguments or by creating a separate `.tfvars` file. For example, to provide the value of `resource_group_name` as a command-line argument, use `terraform apply -var="resource_group_name=example"`.

- It is recommended to provide default values for variables in the `variables.tf` file to ensure that the project can be run without explicitly providing values for all variables. This can be done by adding a `default` attribute to the variable definition.