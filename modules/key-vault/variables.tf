variable "key_vault_name" {
  description = "Specifies the name of the Key Vault"
  type = string
}

variable "location" {
  description = "Specifies the supported Azure location where the resource should be created."
  type = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Key Vault"
  type = string
}

variable "tenant_id" {
  description = "The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault."
  type = string
}

variable "sku_name" {
  description = "The Name of the SKU used for this Key Vault"
  type = string
}
