# outputs.tf
## Overview
This Terraform outputs file defines a single output variable named `id` that exposes the resource ID of an Azure SQL Server (`azurerm_mssql_server.server`). Its primary purpose is to make this resource’s ID available for use elsewhere, such as in other modules or for displaying after deployment. This facilitates referencing the created SQL Server in downstream configurations or automation scripts within the larger infrastructure-as-code project.

## Table of Contents
1. [Prerequisites](#prerequisites)  
2. [Usage](#usage)  
3. [Methods](#methods)  
4. [Useful details](#useful-details)

## Prerequisites
- Terraform CLI (version depends on the broader project, typically >= 0.12)  
- Azure Provider configured with access to manage Azure SQL resources (`azurerm` provider)  
- An existing Terraform resource block named `azurerm_mssql_server.server` defined elsewhere in the Terraform codebase

## Usage
After applying Terraform configuration that creates an Azure SQL Server resource referred to as `server`, this output allows you to:

- Retrieve the resource ID for further reference  
- Pass the output to other Terraform modules or scripts  
- Display the ID after deployment for validation or manual use

Example usage in another Terraform module or script:

```hcl
module "sql_server" {
  source = "./modules/sql_server"
  # module input variables here
}

output "sql_server_id" {
  value = module.sql_server.id
}
```

After running `terraform apply`, query the output value:

```bash
terraform output id
```

## Methods
This file does not contain functions or methods as it is a Terraform outputs configuration file. It declares one output block:

- **output "id"**  
  - **value**: References the ID attribute of the Azure SQL Server Terraform resource `azurerm_mssql_server.server.id`.  
  - **description**: Describes the output as the "ID of SQL Server".

## Useful details
- Outputs are a key part of Terraform modules for exposing important resource details.  
- The resource ID is generally a stable identifier that is useful to integrate with other Azure resources, policies, or scripts.  
- Make sure that the referenced resource `azurerm_mssql_server.server` exists in the same Terraform state or is output from an upstream module.