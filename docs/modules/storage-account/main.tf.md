# main.tf
## Overview
The `main.tf` file is a Terraform configuration file that defines the infrastructure resources to be provisioned on the Azure cloud platform. It specifies the creation of an Azure Storage Account, Storage Container, and Storage Blob.
## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Usage](#usage)
3. [Methods](#methods)
4. [Useful details](#properties)
## Prerequisites
To use this file, the following prerequisites are required:
- Terraform installed (version X.X.X)
- Azure CLI installed (version X.X.X)
- Azure subscription and appropriate permissions
## Usage
1. Ensure that the Azure CLI is logged in and the desired Azure subscription is selected.
2. Set the necessary input variables in a separate `variables.tf` file or by passing them through the command line when running Terraform commands.
3. Initialize the Terraform configuration by running the command `terraform init`.
4. View the planned changes by running the command `terraform plan`.
5. Apply the changes and provision the resources by running the command `terraform apply`.
6. To destroy the provisioned resources, run the command `terraform destroy`.
## Methods
This file does not contain any methods or functions. It defines Terraform resources using the Azure provider. The resources defined in this file are:
### azurerm_storage_account
This resource specifies the creation of an Azure Storage Account. It requires the following parameters:
- `name`: The name of the storage account (string)
- `resource_group_name`: The name of the resource group where the storage account will be created (string)
- `location`: The Azure region where the storage account will be located (string)
- `account_tier`: The performance tier for the storage account (string, default: "Standard")
- `account_replication_type`: The replication type for the storage account (string, default: "LRS")
### azurerm_storage_container
This resource specifies the creation of an Azure Storage Container within the previously created storage account. It requires the following parameters:
- `name`: The name of the storage container (string)
- `storage_account_name`: The name of the storage account where the container will be created (string)
- `container_access_type`: The access type for the container (string, default: "blob")
### azurerm_storage_blob
This resource specifies the creation of an Azure Storage Blob within the previously created storage account and container. It requires the following parameters:
- `name`: The name of the storage blob (string)
- `storage_account_name`: The name of the storage account where the blob will be created (string)
- `storage_container_name`: The name of the storage container where the blob will be created (string)
- `type`: The type of the blob (string, default: "Block")
- `source`: The source path for the blob (string)
## Useful details
- The `azurerm_storage_account` resource is created with a standard performance tier and locally redundant storage (LRS) replication type.
- The `azurerm_storage_container` resource is created with a container access type of "blob".
- The `azurerm_storage_blob` resource is created with a blob type of "Block" and requires a source path to be specified.