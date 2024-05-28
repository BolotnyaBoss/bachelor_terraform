# main.tf
## Overview
The `main.tf` file is a Terraform configuration file that defines and manages Azure resource groups. It uses the `azurerm_resource_group` resource to create a resource group in the Azure cloud.

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Usage](#usage)
3. [Methods](#methods)
4. [Useful details](#properties)

## Prerequisites
- Terraform version 0.12 or later
- Azure CLI installed and configured with appropriate credentials

## Usage
To use this file in a project, follow these steps:
1. Create a new directory for your Terraform project.
2. Place the `main.tf` file inside the project directory.
3. Initialize the Terraform project by running the command: `terraform init`
4. Modify the value of the `var.resource_group_name` variable in the `main.tf` file to specify the desired name for the resource group.
5. Apply the Terraform configuration to create the resource group by running the command: `terraform apply`

## Methods
### azurerm_resource_group.rg
This method creates an Azure resource group in the specified location.

#### Parameters
- `name` (string): The name of the resource group. This value is provided through the `var.resource_group_name` variable.
- `location` (string): The location where the resource group will be created. In this example, it is set to "eastus".

#### Example
```
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = "eastus"
}
```

## Useful details
- The `var.resource_group_name` variable should be defined and set to the desired name of the resource group before applying the Terraform configuration.
- The `location` parameter can be customized to specify a different region for the resource group.
- Additional resources and configurations can be added to the `main.tf` file to create and manage other Azure resources within the resource group.