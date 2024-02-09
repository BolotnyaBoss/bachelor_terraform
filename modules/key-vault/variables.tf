variable "key_vault_name" {
  description = "The name of the key vault"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the key vault"
  type        = string
}

variable "location" {
  description = "The location/region where the key vault is created"
  type        = string
}

# Add other necessary variables