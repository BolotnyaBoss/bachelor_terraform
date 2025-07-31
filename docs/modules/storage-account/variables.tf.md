# variables.tf
## Overview
This Terraform variables file defines input parameters required to provision and manage cloud storage resources and database deployment artifacts within a given resource group and location. It centralizes configuration for storage account, container, and database backup file details, making the Terraform scripts modular, reusable, and easier to manage in infrastructure-as-code projects.

## Table of Contents
1. [Prerequisites](#prerequisites)  
2. [Usage](#usage)  
3. [Methods](#methods)  
4. [Useful details](#useful-details)  

## Prerequisites
- Terraform installed (v0.12+ recommended for type support)
- Access and permissions to an Azure subscription (assumed from variable context)
- A backend or provider configured for deploying resources in Azure

## Usage
These variables are intended to be referenced within Terraform resource blocks or modules. To use, declare these variables in the root module or pass overrides during terraform plan/apply.

Example usage in a Terraform module:

```hcl
module "storage" {
  source               = "./modules/storage"
  resource_group_name  = var.resource_group_name
  location             = var.location
  storage_account_name = var.storage_account_name
  storage_container_name = var.storage_container_name
}

resource "azurerm_storage_blob" "bacpac" {
  name                   = var.bacpac_file_name
  storage_account_name   = var.storage_account_name
  storage_container_name = var.storage_container_name
  source                 = "${var.bacpac_path}/${var.bacpac_file_name}"
}
```

Variables can be overridden via `terraform.tfvars` or CLI:

```hcl
resource_group_name       = "myResourceGroup"
location                  = "eastus"
storage_account_name      = "mystorageacct"
storage_container_name    = "mycontainer"
bacpac_file_name          = "backup.bacpac"
bacpac_path               = "./db_backups"
```

## Methods
This file contains variable declarations only, so no methods or functions are defined here.

## Useful details
- All variables are typed as `string` and have clear descriptions, ensuring easy comprehension and validation.
- Variables relate primarily to Azure resource provisioning for storage and database backup deployment.
- This modular variable approach improves code reuse across different environments by simply changing variable values without modifying resource logic.