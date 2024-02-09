variable "databricks_workspace_name" {
  description = "Specifies the name of the Databricks Workspace."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Databricks Workspace."
  type        = string
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists."
  type        = string
}

variable "sku" {
  description = "The SKU of the Databricks Workspace."
  type        = string
}
