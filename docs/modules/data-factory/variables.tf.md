# variables.tf
## Overview
This Terraform variables file defines configurable inputs for a project that provisions Azure resources, specifically focusing on creating and managing a Data Factory instance and its related storage account within a resource group. By externalizing these parameters, the file enables reusable, customizable infrastructure deployments.

## Table of Contents
1. [Prerequisites](#prerequisites)  
2. [Usage](#usage)  
3. [Methods](#methods)  
4. [Useful details](#useful-details)  

## Prerequisites
- Terraform (version compatible with Azure provider)
- Azure subscription with permissions to create resource groups, storage accounts, and Data Factory instances
- Azure Terraform provider configured in the root module or calling module

## Usage
To use these variables, include this file in your Terraform project and reference the variables when defining Azure resources. For example:

```hcl
module "example_adf" {
  source               = "./modules/adf"
  resource_group_name  = var.resource_group_name
  location             = var.location
  data_factory_name    = var.data_factory_name
  storage_account_name = var.storage_account_name
  linked_service_name  = var.linked_service_name
}
```

You can override the default values by providing a `terraform.tfvars` file or by using `-var` command line options when running `terraform apply`.

Example `terraform.tfvars`:
```hcl
resource_group_name  = "my-resource-group"
location             = "eastus"
data_factory_name    = "my-adf-instance"
storage_account_name = "mystorageaccount"
linked_service_name  = "my-linked-service"
```

## Methods
This file does not define methods or functions. It declares Terraform input variables with types and descriptions:

- `resource_group_name` (string): Name of the Azure Resource Group to create/use.
- `location` (string): Azure region for deployment.
- `data_factory_name` (string): Name of the Azure Data Factory instance.
- `storage_account_name` (string): Name of the Azure Storage Account.
- `linked_service_name` (string): Name of the linked service inside the Data Factory.

## Useful details
- All variables are typed as strings, ensuring type safety.
- Descriptions provide clarity on the purpose of each variable for easier maintenance.
- These variables should be paired with corresponding Azure resource definitions to modularize infrastructure code for Data Factory workflows and dependent storage accounts.