# docs/modules/data-factory/README.md

## Overview
The `data-factory` folder contains code written in HashiCorp Configuration Language (HCL) that is used to define resources in the Azure environment. This code specifically creates an Azure Data Factory (ADF) and links it to an Azure Blob Storage account. The purpose of this folder is to provide the necessary code and configuration to set up and manage the data factory and its associated resources in a software project.

## Usage
To utilize the code in this folder, follow these steps:

1. Ensure you have Terraform installed on your machine.
2. Open the `variables.tf.md` file and update the values of the variables according to your specific requirements. The variables include:
   - `resource_group_name`: The name of the resource group in which the storage account will be created.
   - `location`: The location where the storage account will be created.
   - `data_factory_name`: The name of the data factory instance.
   - `storage_account_name`: The name of the Azure Blob Storage account.
3. Open the `main.tf.md` file and review the code to understand the configuration being created for the data factory and its linked resources.
4. Run `terraform init` to initialize the Terraform configuration.
5. Run `terraform apply` to create the Azure Data Factory and link it to the Azure Blob Storage account.

## Useful details
- The code in this folder is written in HashiCorp Configuration Language (HCL), which is the language used by Terraform for defining infrastructure as code.
- The `azurerm_data_factory` resource is used to define the Azure Data Factory, while the `azurerm_data_factory_linked_service_azure_blob_storage` resource is used to establish the link between the data factory and the Azure Blob Storage account.
- The `data` block is used to retrieve information about an existing Azure Storage Account.
- Ensure that you have the necessary permissions and credentials to create and manage resources in the Azure environment before running the code in this folder.