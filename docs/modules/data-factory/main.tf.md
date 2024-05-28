# main.tf
## Overview
The `main.tf` file is used in an Azure infrastructure project to define and configure various resources such as storage accounts and data factories. It is written in HashiCorp Configuration Language (HCL) and is used by Terraform to provision and manage the infrastructure.

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Usage](#usage)
3. [Methods](#methods)
4. [Useful details](#properties)

## Prerequisites
To use the `main.tf` file, the following prerequisites are required:
- Terraform installed on the system
- Azure subscription and credentials
- Azure CLI installed and configured

## Usage
To use the `main.tf` file, follow these steps:
1. Configure the required variables in a separate `variables.tf` file.
2. Initialize Terraform by running the following command in the project directory:
   ```
   terraform init
   ```
3. Create an execution plan by running the following command:
   ```
   terraform plan
   ```
4. Apply the changes and provision the infrastructure by running the following command:
   ```
   terraform apply
   ```

## Methods
The `main.tf` file contains the following methods and resources:

### 1. `azurerm_storage_account` data source
This data source retrieves information about an existing Azure Storage Account. It takes the following parameters:
- `name`: The name of the storage account.
- `resource_group_name`: The name of the resource group where the storage account is located.

Example:
```hcl
data "azurerm_storage_account" "example" {
  name                = var.storage_account_name
  resource_group_name = var.resource_group_name
}
```

### 2. `azurerm_data_factory` resource
This resource creates an Azure Data Factory. It takes the following parameters:
- `name`: The name of the data factory.
- `location`: The Azure region where the data factory should be created.
- `resource_group_name`: The name of the resource group where the data factory should be created.

Example:
```hcl
resource "azurerm_data_factory" "adf" {
  name                = var.data_factory_name
  location            = var.location
  resource_group_name = var.resource_group_name
}
```

### 3. `azurerm_data_factory_linked_service_azure_blob_storage` resource
This resource creates a linked service to an Azure Blob Storage account within an Azure Data Factory. It takes the following parameters:
- `name`: The name of the linked service.
- `data_factory_id`: The ID of the Azure Data Factory.
- `connection_string`: The connection string to the Azure Blob Storage account.

Example:
```hcl
resource "azurerm_data_factory_linked_service_azure_blob_storage" "adf-ls" {
  name              = var.linked_service_name
  data_factory_id   = azurerm_data_factory.adf.id
  connection_string = data.azurerm_storage_account.example.primary_connection_string
}
```

## Useful details
- The `main.tf` file is typically used along with other Terraform configuration files to define the entire infrastructure.
- Ensure that the required Azure resource provider is registered before using this file.
- It is recommended to use version control to track changes to the `main.tf` file and collaborate with other team members.