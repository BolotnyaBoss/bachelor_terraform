# main.tf
## Overview
This Terraform configuration file defines an Azure Resource Group resource using the `azurerm` provider. It establishes a resource group with a specified name and a fixed location (`eastus`). In the context of a larger infrastructure-as-code project, this file serves as the foundational setup to group and organize Azure resources under a common lifecycle and access policy.

## Table of Contents
1. [Prerequisites](#prerequisites)  
2. [Usage](#usage)  
3. [Methods](#methods)  
4. [Useful details](#useful-details)  

## Prerequisites
- Terraform installed (version compatible with `azurerm` provider).
- Azure Provider (`azurerm`) configured and initialized.
- Azure Subscription access with permissions to create resource groups.
- Variable `resource_group_name` must be defined, typically in a `variables.tf` or via inline variable input.

## Usage
1. Define the variable `resource_group_name` in a `variables.tf` file or pass it through CLI/environment variables.
2. Initialize Terraform with `terraform init`.
3. Apply the configuration using `terraform apply`.
4. This will create an Azure Resource Group named as per the provided variable in the `eastus` region.

Example `variables.tf` snippet for usage:
```hcl
variable "resource_group_name" {
  description = "The name of the Azure Resource Group"
  type        = string
}
```

Example CLI command:
```bash
terraform apply -var="resource_group_name=myResourceGroup"
```

## Methods
This file contains a single Terraform resource block:
- `azurerm_resource_group.rg`
  - **Parameters:**
    - `name` (string): The resource group's name, supplied from the `resource_group_name` variable.
    - `location` (string): Fixed Azure region; set here as `"eastus"`.

Terraform handles lifecycle methods implicitly (create, read, update, delete) for this resource based on this declaration.

## Useful details
- The location is fixed to `"eastus"`. For multi-region deployments, this should be parameterized.
- The resource group is a logical container that helps manage and organize Azure resources by lifecycle, permissions, and billing.
- Ensure the `azurerm` provider is defined and properly configured elsewhere in the project before applying this module.