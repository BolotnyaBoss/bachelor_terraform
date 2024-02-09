# Azure Databricks Module

This module deploys an Azure Databricks Workspace.

## Usage

To use this module in your configuration, use the following syntax:

```hcl
module "databricks" {
  source = "./modules/databricks"

  databricks_workspace_name = "example-workspace"
  location                  = "West Europe"
  resource_group_name       = "example-resources"
  sku                       = "standard"
}
```

## Variables

- `databricks_workspace_name`: Specifies the name of the Databricks Workspace.
- `resource_group_name`: The name of the resource group in which to create the Databricks Workspace.
- `location`: Specifies the Azure location where the resource exists.
- `sku`: The SKU of the Databricks Workspace.

## Outputs

- `databricks_workspace_id`: The ID of the Databricks Workspace.
