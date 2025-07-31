# variables.tf
## Overview
This Terraform variables file defines input parameters used to configure and create a server resource within a specified resource group and location. It centralizes key deployment settings such as server name, administrator credentials, and Azure Active Directory (AAD) details. This allows for more flexible and reusable Terraform configurations by separating configuration data from resource definitions.

## Table of Contents
1. [Prerequisites](#prerequisites)  
2. [Usage](#usage)  
3. [Methods](#methods)  
4. [Useful details](#useful-details)  

## Prerequisites
- Terraform CLI installed (version compatible with the Azure provider being used)
- Azure subscription with appropriate permissions to create resources
- Values for all variables (strings representing resource group, location, server credentials, and AAD info)

## Usage
To use these variables in a Terraform project, define values for them either by:
- Creating a `terraform.tfvars` file, e.g.:

```hcl
resource_group_name              = "my-resource-group"
location                         = "eastus"
server_name                     = "myserver"
server_administrator_login      = "adminuser"
server_administrator_login_password = "mySecretPassword123!"
aad_login_username              = "aadadmin@contoso.com"
object_id                       = "12345678-abcd-1234-abcd-123456789abc"
```

- Passing them as CLI arguments:

```bash
terraform apply -var="resource_group_name=my-resource-group" -var="location=eastus" ...
```

- Setting environment variables prefixed with `TF_VAR_`:

```bash
export TF_VAR_resource_group_name="my-resource-group"
```

Within Terraform resource definitions, these variables can be referenced as `${var.variable_name}`:

```hcl
resource "azurerm_sql_server" "example" {
  name                         = var.server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  administrator_login          = var.server_administrator_login
  administrator_login_password = var.server_administrator_login_password
  aad_administrator {
      login = var.aad_login_username
      object_id = var.object_id
  }
}
```

## Methods
Terraform variable blocks do not define methods or functions; they declare variables with:
- `type`: the data type (all are `string` here)
- `description`: a human-readable explanation of each variable’s purpose

## Useful details
- All variables are of type `string`, meaning each must be provided as a text value.
- Sensitive data like `server_administrator_login_password` should be provided securely, preferably through secrets management or environment variables.
- The `object_id` likely corresponds to an Azure AD object, used for assigning AAD administrator permissions.
- Proper values must be provided before applying the Terraform plan, or Terraform will prompt for them interactively.