# Databricks Module

This Terraform module deploys an Azure Databricks Workspace.

## Usage

To use this module in your Terraform environment, reference it in your main.tf file with the proper variables.

```
module "databricks" {
  source = "./modules/databricks"

  databricks_workspace_name = "your-databricks-workspace-name"
  resource_group_name       = "your-resource-group-name"
  location                  = "your-location"
}
```

Refer to the variables.tf file for more details on the input variables.