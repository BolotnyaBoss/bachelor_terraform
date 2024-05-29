# main.tf
## Overview
The `main.tf` file is a Terraform configuration file that defines the infrastructure for an Azure SQL Server. It uses the `azurerm_mssql_server` resource to create and manage the SQL Server instance. This file plays a role in the software project by providing the necessary infrastructure code to provision an Azure SQL Server.

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Usage](#usage)
3. [Methods](#methods)
4. [Useful details](#properties)

## Prerequisites
To use this file, the following dependencies are required:
- Terraform version 0.12 or higher
- Azure provider plugin for Terraform

## Usage
To use this configuration file in a project, follow these steps:
1. Ensure that the prerequisites are met.
2. Create a `main.tf` file and copy the provided code into it.
3. Set the values for the variables used in the code, such as `var.server_name` and `var.resource_group_name`.
4. Run `terraform init` to initialize the Terraform configuration.
5. Run `terraform apply` to provision the Azure SQL Server instance.

## Methods
The `main.tf` file defines a single resource block for `azurerm_mssql_server` resource. This resource creates and manages an Azure SQL Server. The available configuration options for this resource are as follows:

- `name`: Specifies the name of the SQL Server instance.
- `location`: Specifies the Azure region where the SQL Server will be deployed.
- `resource_group_name`: Specifies the name of the resource group where the SQL Server will be created.
- `version`: Specifies the version of the SQL Server to be deployed.
- `administrator_login`: Specifies the login username for the SQL Server administrator.
- `administrator_login_password`: Specifies the login password for the SQL Server administrator.

The resource block also includes an `azuread_administrator` block, which allows configuring an Azure AD administrator for the SQL Server. The available configuration options for this block are:

- `login_username`: Specifies the username for the Azure AD administrator.
- `object_id`: Specifies the object ID of the Azure AD user or group to be added as an administrator.

Example:
```terraform
resource "azurerm_mssql_server" "server" {
  name                         = "my-sql-server"
  location                     = "eastus"
  resource_group_name          = "my-resource-group"
  version                      = "12.0"
  administrator_login          = "admin"
  administrator_login_password = "P@ssw0rd"

  azuread_administrator {
    login_username = "aadadmin@example.com"
    object_id      = "abcd1234"
  }
}
```

## Useful details
- The `azurerm_mssql_server` resource creates an Azure SQL Server instance with the specified configuration.
- The resource block can be customized with additional settings and properties as required.
- The `main.tf` file can be extended to include other resources and configurations related to the Azure SQL Server, such as databases, firewall rules, and virtual network integration.