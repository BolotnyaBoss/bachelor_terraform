# Project Overview

This repository contains Terraform modules for deploying resources to Azure.

## Modules

- **Key Vault**: The module can be found under `modules/key-vault` and is responsible for creating and managing Azure Key Vault resources.
- **Databricks**: The module can be found under `modules/databricks` and is used to create and manage Azure Databricks Workspace resources.

## Usage

To use these modules in your Terraform environment, reference them in your `main.tf` file with the required variables. For more details on the input variables, refer to the `variables.tf` file in each module directory.

For example, to use the Key Vault module:

```hcl
module "key-vault" {
  source = "./modules/key-vault"

  key_vault_name      = "your-key-vault-name"
  resource_group_name = "your-resource-group-name"
  location            = "your-location"
}
```

And for the Databricks module:

```hcl
module "databricks" {
  source = "./modules/databricks"

  databricks_workspace_name = "your-databricks-workspace-name"
  resource_group_name       = "your-resource-group-name"
  location                  = "your-location"
}
```

Please ensure you have the Azure provider configured in your Terraform setup:

```hcl
provider "azurerm" {
  features {}
}
```