# main.tf
## Overview
The `main.tf` file is a Terraform configuration file that is used to define and deploy Azure storage resources. It includes the definition of a storage account, storage container, and storage blob. This file plays a role in provisioning and managing Azure storage resources for a software project.

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Usage](#usage)
3. [Methods](#methods)
4. [Useful details](#properties)

## Prerequisites
To use this file, the following prerequisites are required:
- Terraform installed (version X.X.X)
- Azure CLI installed (version X.X.X)
- Azure subscription and credentials

## Usage
To use this file in a project, follow these steps:
1. Create a new directory for your Terraform project.
2. Create a new `main.tf` file and copy the code provided into it.
3. Set the desired values for the variables `storage_account_name`, `resource_group_name`, `location`, `storage_container_name`, `bacpac_file_name`, and `bacpac_path`.
4. Initialize the Terraform project by running the command `terraform init`.
5. Authenticate with Azure by running the command `az login`.
6. Deploy the Azure storage resources by running the command `terraform apply`.

## Methods
This file defines three Terraform resources:

### azurerm_storage_account.sa
This resource represents an Azure storage account. It has the following properties:

- `name` (string): The name of the storage account.
- `resource_group_name` (string): The name of the resource group in which the storage account will be created.
- `location` (string): The Azure region where the storage account will be created.
- `account_tier` (string): The performance tier of the storage account. (default: "Standard")
- `account_replication_type` (string): The replication type of the storage account. (default: "LRS")

Example usage:
```
resource "azurerm_storage_account" "sa" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
```

### azurerm_storage_container.ct
This resource represents a container within an Azure storage account. It has the following properties:

- `name` (string): The name of the storage container.
- `storage_account_name` (string): The name of the parent storage account.
- `container_access_type` (string): The access type for the storage container. (default: "blob")

Example usage:
```
resource "azurerm_storage_container" "ct" {
  name                  = var.storage_container_name
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "blob"
}
```

### azurerm_storage_blob.blob
This resource represents a blob within an Azure storage container. It has the following properties:

- `name` (string): The name of the storage blob.
- `storage_account_name` (string): The name of the parent storage account.
- `storage_container_name` (string): The name of the parent storage container.
- `type` (string): The type of the storage blob. (default: "Block")
- `source` (string): The path to the source file for the storage blob.

Example usage:
```
resource "azurerm_storage_blob" "blob" {
  name                   = var.bacpac_file_name
  storage_account_name   = azurerm_storage_account.sa.name
  storage_container_name = azurerm_storage_container.ct.name
  type                   = "Block"
  source                 = var.bacpac_path
}
```

## Useful details
- The `azurerm_storage_account` resource represents the top-level storage account.
- The `azurerm_storage_container` resource is a child resource of the storage account and represents a container within the storage account.
- The `azurerm_storage_blob` resource is a child resource of the storage container and represents a blob within the storage container.
- The `var.` prefix in the code refers to Terraform input variables that can be defined in separate variable files or passed in as command-line arguments.