output "databricks_workspace_id" {
  value       = azurerm_databricks_workspace.main.id
  description = "The ID of the Databricks Workspace."
}
