output "name" {
  value       = azurerm_resource_group.rg.name
  description = "Resource Group name"
}

output "location" {
  value       = azurerm_resource_group.rg.location
  description = "Resource Group Azure region"
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = "eastus"
}

variable "resource_group_name" {
  type        = string
  description = "The name of resource group"
}

variable "location" {
  type        = string
  description = "The location of resource group"
}
