# Key Vault Module

This Terraform module deploys an Azure Key Vault.

## Usage

To use this module in your Terraform environment, reference it in your main.tf file with the proper variables.

```
module "key_vault" {
  source = "./modules/key-vault"

  key_vault_name     = "your-key-vault-name"
  resource_group_name = "your-resource-group-name"
  location            = "your-location"
}
```

Refer to the variables.tf file for more details on the input variables.