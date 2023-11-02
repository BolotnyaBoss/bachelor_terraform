```terraform
variable "key_vault_name" {
  description = "Specifies the name of the Key Vault. Changing this forces a new resource to be created."
  type        = string
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Key Vault. Changing this forces a new resource to be created."
  type        = string
}
```