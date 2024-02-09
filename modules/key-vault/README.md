# Azure Key Vault Module

This module deploys an Azure Key Vault.

## Usage

To use this module in your configuration, use the following syntax:

```hcl
module "key_vault" {
  source = "./modules/key-vault"

  key_vault_name      = "example-vault"
  location            = "West Europe"
  resource_group_name = "example-resources"
  sku_name            = "standard"
}
```

## Variables

- `key_vault_name`: Specifies the name of the Key Vault.
- `location`: Specifies the Azure location where the resource exists.
- `resource_group_name`: The name of the resource group in which to create the Key Vault.
- `sku_name`: The SKU used for this Key Vault.

## Outputs

- `key_vault_id`: The ID of the Key Vault.
