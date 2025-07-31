# main.tf
## Overview
This Terraform configuration file provisions Azure Storage resources including a Storage Account, a Storage Container, and a Storage Blob. It is primarily used to set up and manage cloud storage infrastructure in Azure, typically as part of deployment or infrastructure-as-code workflows.

## Table of Contents
1. [Prerequisites](#prerequisites)  
2. [Usage](#usage)  
3. [Methods](#methods)  
4. [Useful details](#useful-details)  

## Prerequisites
- Terraform installed (version compatible with AzureRM provider)
- AzureRM provider configured with appropriate credentials and permissions
- Variables defined for:
  - `storage_account_name` (string): Name of the Azure Storage Account
  - `resource_group_name` (string): Azure Resource Group to deploy resources into
  - `location` (string): Azure region for the resources (e.g., "eastus")
  - `storage_container_name` (string): Name of the blob container
  - `bacpac_file_name` (string): Name of the blob file to upload
  - `bacpac_path` (string): Local path to the file to be uploaded as blob

## Usage
Before applying this Terraform configuration, ensure all variables are set, either via a `terraform.tfvars` file, environment variables, or CLI input.

Example command to initialize and deploy:
```bash
terraform init
terraform apply -var="storage_account_name=mystorageacct" \
                -var="resource_group_name=myResourceGroup" \
                -var="location=eastus" \
                -var="storage_container_name=mycontainer" \
                -var="bacpac_file_name=mydatabase.bacpac" \
                -var="bacpac_path=./local/path/to/mydatabase.bacpac"
```

This will create:
- An Azure Storage Account with Standard LRS replication.
- A blob container with public blob access.
- A block blob stored inside the container, uploading a local `.bacpac` file.

## Methods
This Terraform file does not define functions or methods, but rather resource blocks representing infrastructure components:

- `azurerm_storage_account.sa`:  
  Creates a Storage Account with the specified name, resource group, location, and replication strategy.

- `azurerm_storage_container.ct`:  
  Creates a Blob Container in the Storage Account. The container access type is set to "blob," allowing public read access to blobs.

- `azurerm_storage_blob.blob`:  
  Uploads a block blob to the storage container. The blob's source is a local file specified by `bacpac_path`.

## Useful details
- The storage account uses **Standard** performance tier and **Locally-Redundant Storage (LRS)** replication, suitable for cost-effective and geo-redundant storage within a region.
- Container access set to `"blob"` means blobs inside it can be accessed publicly, but the container metadata is private.
- The block blob type is typically used for files that require efficient upload and download; appropriate for `.bacpac` files used for database import/export.
- This setup is commonly used for hosting database backups or deployment artifacts in a CI/CD pipeline or infrastructure setup scripts.