variable "resource_group_name" {
  type        = string
  description = "The name of the resource group."
}

variable "location" {
  type        = string
  description = "The Azure region where the key vault should be created."
}

variable "key_vault_name" {
  type        = string
  description = "The name of the key vault."
}

variable "sku_name" {
  type        = string
  description = "The name of the key vault SKU."
}
