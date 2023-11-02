variable "resource_group_name" {
  description = "The name of the resource group in which to create the Key Vault"
  type        = string
}

variable "location" {
  description = "The location where the Key Vault should be created"
  type        = string
}

variable "key_vault_name" {
  description = "The name of the Key Vault"
  type        = string
}
