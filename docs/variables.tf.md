# variables.tf
## Overview
This Terraform variables file defines a set of input variables related to Azure resources such as resource groups, storage accounts, SQL servers, databases, and Azure Data Factory components. It serves as a centralized place to parameterize infrastructure deployments, allowing the main Terraform configuration to be reused and customized easily across different environments or projects.

## Table of Contents
1. [Prerequisites](#prerequisites)  
2. [Usage](#usage)  
3. [Methods](#methods)  
4. [Useful details](#useful-details)  

## Prerequisites
- Terraform CLI installed (version compatible with Azure RM provider).  
- Azure RM provider configured in the main Terraform configuration.  
- Appropriate Azure permissions to create/manage resources like resource groups, storage accounts, SQL servers, and data factories.

## Usage
This file is typically used by referencing these variables in your Terraform resource definitions. Values for these variables can be supplied through:

- `terraform.tfvars` or any `.tfvars` file  
- CLI input using `-var` flag  
- Environment variables with prefix `TF_VAR_`

### Example: usage in main Terraform file
```hcl
resource "azurerm_storage_account" "example" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_sql_server" "example" {
  name                         = var.server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  administrator_login          = var.server_administrator_login
  administrator_login_password = var.server_administrator_login_password
}

resource "azurerm_data_factory" "example" {
  name                = var.data_factory_name
  resource_group_name = var.resource_group_name
  location            = var.location
}
```

## Methods
This file declares variables but does not contain any methods or functions. Each `variable` block defines:

- `type`: Expected data type, here all are strings.  
- `description`: Provides context on what value is expected, useful for documentation and CLI help.

## Useful details
- Variables cover critical resources needed for deploying an Azure-based data solution including storage, database, and data factory.  
- Sensitive information such as password should be handled securely, for example via environment variables or secret management tools.  
- Naming conventions in variables like `storage_account_name` and `server_name` enforce consistency across resources.  
- The variable names are descriptive and directly map to common Azure resource properties for easier mapping during deployment.

This modular setup helps ensure your Terraform infrastructure is parameterized and flexible for different environments.