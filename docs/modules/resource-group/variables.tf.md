# variables.tf
## Overview
This Terraform variables file defines input parameters for a Terraform configuration, specifically for managing an Azure resource group. It declares reusable variables for the resource group name and its location, enabling flexible and configurable deployments in an infrastructure-as-code project.

## Table of Contents
1. [Prerequisites](#prerequisites)  
2. [Usage](#usage)  
3. [Methods](#methods)  
4. [Useful details](#useful-details)  

## Prerequisites
- Terraform CLI installed (version 0.12 or newer recommended)  
- Azure provider configured in your Terraform project  
- Access rights to create or manage Azure resource groups  

## Usage
To utilize these variables in your Terraform project, declare them in your `variables.tf` file as shown and assign values either via a `terraform.tfvars` file, environment variables, or directly in the command line.

Example `terraform.tfvars` file:
```hcl
resource_group_name = "my-resource-group"
location            = "East US"
```

You can reference these variables in resource definitions like:
```hcl
resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}
```

## Methods
This file solely defines variables, so no methods or functions are present.

- **variable "resource_group_name"**  
  - Type: `string`  
  - Description: The name of the Azure resource group to be created or managed.  

- **variable "location"**  
  - Type: `string`  
  - Description: Geographic location for the Azure resource group (e.g., "East US").

## Useful details
- Defining variables this way promotes reusability and flexibility across environments.  
- Variables improve code clarity by separating configuration details from resource declarations.  
- Can be overridden on the CLI with `-var "resource_group_name=example"` or through environment variables like `TF_VAR_resource_group_name`.