# main.tf
## Overview
The `main.tf` file is a Terraform configuration file that defines and provisions an Azure SQL Server resource. It specifies the server name, location, resource group, version, administrator login credentials, and Azure AD administrator details.

This file is a part of a larger project that uses infrastructure-as-code to manage and provision Azure resources. It plays a crucial role in creating and managing Azure SQL Server instances.

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Usage](#usage)
3. [Methods](#methods)
4. [Useful details](#properties)

## Prerequisites
To use this file, the following prerequisites are required:
- Terraform installed on the local machine
- Azure subscription and appropriate permissions
- Access to the Azure Resource Manager

## Usage
To utilize this file in a project, follow these steps:
1. Set up the Terraform project and initialize the working directory.
2. Create a `variables.tf` file to define the required variables.
3. Define values for the variables in a `terraform.tfvars` file or as environment variables.
4. Run `terraform init` to initialize the project.
5. Run `terraform plan` to review the changes that will be made.
6. Run `terraform apply` to create the Azure SQL Server resource.

Example usage:
```hcl
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_mssql_server" "server" {
  name                         = var.server_name
  location                     = var.location
  resource_group_name          = var.resource_group_name
  version                      = "12.0"
  administrator_login          = var.server_administrator_login
  administrator_login_password = var.server_administrator_login_password

  azuread_administrator {
    login_username = var.aad_login_username
    object_id      = var.object_id
  }
}
```

## Methods
The `main.tf` file does not contain any methods or functions. It defines a single Terraform resource block `azurerm_mssql_server` that provisions an Azure SQL Server.

## Useful details
- The `name` parameter specifies the desired name for the Azure SQL Server.
- The `location` parameter defines the Azure region where the server will be created.
- The `resource_group_name` parameter specifies the name of the resource group where the server will be deployed.
- The `version` parameter sets the desired version of the SQL Server.
- The `administrator_login` and `administrator_login_password` parameters define the credentials for the server's administrator login.
- The `azuread_administrator` block specifies the Azure AD administrator details, including the login username and object ID.