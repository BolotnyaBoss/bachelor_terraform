# main.tf
## Overview
This Terraform configuration file provisions an Azure SQL Server using the `azurerm_mssql_server` resource. It sets up a SQL Server instance with specified administrative credentials and configures an Azure Active Directory (AAD) administrator for integrated identity management. This file is typically part of an infrastructure-as-code project to automate Azure resource deployment.

## Table of Contents
1. [Prerequisites](#prerequisites)  
2. [Usage](#usage)  
3. [Methods](#methods)  
4. [Useful details](#useful-details)  

## Prerequisites
- Terraform 0.12+  
- Azure CLI or appropriate Azure authentication setup for Terraform  
- `azurerm` provider configured in the project (usually declared in `provider.tf`):
  ```hcl
  terraform {
    required_providers {
      azurerm = {
        source  = "hashicorp/azurerm"
        version = "~> 3.0"
      }
    }
  }
  provider "azurerm" {
    features {}
  }
  ```
- Variables used in this file (`server_name`, `location`, `resource_group_name`, `server_administrator_login`, `server_administrator_login_password`, `aad_login_username`, `object_id`) should be defined in a variables file or passed during runtime.

## Usage
- Define the required variables in a `variables.tf` or input them when applying the Terraform plan.  
- Run `terraform init` to initialize the providers.  
- Run `terraform plan` to view changes.  
- Run `terraform apply` to create the Azure SQL Server with the specified configuration.

Example usage snippet:
```hcl
variable "server_name" { default = "my-sql-server" }
variable "location" { default = "eastus" }
variable "resource_group_name" { default = "my-resource-group" }
variable "server_administrator_login" { default = "sqladmin" }
variable "server_administrator_login_password" { default = "P@ssw0rd!" }
variable "aad_login_username" { default = "admin@mytenant.onmicrosoft.com" }
variable "object_id" { default = "00000000-0000-0000-0000-000000000000" }
```

## Methods
Terraform resource block configuration (no explicit methods); key parameters:

- `name`: (string) The name assigned to the SQL Server instance.  
- `location`: (string) Azure region for resource deployment.  
- `resource_group_name`: (string) Resource group under which the server is created.  
- `version`: (string) SQL Server version, hardcoded as `"12.0"`.  
- `administrator_login`: (string) SQL Administrator login name.  
- `administrator_login_password`: (string) Password for the administrator login.  

The `azuread_administrator` block configures Azure Active Directory authentication with:  
- `login_username`: (string) AAD administrator's login username.  
- `object_id`: (string) Azure AD object ID corresponding to the AAD administrator.

## Useful details
- The resource creates an Azure SQL Server, not an individual database; databases must be created separately.  
- Azure AD admin setup enables integrating Azure Active Directory identities for managing the SQL Server.  
- Passwords and sensitive information should be securely managed, ideally using secrets or environment variables instead of hardcoded values.