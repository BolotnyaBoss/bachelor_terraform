# Terraform Azure Modules

## Introduction

This repository contains Terraform modules for deploying resources in Azure. The modules are designed to be reusable and provide a simplified interface for deploying resources like Resource Groups, Storage Accounts, SQL Servers, SQL Databases, and Data Factories.

## Requirements

- Terraform 0.12.x or newer
- Azure subscription

## Usage

To use the modules in this repository, reference them in your Terraform configuration with the appropriate source path and provide the required input variables.

Example:

```hcl
module "storage-account" {
  source                = "./modules/storage-account"

  resource_group_name    = "example-resource-group"
  location               = "West Europe"
  storage_account_name   = "examplestorageaccount"
  storage_container_name = "examplecontainer"
  bacpac_file_name       = "example.bacpac"
  bacpac_path            = "path/to/bacpac/file"
}
```

## Modules

- `resource-group`: Manages Azure Resource Groups.
- `storage-account`: Manages Azure Storage Accounts and Containers.
- `sql-server`: Manages Azure SQL Servers and their configurations.
- `sql-database`: Manages Azure SQL Databases and their imports.
- `data-factory`: Manages Azure Data Factory instances and linked services.

## Outputs

Each module provides outputs that can be used in other parts of your Terraform configuration. See the `outputs.tf` file in each module directory for details.

## Contributors

To contribute to this repository, please create a pull request with your proposed changes or fixes. Ensure that your code adheres to the repository's conventions and has sufficient documentation and tests.

Thank you for your contributions!