variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure region where the resource group should be created."
  type        = string
}

variable "databricks_workspace_name" {
  description = "The name of the Azure Databricks workspace."
  type        = string
}