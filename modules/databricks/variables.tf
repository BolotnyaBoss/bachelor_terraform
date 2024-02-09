variable "databricks_workspace_name" {
  description = "The name of the Databricks Workspace"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Databricks Workspace"
  type        = string
}

variable "location" {
  description = "The location/region where the Databricks Workspace is created"
  type        = string
}

# Add other necessary variables