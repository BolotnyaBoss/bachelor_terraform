# outputs.tf

## Overview
This Terraform outputs file defines key output variables that expose important attributes from the Azure resource group created elsewhere in the configuration. Specifically, it outputs the resource group’s name and location. These outputs help other Terraform modules or scripts consume this information, allowing better integration and reuse across the broader project infrastructure.

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Usage](#usage)
3. [Methods](#methods)
4. [Useful details](#useful-details)

## Prerequisites
- A Terraform configuration that includes the Azure Resource Manager (azurerm) provider.
- An existing resource group declared with the name `azurerm_resource_group.rg`.
- Terraform CLI installed (version compatible with azurerm provider used).

## Usage
To use these outputs in your Terraform project:
1. Ensure your configuration creates or imports an Azure resource group and names the resource `rg`.
2. After applying the Terraform plan, retrieve the values using Terraform output commands or reference them in other modules.

Example:
```bash
terraform apply
terraform output name      # Outputs the Resource Group name
terraform output location  # Outputs the Resource Group location
```

Or reference outputs in another module:
```hcl
module "example" {
  source = "./modules/some-module"

  rg_name     = output.name
  rg_location = output.location
}
```

## Methods
This file contains two output blocks:

- `output "name"`  
  - **value**: `azurerm_resource_group.rg.name`  
  - **description**: Outputs the Azure Resource Group’s name.  

- `output "location"`  
  - **value**: `azurerm_resource_group.rg.location`  
  - **description**: Outputs the Azure Resource Group’s region/location.

## Useful details
- Outputs are used for exposing values to the CLI user or for passing between modules.
- Naming these outputs clearly helps maintain readability and reusability in bigger Terraform projects.
- Useful in CI/CD pipelines where subsequent steps require resource group information without hardcoding values.